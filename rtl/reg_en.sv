`timescale 1ns / 1ps
module reg_en #( parameter WIDTH = 32)
(
	input logic CLK,
	input logic ENABLE,
	input logic [WIDTH-1:0] DATA_IN,
	output logic [WIDTH-1:0] DATA_OUT
);

logic [WIDTH-1:0] data;

initial begin
    data = 0;
end

always@(posedge CLK) begin
    if( ENABLE ) begin
        data = DATA_IN;
    end
end

assign DATA_OUT = data;

endmodule