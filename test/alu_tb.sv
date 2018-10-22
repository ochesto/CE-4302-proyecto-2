`timescale 1ns / 1ps
module alu_tb;

    parameter WIDTH = 32;

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

	// Inputs
    logic [WIDTH-1:0] src_a;
    logic [WIDTH-1:0] src_b;
	logic [3:0] alucontrol;

	//Outputs
    logic [WIDTH-1:0] result;

	// Instantiate the Device Under Test (DUT)
    alu #(WIDTH) DUT( 
        .SRC_A( src_a ),
        .SRC_B( src_b ),
        .ALU_CONTROL( alucontrol ),
        .ALU_OUT( result )
    );

	initial begin
        /* NOP */
        alucontrol = ALU_NOP;
        src_a = 32'd4;
        src_b = 32'd100;
        #40;

		/* ADD */
        alucontrol = ALU_ADD;
        src_a = 32'd4;
        src_b = 32'd100;
        #40;

        /* SUB */
        alucontrol = ALU_SUB;
        src_a = 32'd4;
        src_b = 32'd100;
        #40;

        /* MULT */
        alucontrol = ALU_MULT;
        src_a = 32'd4;
        src_b = 32'd100;
        #40;

        /* XOR */
        alucontrol = ALU_XOR;
        src_a = 32'd4;
        src_b = 32'd100;
        #40;

        /* ADDI */
        alucontrol = ALU_ADD;
        src_a = 32'd4;
        src_b = 32'd100;
        #40;

        /* SUBI */
        alucontrol = ALU_SUB;
        src_a = 32'd4;
        src_b = 32'd100;
        #40;

        /* XORI */
        alucontrol = ALU_XOR;
        src_a = 32'd4;
        src_b = 32'd100;
        #40;

        /* ADDV */
        alucontrol = ALU_ADDV;
        src_a = 32'd4;
        src_b = 32'd100;
        #40;

        /* SUBV */
        alucontrol = ALU_SUBV;
        src_a = 32'd4;
        src_b = 32'd100;
        #40;

        /* XORV */
        alucontrol = ALU_XORV;
        src_a = 32'd4;
        src_b = 32'd100;
        #40;

        /* SLV */
        alucontrol = ALU_SLV;
        src_a = 32'd254;
        src_b = 32'd4;
        #40;

        /* SRV */
        alucontrol = ALU_SRV;
        src_a = 32'd254;
        src_b = 32'd4;
        #40;

        /* SCLV */
        alucontrol = ALU_SCLV;
        src_a = 32'd254;
        src_b = 32'd0;
        #40;

        /* SCLV */
        alucontrol = ALU_SCLV;
        src_a = 32'd254;
        src_b = 32'd1;
        #40;

        /* SCLV */
        alucontrol = ALU_SCLV;
        src_a = 32'd254;
        src_b = 32'd2;
        #40;

        /* SCLV */
        alucontrol = ALU_SCLV;
        src_a = 32'd254;
        src_b = 32'd3;
        #40;

        /* SCLV */
        alucontrol = ALU_SCLV;
        src_a = 32'd254;
        src_b = 32'd4;
        #40;

        /* SCLV */
        alucontrol = ALU_SCLV;
        src_a = 32'd254;
        src_b = 32'd5;
        #40;

        /* SCLV */
        alucontrol = ALU_SCLV;
        src_a = 32'd254;
        src_b = 32'd6;
        #40;

        /* SCLV */
        alucontrol = ALU_SCLV;
        src_a = 32'd254;
        src_b = 32'd7;
        #40;

        /* SCRV */
        alucontrol = ALU_SCRV;
        src_a = 32'd254;
        src_b = 32'd0;
        #40;

        /* SCRV */
        alucontrol = ALU_SCRV;
        src_a = 32'd254;
        src_b = 32'd1;
        #40;

        /* SCRV */
        alucontrol = ALU_SCRV;
        src_a = 32'd254;
        src_b = 32'd2;
        #40;

        /* SCRV */
        alucontrol = ALU_SCRV;
        src_a = 32'd254;
        src_b = 32'd3;
        #40;

        /* SCRV */
        alucontrol = ALU_SCRV;
        src_a = 32'd254;
        src_b = 32'd4;
        #40;

        /* SCRV */
        alucontrol = ALU_SCRV;
        src_a = 32'd254;
        src_b = 32'd5;
        #40;

        /* SCRV */
        alucontrol = ALU_SCRV;
        src_a = 32'd254;
        src_b = 32'd6;
        #40;

        /* SCRV */
        alucontrol = ALU_SCRV;
        src_a = 32'd254;
        src_b = 32'd7;
        #40;

        /* NOP */
        alucontrol = ALU_NOP;
        src_a = 32'd254;
        src_b = 32'd4;
        #40;

	end
endmodule