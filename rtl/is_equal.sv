`timescale 1ns / 1ps
module is_equal #( parameter WIDTH = 32)
(
	input logic [WIDTH-1:0] DATA_IN_1,
    input logic [WIDTH-1:0] DATA_IN_2,
	output logic EQUAL
);

assign EQUAL = (DATA_IN_1==DATA_IN_2) ? 1'b1 : 1'b0;

endmodule