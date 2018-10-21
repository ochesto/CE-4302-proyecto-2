`timescale 1ns / 1ps
module control_unit_tb;

    parameter WIDTH = 32;

	// Inputs
    logic [31:0] instr;
	
	//Outputs
    logic regwrite;
    logic memtoreg;
    logic memwrite;
    logic [3:0] alucontrol;
    logic [1:0] alusrc;
    logic branch;
    logic notequal;

	// Instantiate the Device Under Test (DUT)
    control_unit DUT( 
        .OP( instr[31:26] ),
        .VEC( instr[0] ),
        .REG_WRITE( regwrite ),
        .MEM_TO_REG( memtoreg ),
        .MEM_WRITE( memwrite ),
        .ALU_CONTROL( alucontrol ),
        .ALU_SRC( alusrc ),
        .BRANCH( branch ),
        .NOT_EQUAL( notequal )
    );

	initial begin
        /* ADD */
		instr = 32'b00000000001000100001100000000000;
        #50;

        /* ADDI */
		instr = 32'b00000100001000100000000000001010;
        #50;

        /* ADDV */
        instr = 32'b00000000001000100010000000000001;
        #50;

        /* SUB */
        instr = 32'b00001000001000100001100000000000;
        #50;

        /* SUBI */
        instr = 32'b00001100001000100000000000001010;
        #50;

        /* SUBV */
        instr = 32'b00001000001000100001100000000001;
        #50;

        /* XOR */
        instr = 32'b00010000001000100001100000000000;
        #50;

        /* XORI */
        instr = 32'b00010100001000100000000000001010;
        #50;

        /* LW */
        instr = 32'b00101100001000100000000000001010;
        #50;

        /* SW */
        instr = 32'b00110000001000100000000000001010;
        #50;

        /* XORV */
        instr = 32'b00010000001000100001100000000001;
        #50;

        /* MULT */
        instr = 32'b00011000001000100001000000000000;
        #50;

        /* J */
        instr = 32'b00110100000000000000000001100100;
        #50;

        /* SLV */
        instr = 32'b00011100001000100000000000001111;
        #50;

        /* SRV */
        instr = 32'b00100000001000100000000000001011;
        #50;

        /* SCLV */
        instr = 32'b00100100001000100000000000000111;
        #50;

        /* SCRV */
        instr = 32'b00101000001000100000000000001011;
        #50;

        /* BRANCH_EQ */
        instr = 32'b01000000001000100000000000000101;
        #50;

        /* NOP */
        instr = 32'b11111100000000000000000000000000;
        #50;

	end
endmodule