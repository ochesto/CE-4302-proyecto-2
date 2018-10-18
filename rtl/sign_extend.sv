`timescale 1ns / 1ps
module sign_extend #( parameter WIDTH = 32)
(
	input logic [15:0] DATA,
	output logic [WIDTH-1:0] EXTENDED
);

assign EXTENDED = {{16{DATA[15]}},DATA[15:0]};

endmodule