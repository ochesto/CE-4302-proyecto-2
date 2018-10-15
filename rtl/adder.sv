`timescale 1ns / 1ps
module adder #( parameter WIDTH = 32)
(
	input logic [WIDTH-1:0] DATA_IN_1,
    input logic [WIDTH-1:0] DATA_IN_2,
	output logic [WIDTH-1:0] DATA_OUT
);

assign DATA_OUT = DATA_IN_1 + DATA_IN_2;

endmodule