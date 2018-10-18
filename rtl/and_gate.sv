`timescale 1ns / 1ps
module and_gate
(
	input logic DATA_IN_1,
    input logic DATA_IN_2,
	output logic DATA_OUT
);

assign DATA_OUT = DATA_IN_2 && DATA_IN_1;

endmodule