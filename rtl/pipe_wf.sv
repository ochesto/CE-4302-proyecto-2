`timescale 1ns / 1ps
module pipe_wf #( parameter WIDTH = 32 )
(
    input CLK,
    input CLR,
    input [WIDTH-1:0] PC,
    output [WIDTH-1:0] PC_F
);

logic [31:0] temp_pc;

initial begin
    temp_pc = {32{1'b0}};
end

always@( negedge CLK or posedge CLR) begin
    if( CLR ) begin
        temp_pc = {32{1'b0}};
    end
    else begin
        temp_pc = PC;
    end
end

assign PC_F = temp_pc;

endmodule