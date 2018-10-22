module selector_chunk #(parameter WIDTH=32)
(
input logic [1:0] SELECT, 
input logic [WIDTH-1:0] DATA,
output logic [WIDTH-1:0] OUT
);

parameter OP1=2'b00;
parameter OP2=2'b01;
parameter OP3=2'b10;
parameter OP4=2'b11;

logic [WIDTH-1:0] result;

always_comb begin 
	case(SELECT) 
		OP1:begin
			result={{24{1'b0}},DATA[7:0]};
		end
		OP2:begin
			result={{24{1'b0}},DATA[15:8]};
		end
		OP3:begin
			result={{24{1'b0}},DATA[23:16]};
		end
		OP4:begin
			result={{24{1'b0}},DATA[31:24]};
		end
	endcase

end

assign OUT=result;



endmodule

