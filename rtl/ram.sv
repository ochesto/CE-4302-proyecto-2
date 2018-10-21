`timescale 1ns / 1ps
module ram #( parameter WIDTH = 32 )
(
    input logic CLK, 
    input logic WE,
	input logic [WIDTH-1:0] ADDRESS, 
    input logic [WIDTH-1:0] WD,
	output logic [WIDTH-1:0] RD
);

	//(* ram_init_file = "mem_pic.mif" *) logic [SIZE-1:0] RAM[63:0];
	logic [WIDTH-1:0] RAM[0:1024];
	initial begin
		for( int i=0; i < 1024; i++ ) begin
			RAM[i] = i;
		end
	end

	always @ (posedge CLK) begin
		if (WE) RAM[ ADDRESS ] <= WD;
	end

	assign RD = RAM[ ADDRESS ];

endmodule