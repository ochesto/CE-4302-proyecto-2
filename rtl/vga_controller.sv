module vga_controller(iRST_n,
                      iVGA_CLK,
                      oBLANK_n,
                      oHS,
                      oVS,
                      b_data,
                      g_data,
                      r_data,
							 ADDROUT,
							 readData);
input iRST_n;
input iVGA_CLK;
input [31:0] readData;
output reg oBLANK_n;
output reg oHS;
output reg oVS;
output [7:0] b_data;
output [7:0] g_data;  
output [7:0] r_data; 
output [18:0] ADDROUT;                       
///////// ////                     
reg [18:0] ADDR;
reg [1:0] counter;
reg [23:0] bgr_data;
wire VGA_CLK_n;
wire [31:0] index;
wire [23:0] bgr_data_raw;
wire cBLANK_n,cHS,cVS,rst;

wire [31:0] outRam;
////
assign rst = ~iRST_n;
video_sync_generator LTM_ins (.vga_clk(iVGA_CLK),
                              .reset(rst),
                              .blank_n(cBLANK_n),
                              .HS(cHS),
                              .VS(cVS));
////
////Addresss generator
always@(posedge iVGA_CLK,negedge iRST_n)
begin
  if (!iRST_n)
		begin
			ADDR<=19'd0;
			counter<=0;
		end
  else if (cHS==1'b0 && cVS==1'b0) begin
	  counter<=counter;
     ADDR<=19'd0;
  end
  else if (cBLANK_n==1'b1) begin
		if(counter==2'b11)
			begin
				counter<=0;
				ADDR<=ADDR+1;
			end
		else
		begin
			ADDR<=ADDR;
			counter<=counter+1;
		end
	end

end
//////////////////////////
//////INDEX addr.

assign VGA_CLK_n = ~iVGA_CLK;
/*
img_data	img_data_inst (
	.address ( ADDR ),
	.clock ( VGA_CLK_n ),
	.q ( bgr_data_raw)
	);
//////Color table output
*/




img_index	img_index_inst (
	.address ( index[7:0] ),
	.clock ( iVGA_CLK ),
	.q ( bgr_data_raw)
	);	




selector_chunk sc(
.SELECT (counter[1:0]),
.DATA(readData),
.OUT(index)
);

//////
//////latch valid data at falling edge;
always@(posedge VGA_CLK_n) bgr_data <= bgr_data_raw;
assign b_data = bgr_data[23:16];
assign g_data = bgr_data[15:8];
assign r_data = bgr_data[7:0];
///////////////////
//////Delay the iHD, iVD,iDEN for one clock cycle;
always@(negedge iVGA_CLK)
begin
  oHS<=cHS;
  oVS<=cVS;
  oBLANK_n<=cBLANK_n;
end

assign ADDROUT=ADDR;

endmodule