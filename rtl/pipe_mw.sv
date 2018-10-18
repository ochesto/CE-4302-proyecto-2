`timescale 1ns / 1ps
module pipe_mw #( parameter WIDTH = 32 )
(
    input logic CLK,
    input logic CLR,
    input logic REG_WRITE_M,
    input logic MEM_TO_REG_M,
    input logic [WIDTH-1:0] MEM_RD_M,
    input logic [WIDTH-1:0] ALU_OUT_M,

    output logic REG_WRITE_W,
    output logic MEM_TO_REG_W,
    output logic [WIDTH-1:0] MEM_RD_W,
    output logic [WIDTH-1:0] ALU_OUT_W
);

logic temp_regwrite;
logic temp_memtoreg;
logic [WIDTH-1:0] temp_memrd;
logic [WIDTH-1:0] temp_aluout;

initial begin
    temp_regwrite = 1'b0;
    temp_memtoreg = 1'b0;
    temp_memrd = {32{1'b0}};
    temp_aluout = {32{1'b0}};
end

always@( negedge CLK or posedge CLR ) begin
    if( CLR ) begin
        temp_regwrite = 1'b0;
        temp_memtoreg = 1'b0;
        temp_memrd = {32{1'b0}};
        temp_aluout = {32{1'b0}};
    end
    else begin
        temp_regwrite = REG_WRITE_M;
        temp_memtoreg = MEM_TO_REG_M;
        temp_memrd = MEM_RD_M;
        temp_aluout = ALU_OUT_M;
    end
end

assign REG_WRITE_W = temp_regwrite;
assign MEM_TO_REG_W = temp_memtoreg;
assign MEM_RD_W = temp_memrd;
assign ALU_OUT_W = temp_aluout;

endmodule