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
    logic [2:0] alusrc;
    logic branch;

	// Instantiate the Device Under Test (DUT)
    control_unit DUT( 
        .OP( instr[31:26] ),
        .VEC( instr[0] ),
        .REG_WRITE( regwrite ),
        .MEM_TO_REG( memtoreg ),
        .MEM_WRITE( memwrite ),
        .ALU_CONTROL( alucontrol ),
        .ALU_SRC( alusrc ),
        .BRANCH( branch )
    );

	initial begin
		// Initialize Inputs
		instr = {32{1'b1}};

	end
endmodule