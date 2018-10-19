`timescale 1ns / 1ps
module pipe_em #( parameter WIDTH = 32 )
(
    input logic CLK,
    input logic CLR,
    input logic REG_WRITE_E,
    input logic MEM_TO_REG_E,
    input logic MEM_WRITE_E,
    input logic [WIDTH-1:0] ALU_OUT_E,
    input logic [4:0] WRITE_REG_E,
    input logic [WIDTH-1:0] WRITE_DATA_E,

    output logic REG_WRITE_M,
    output logic MEM_TO_REG_M,
    output logic MEM_WRITE_M,
    output logic [WIDTH-1:0] ALU_OUT_M,
    output logic [4:0] WRITE_REG_M,
    output logic [WIDTH-1:0] WRITE_DATA_M
);

logic temp_regwrite;
logic temp_memtoreg;
logic temp_memwrite;
logic [WIDTH-1:0] temp_aluout;
logic [4:0] temp_writereg;
logic [WIDTH-1:0] temp_writedata;

initial begin
    temp_regwrite = 1'b0;
    temp_memtoreg = 1'b0;
    temp_memwrite = 1'b0;
    temp_aluout = {32{1'b0}};
    temp_writereg = {5{1'b0}};
    temp_writedata = {32{1'b0}};
end

always@( negedge CLK or posedge CLR ) begin
    if( CLR ) begin
        temp_regwrite = 1'b0;
        temp_memtoreg = 1'b0;
        temp_memwrite = 1'b0;
        temp_aluout = {32{1'b0}};
        temp_writereg = {5{1'b0}};
        temp_writedata = {32{1'b0}};
    end
    else begin
        temp_regwrite = REG_WRITE_E;
        temp_memtoreg = MEM_TO_REG_E;
        temp_memwrite = MEM_WRITE_E;
        temp_aluout = ALU_OUT_E;
        temp_writereg = WRITE_REG_E;
        temp_writedata = WRITE_DATA_E;
    end
end

assign REG_WRITE_M = temp_regwrite;
assign MEM_TO_REG_M = temp_memtoreg;
assign MEM_WRITE_M = temp_memwrite;
assign ALU_OUT_M = temp_aluout;
assign WRITE_REG_M = temp_writereg;
assign WRITE_DATA_M = temp_writedata;

endmodule