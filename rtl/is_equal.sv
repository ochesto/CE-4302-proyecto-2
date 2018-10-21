`timescale 1ns / 1ps
module is_equal #( parameter WIDTH = 32)
(
	input logic ENABLE,
	input logic [WIDTH-1:0] DATA_IN_1,
    input logic [WIDTH-1:0] DATA_IN_2,
	output logic EQUAL
);

logic [WIDTH-1:0] result;

always_comb begin
	if( ENABLE ) begin
		result = 1'b1;
	end
	else begin
		result = (DATA_IN_1==DATA_IN_2) ? 1'b1 : 1'b0;
	end
end

assign EQUAL = result;

endmodule