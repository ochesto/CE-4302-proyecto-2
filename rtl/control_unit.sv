`timescale 1ns / 1ps
module control_unit
(
    input [31:26] OP,
    input [3:1] SHIFT,
    input [0:0] VEC,
    output REG_WRITE,
    output MEM_TO_REG,
    output MEM_WRITE,
    output [3:0] ALU_CONTROL,
    output ALU_SRC,
    output REG_DST,
    output BRANCH
);

parameter ADD = 6'b000000;
parameter ADDI = 6'b000001;
    parameter ADDV = 6'b000000;
parameter SUB = 6'b000010;
parameter SUBI = 6'b000011;
    parameter SUBV = 6'b000010;
parameter XOR = 6'b000100;
parameter XORI = 6'b000101;
    parameter XORV = 6'b000100;
parameter MUL = 6'b000110;
parameter SLV = 6'b000111;
parameter SRV = 6'b001000;
parameter SCLV = 6'b001001;
parameter SCRV = 6'b001010;
parameter LDR = 6'b001011;
parameter LDV = 6'b001100;
parameter STR = 6'b001101;
parameter STV = 6'b001110;
parameter JUMP = 6'b001111;
parameter BRANCH_EQ = 6'b010000;
parameter NOP = 6'b111111;

parameter ALU_ADD = 4'b0000;
parameter ALU_SUB = 4'b0001;
parameter ALU_MULT = 4'b0010;
parameter ALU_XOR = 4'b0011;
parameter ALU_ADDV = 4'b0100;
parameter ALU_SUBV = 4'b0101;
parameter ALU_XORV = 4'b0110;
parameter ALU_SLV = 4'b0111;
parameter ALU_SRV = 4'b1000;
parameter ALU_SCLV = 4'b1001;
parameter ALU_SCRV = 4'b1010;
parameter ALU_NOP = 4'b1111;

logic [7:0] controls;
logic op_vec;
logic alu_op;
logic [3:0] alu_control;

always_comb begin
    case(OP)
        
        ADD: begin
            controls = (TYPE) ? 7'bx : 7'b10001001;
        end

    endcase
end

assign {    REG_WRITE, 
            MEM_TO_REG, 
            MEM_WRITE, 
            ALU_SRC, 
            REG_DST, 
            BRANCH,
            EQUAL,
            alu_op } = controls;

always_comb begin
    if(alu_op) begin
        case(OP):

            ADD: begin
                alu_control = 4'b0000;
            end

            SUB: begin
                alu_control = 4'b0001;
            end

            XOR: begin
                alu_control = 4'b0001;
            end

            SLV

        endcase
    end
end

endmodule
