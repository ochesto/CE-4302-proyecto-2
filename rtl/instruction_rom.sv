`timescale 1ns / 1ps
module instruction_rom #( parameter WIDTH = 32)
(
	input logic CLK,
	input logic RESET,
	input logic [WIDTH-1:0] ADDRESS,
	output logic [WIDTH-1:0] INSTR
);

logic [WIDTH-1:0] temp_instr;

always@( posedge CLK or posedge RESET or posedge ADDRESS ) begin
	if( RESET ) temp_instr <= 32'bx;
	else begin
		case (ADDRESS/48'd4)
			32'H00000000: temp_instr <= 32'd1;
			32'H00000001: temp_instr <= 32'd2;
			32'H00000002: temp_instr <= 32'd3;
			32'H00000003: temp_instr <= 32'd4;
			default: temp_instr <= 32'b0;
		endcase
	end
end

assign INSTR = temp_instr;

endmodule