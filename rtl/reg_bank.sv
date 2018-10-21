`timescale 1ns / 1ps
/**
Register Bank: it will contain all
intermediate values used during the execution of the program.
*/
module reg_bank #( 
    parameter WIDTH = 32,
    parameter TOTAL_REGS = 32 )
(
    input logic CLK,
    input logic WE3,
    input logic [5-1:0] RA1,
    input logic [5-1:0] RA2,
    input logic [5-1:0] RA3,
    input logic [WIDTH-1:0] WD3,
    output logic [WIDTH-1:0] RD1,
    output logic [WIDTH-1:0] RD2
);

logic [WIDTH-1:0] rb[TOTAL_REGS-1:0];
initial begin
    for (int i=0; i<TOTAL_REGS; i++) begin
        rb[i] = i;
    end 
end

always@(posedge CLK) begin
	if( WE3 ) rb[RA3] <= WD3;
end

assign RD1 = rb[RA1];
assign RD2 = rb[RA2];

endmodule