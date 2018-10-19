`timescale 1ns / 1ps
module pipe_em_tb;

    parameter WIDTH = 32;

	// Inputs
    logic clk;
    logic clr;
    logic regwrite_e;
    logic memtoreg_e;
    logic memwrite_e;
    logic [WIDTH-1:0] aluout_e;
    logic [WIDTH-1:0] writedata_e;
    logic [4:0] writereg_e;
	
	//Outputs
    logic regwrite_m;
    logic memtoreg_m;
    logic memwrite_m;
    logic [WIDTH-1:0] aluout_m;
    logic [WIDTH-1:0] writedata_m;
    logic [4:0] writereg_m;

	// Instantiate the Device Under Test (DUT)
    pipe_em #(WIDTH) DUT( 
        .CLK( clk ),
        .CLR( clr ),
        .REG_WRITE_E( regwrite_e ),
        .MEM_TO_REG_E( memtoreg_e ),
        .MEM_WRITE_E( memwrite_e ),
        .ALU_OUT_E( aluout_e ),
        .WRITE_DATA_E( writedata_e ),
        .WRITE_REG_E( writereg_e ),

        .REG_WRITE_M( regwrite_m ),
        .MEM_TO_REG_M( memtoreg_m ),
        .MEM_WRITE_M( memwrite_m ),
        .ALU_OUT_M( aluout_m ),
        .WRITE_DATA_M( writedata_m ),
        .WRITE_REG_M( writereg_m )
    );

    //Initialize clock
	initial begin
		clk = 1'b0;
		forever begin
			#5;
			clk = ~clk;
		end
	end

	initial begin
		// Initialize Inputs
		clk = 0;
        clr = 1;
        regwrite_e = 0;
        memtoreg_e = 0;
        memwrite_e = 0;
        aluout_e = 0;
        writereg_e = 0;
        writedata_e = 0;
        #5;

        for( int i=0; i < 10; i++ ) begin
            #10;
            clr = 0;
            regwrite_e = $urandom();
            memtoreg_e = $urandom();
            memwrite_e = $urandom();
            aluout_e = $urandom();
            writereg_e = $urandom();
            writedata_e = $urandom();
        end

        #30;
        $stop;

	end
endmodule
