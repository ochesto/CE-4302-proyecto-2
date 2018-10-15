`timescale 1ns / 1ps
module mux_2x1 #( parameter WIDTH = 32)
(
    input logic SELECT,
	input logic [WIDTH-1:0] DATA_IN_1,
    input logic [WIDTH-1:0] DATA_IN_2,
	output logic [WIDTH-1:0] DATA_OUT
);

assign DATA_OUT = (SELECT) ? DATA_IN_2 : DATA_IN_1;

endmodule