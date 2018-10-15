`timescale 1ns / 1ps
module instruction_rom #( parameter WIDTH = 32)
(
	input logic CLK,
	input logic Reset,
	input logic [WIDTH-1:0] Address,
	output logic [WIDTH-1:0] Instr
);

always@(posedge CLK) begin
	if( Reset ) Instr <= 32'bx;
	else begin
		case (Address/48'd4)
			32'H00000000: Instr <= 32'd1;
			32'H00000001: Instr <= 32'd2;
			32'H00000002: Instr <= 32'd3;
			32'H00000003: Instr <= 32'd4;
			default: Instr <= 32'b0;
		endcase
	end
end
endmodule