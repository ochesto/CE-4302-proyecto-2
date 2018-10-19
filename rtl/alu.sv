`timescale 1ns / 1ps
module alu #( parameter WIDTH = 32 )
(	
	/*input logic CLK,*/
	input logic[WIDTH-1:0] SRC_A,
	input logic[WIDTH-1:0] SRC_B,
	input logic[3:0] ALU_CONTROL,
	output logic[WIDTH-1:0] ALU_OUT
);

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

logic[WIDTH-1:0] result;
logic[7:0] a_0, a_1, a_2, a_3;
logic[7:0] b_0, b_1, b_2, b_3;
logic[WIDTH-1:0] shift;

always_comb begin
    a_0 = SRC_A[7:0];
    a_1 = SRC_A[15:8];
    a_2 = SRC_A[23:16];
    a_3 = SRC_A[31:24];
    b_0 = SRC_B[7:0];
    b_1 = SRC_B[15:8];
    b_2 = SRC_B[23:16];
    b_3 = SRC_B[31:24];
    shift = SRC_B;

    case( ALU_CONTROL )

        ALU_ADD: begin
            result = SRC_A + SRC_B;
        end

        ALU_SUB: begin
            result = SRC_A - SRC_B;
        end

        ALU_MULT: begin
            result = SRC_A * SRC_B;
        end

        ALU_XOR: begin
            result = SRC_A ^ SRC_B;
        end

        ALU_ADDV: begin
            result[7:0] = a_0 + b_0;
            result[15:8] = a_1 + b_1;
            result[23:16] = a_2 + b_2;
            result[31:24] = a_3 + b_3;
        end

        ALU_SUBV: begin
            result[7:0] = a_0 - b_0;
            result[15:8] = a_1 - b_1;
            result[23:16] = a_2 - b_2;
            result[31:24] = a_3 - b_3;
        end

        ALU_XORV: begin
            result[7:0] = a_0 ^ b_0;
            result[15:8] = a_1 ^ b_0;
            result[23:16] = a_2 ^ b_0;
            result[31:24] = a_3 ^ b_0;
        end

        ALU_SLV: begin
            result[7:0] = a_0 << shift;
            result[15:8] = a_1 << shift;
            result[23:16] = a_2 << shift;
            result[31:24] = a_3 << shift;
        end

        ALU_SRV: begin
            result[7:0] = a_0 >> shift;
            result[15:8] = a_1 >> shift;
            result[23:16] = a_2 >> shift;
            result[31:24] = a_3 >> shift;
        end

        /* TODO: All shift cases */
        ALU_SCLV: begin
            result[7:0] = {a_0[7-4:0],a_0[7:7-4]};
            result[15:8] = {a_1[7-4:0],a_1[7:7-4]};
            result[23:16] = {a_2[7-4:0],a_2[7:7-4]};
            result[31:24] = {a_3[7-4:0],a_3[7:7-4]};
        end

        /* TODO: All shift cases */
        ALU_SCRV: begin
            result[7:0] = {a_0[7-4:0],a_0[7:0+4]};
            result[15:8] = {a_1[7-4:0],a_1[7:0+4]};
            result[23:16] = {a_2[7-4:0],a_2[7:0+4]};
            result[31:24] = {a_3[7-4:0],a_3[7:0+4]};
        end

        ALU_NOP: begin
            result = {32{1'b0}};
        end

        default: begin
            result = {32{1'b0}};
        end

    endcase
end

assign ALU_OUT = result;

endmodule