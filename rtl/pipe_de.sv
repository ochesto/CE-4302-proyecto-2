`timescale 1ns / 1ps
module pipe_de #( parameter WIDTH = 32 )
(
    input logic CLK,
    input logic CLR,
    input logic REG_WRITE_D,
    input logic MEM_TO_REG_D,
    input logic MEM_WRITE_D,
    input logic [3:0] ALU_CONTROL_D,
    input logic [1:0] ALU_SRC_D,
    input logic [WIDTH-1:0] RD1_D,
    input logic [WIDTH-1:0] RD2_D,
    input logic [4:0] RA1_D,
    input logic [4:0] RA2_D,
    input logic [4:0] RS_D,
    input logic [WIDTH-1:0] SIGN_IMM_D,
    input logic [2:0] SHIFT_D,
    input logic [4:0] WRITE_REG_D,

    output logic REG_WRITE_E,
    output logic MEM_TO_REG_E,
    output logic MEM_WRITE_E,
    output logic [3:0] ALU_CONTROL_E,
    output logic [1:0] ALU_SRC_E,
    output logic [WIDTH-1:0] RD1_E,
    output logic [WIDTH-1:0] RD2_E,
    output logic [4:0] RA1_E,
    output logic [4:0] RA2_E,
    output logic [4:0] RS_E,
    output logic [WIDTH-1:0] SIGN_IMM_E,
    output logic [2:0] SHIFT_E,
    output logic [4:0] WRITE_REG_E
);

logic temp_regwrite;
logic temp_memtoreg;
logic temp_memwrite;
logic [3:0] temp_alucontrol;
logic [1:0] temp_alusrc;
logic [WIDTH-1:0] temp_rd1;
logic [WIDTH-1:0] temp_rd2;
logic [4:0] temp_ra1;
logic [4:0] temp_ra2;
logic [4:0] temp_rs;
logic [WIDTH-1:0] temp_signimm;
logic [2:0] temp_shift;
logic [4:0] temp_writereg;

initial begin
    temp_regwrite = 1'b0;
    temp_memtoreg = 1'b0;
    temp_memwrite = 1'b0;
    temp_alucontrol = {4{1'b1}};
    temp_alusrc = {2{1'b0}};
    temp_rd1 = {32{1'b0}};
    temp_rd2 = {32{1'b0}};
    temp_ra1 = {5{1'b0}};
    temp_ra2 = {5{1'b0}};
    temp_rs = {5{1'b0}};
    temp_signimm = {32{1'b0}};
    temp_shift = {3{1'b0}};
    temp_writereg = {5{1'b0}};
end

always@( negedge CLK or posedge CLR ) begin
    if( CLR ) begin
        temp_regwrite = 1'b0;
        temp_memtoreg = 1'b0;
        temp_memwrite = 1'b0;
        temp_alucontrol = {4{1'b1}};
        temp_alusrc = {2{1'b0}};
        temp_rd1 = {32{1'b0}};
        temp_rd2 = {32{1'b0}};
        temp_ra1 = {5{1'b0}};
        temp_ra2 = {5{1'b0}};
        temp_rs = {5{1'b0}};
        temp_signimm = {32{1'b0}};
        temp_shift = {3{1'b0}};
        temp_writereg = {5{1'b0}};
    end
    else begin
        temp_regwrite = REG_WRITE_D;
        temp_memtoreg = MEM_TO_REG_D;
        temp_memwrite = MEM_WRITE_D;
        temp_alucontrol = ALU_CONTROL_D;
        temp_alusrc = ALU_SRC_D;
        temp_rd1 = RD1_D;
        temp_rd2 = RD2_D;
        temp_ra1 = RA1_D;
        temp_ra2 = RA2_D;
        temp_rs = RS_D;
        temp_signimm = SIGN_IMM_D;
        temp_shift = SHIFT_D;
        temp_writereg = WRITE_REG_D;
    end
end

assign REG_WRITE_E = temp_regwrite;
assign MEM_TO_REG_E = temp_memtoreg;
assign MEM_WRITE_E = temp_memwrite;
assign ALU_CONTROL_E = temp_alucontrol;
assign ALU_SRC_E = temp_alusrc;
assign RD1_E = temp_rd1;
assign RD2_E = temp_rd2;
assign RA1_E = temp_ra1;
assign RA2_E = temp_ra2;
assign RS_E = temp_rs;
assign SIGN_IMM_E = temp_signimm;
assign SHIFT_E = temp_shift;
assign WRITE_REG_E = temp_writereg;

endmodule