`timescale 1ns / 1ps
module shifter #( parameter WIDTH = 32)
(
	input logic [WIDTH-1:0] DATA,
	output logic [WIDTH-1:0] SHIFTED
);

assign SHIFTED = {DATA[WIDTH-1-2:0],{2{1'b0}}};

endmodule