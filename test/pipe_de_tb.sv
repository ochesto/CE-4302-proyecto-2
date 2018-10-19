`timescale 1ns / 1ps
module pipe_de_tb;

    parameter WIDTH = 32;

	// Inputs
    logic clk;
    logic clr;
    logic regwrite_d;
    logic memtoreg_d;
    logic memwrite_d;
    logic [3:0] alucontrol_d;
    logic [1:0] alusrc_d;
    logic [WIDTH-1:0] rd1_d;
    logic [WIDTH-1:0] rd2_d;
    logic [4:0] ra1_d;
    logic [4:0] ra2_d;
    logic [4:0] rs_d;
    logic [WIDTH-1:0] signimm_d;
    logic [2:0] shift_d;
    logic [4:0] writereg_d;
	
	//Outputs
    logic regwrite_e;
    logic memtoreg_e;
    logic memwrite_e;
    logic [3:0] alucontrol_e;
    logic [1:0] alusrc_e;
    logic [WIDTH-1:0] rd1_e;
    logic [WIDTH-1:0] rd2_e;
    logic [4:0] ra1_e;
    logic [4:0] ra2_e;
    logic [4:0] rs_e;
    logic [WIDTH-1:0] signimm_e;
    logic [2:0] shift_e;
    logic [4:0] writereg_e;

	// Instantiate the Device Under Test (DUT)
    pipe_de #(WIDTH) DUT( 
        .CLK( clk ),
        .CLR( clr ),
        .REG_WRITE_D( regwrite_d ),
        .MEM_TO_REG_D( memtoreg_d ),
        .MEM_WRITE_D( memwrite_d ),
        .ALU_CONTROL_D( alucontrol_d ),
        .ALU_SRC_D( alusrc_d ),
        .RD1_D( rd1_d ),
        .RD2_D( rd2_d ),
        .RA1_D( ra1_d ),
        .RA2_D( ra2_d ),
        .RS_D( rs_d ),
        .SIGN_IMM_D( signimm_d ),
        .SHIFT_D( shift_d ),
        .WRITE_REG_D( writereg_d ),

        .REG_WRITE_E( regwrite_e ),
        .MEM_TO_REG_E( memtoreg_e ),
        .MEM_WRITE_E( memwrite_e ),
        .ALU_CONTROL_E(  alucontrol_e),
        .ALU_SRC_E( alusrc_e ),
        .RD1_E( rd1_e ),
        .RD2_E( rd2_e ),
        .RA1_E( ra1_e ),
        .RA2_E( ra2_e ),
        .RS_E( rs_e ),
        .SIGN_IMM_E( signimm_e ),
        .SHIFT_E( shift_e ),
        .WRITE_REG_E( writereg_e )
    );

    //Initialize clock
	initial begin
		clk = 1'b1;
		forever begin
			#5;
			clk = ~clk;
		end
	end

	initial begin
		// Initialize Inputs
		clk = 0;
        clr = 1;
        regwrite_d = 0;
        memtoreg_d = 0;
        memwrite_d = 0;
        alucontrol_d = 0;
        alusrc_d = 0;
        rd1_d = 0;
        rd2_d = 0;
        ra1_d = 0;
        ra2_d = 0;
        rs_d = 0;
        signimm_d = 0;
        shift_d = 0;
        writereg_d = 0;
        #5;

        for( int i=0; i < 10; i++ ) begin
            #10;
            clr = 0;
            regwrite_d = $urandom();
            memtoreg_d = $urandom();
            memwrite_d = $urandom();
            alucontrol_d = $urandom();
            alusrc_d = $urandom();
            rd1_d = $urandom();
            rd2_d = $urandom();
            ra1_d = $urandom();
            ra2_d = $urandom();
            rs_d = $urandom();
            signimm_d = $urandom();
            shift_d = $urandom();
            writereg_d = $urandom();
        end

        #30;
        $stop;

	end
endmodule
