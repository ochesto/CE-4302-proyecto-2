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
parameter ALU_MUX_A = 4'b1011;
parameter ALU_MUX_B = 4'b1100;
parameter ALU_NOP = 4'b1111;

parameter SHIFT_0 = 3'b000;
parameter SHIFT_1 = 3'b001;
parameter SHIFT_2 = 3'b010;
parameter SHIFT_3 = 3'b011;
parameter SHIFT_4 = 3'b100;
parameter SHIFT_5 = 3'b101;
parameter SHIFT_6 = 3'b110;
parameter SHIFT_7 = 3'b111;

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

        ALU_SCLV: begin
            case( shift[2:0] )
                
                SHIFT_0: begin
                    result[7:0] = a_0;
                    result[15:8] = a_1;
                    result[23:16] = a_2;
                    result[31:24] = a_3;
                end

                SHIFT_1: begin
                    result[7:0] = {a_0[7-0:0],a_0[7:7-0]};
                    result[15:8] = {a_1[7-0:0],a_1[7:7-0]};
                    result[23:16] = {a_2[7-0:0],a_2[7:7-0]};
                    result[31:24] = {a_3[7-0:0],a_3[7:7-0]};
                end

                SHIFT_2: begin
                    result[7:0] = {a_0[7-1:0],a_0[7:7-1]};
                    result[15:8] = {a_1[7-1:0],a_1[7:7-1]};
                    result[23:16] = {a_2[7-1:0],a_2[7:7-1]};
                    result[31:24] = {a_3[7-1:0],a_3[7:7-1]};
                end

                SHIFT_3: begin
                    result[7:0] = {a_0[7-2:0],a_0[7:7-2]};
                    result[15:8] = {a_1[7-2:0],a_1[7:7-2]};
                    result[23:16] = {a_2[7-2:0],a_2[7:7-2]};
                    result[31:24] = {a_3[7-2:0],a_3[7:7-2]};
                end

                SHIFT_4: begin
                    result[7:0] = {a_0[7-3:0],a_0[7:7-3]};
                    result[15:8] = {a_1[7-3:0],a_1[7:7-3]};
                    result[23:16] = {a_2[7-3:0],a_2[7:7-3]};
                    result[31:24] = {a_3[7-3:0],a_3[7:7-3]};
                end

                SHIFT_5: begin
                    result[7:0] = {a_0[7-4:0],a_0[7:7-4]};
                    result[15:8] = {a_1[7-4:0],a_1[7:7-4]};
                    result[23:16] = {a_2[7-4:0],a_2[7:7-4]};
                    result[31:24] = {a_3[7-4:0],a_3[7:7-4]};
                end

                SHIFT_6: begin
                    result[7:0] = {a_0[7-5:0],a_0[7:7-5]};
                    result[15:8] = {a_1[7-5:0],a_1[7:7-5]};
                    result[23:16] = {a_2[7-5:0],a_2[7:7-5]};
                    result[31:24] = {a_3[7-5:0],a_3[7:7-5]};
                end

                SHIFT_7: begin
                    result[7:0] = {a_0[7-6:0],a_0[7:7-6]};
                    result[15:8] = {a_1[7-6:0],a_1[7:7-6]};
                    result[23:16] = {a_2[7-6:0],a_2[7:7-6]};
                    result[31:24] = {a_3[7-6:0],a_3[7:7-6]};
                end

            endcase
        end

        ALU_SCRV: begin
            case( shift[2:0] )
                
                SHIFT_0: begin
                    result[7:0] = a_0;
                    result[15:8] = a_1;
                    result[23:16] = a_2;
                    result[31:24] = a_3;
                end

                SHIFT_1: begin
                    result[7:0] = {a_0[7-1:0],a_0[7:0+1]};
                    result[15:8] = {a_1[7-1:0],a_1[7:0+1]};
                    result[23:16] = {a_2[7-1:0],a_2[7:0+1]};
                    result[31:24] = {a_3[7-1:0],a_3[7:0+1]};
                end

                SHIFT_2: begin
                    result[7:0] = {a_0[7-2:0],a_0[7:0+2]};
                    result[15:8] = {a_1[7-2:0],a_1[7:0+2]};
                    result[23:16] = {a_2[7-2:0],a_2[7:0+2]};
                    result[31:24] = {a_3[7-2:0],a_3[7:0+2]};
                end

                SHIFT_3: begin
                    result[7:0] = {a_0[7-3:0],a_0[7:0+3]};
                    result[15:8] = {a_1[7-3:0],a_1[7:0+3]};
                    result[23:16] = {a_2[7-3:0],a_2[7:0+3]};
                    result[31:24] = {a_3[7-3:0],a_3[7:0+3]};
                end

                SHIFT_4: begin
                    result[7:0] = {a_0[7-4:0],a_0[7:0+4]};
                    result[15:8] = {a_1[7-4:0],a_1[7:0+4]};
                    result[23:16] = {a_2[7-4:0],a_2[7:0+4]};
                    result[31:24] = {a_3[7-4:0],a_3[7:0+4]};
                end

                SHIFT_5: begin
                    result[7:0] = {a_0[5:0],a_0[7:0+5]};
                    result[15:8] = {a_1[5:0],a_1[7:0+5]};
                    result[23:16] = {a_2[5:0],a_2[7:0+5]};
                    result[31:24] = {a_3[5:0],a_3[7:0+5]};
                end

                SHIFT_6: begin
                    result[7:0] = {a_0[6:0],a_0[7:0+6]};
                    result[15:8] = {a_1[6:0],a_1[7:0+6]};
                    result[23:16] = {a_2[6:0],a_2[7:0+6]};
                    result[31:24] = {a_3[6:0],a_3[7:0+6]};
                end

                SHIFT_7: begin
                    result[7:0] = {a_0[7:0],a_0[7:0+7]};
                    result[15:8] = {a_1[7:0],a_1[7:0+7]};
                    result[23:16] = {a_2[7:0],a_2[7:0+7]};
                    result[31:24] = {a_3[7:0],a_3[7:0+7]};
                end

            endcase
        end

        ALU_NOP: begin
            result = {32{1'b0}};
        end

        ALU_MUX_A: begin
            result = SRC_A;
        end

        ALU_MUX_B: begin
            result = SRC_B;
        end

        default: begin
            result = {32{1'b0}};
        end

    endcase
end

assign ALU_OUT = result;

endmodule