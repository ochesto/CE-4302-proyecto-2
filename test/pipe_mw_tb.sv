`timescale 1ns / 1ps
module pipe_mw_tb;

    parameter WIDTH = 32;

	// Inputs
    logic clk;
    logic clr;
    logic regwrite_m;
    logic memtoreg_m;
    logic [WIDTH-1:0] readdata_m;
    logic [WIDTH-1:0] aluout_m;
    logic [4:0] writereg_m;
	
	//Outputs
    logic regwrite_w;
    logic memtoreg_w;
    logic [WIDTH-1:0] readdata_w;
    logic [WIDTH-1:0] aluout_w;
    logic [4:0] writereg_w;

	// Instantiate the Device Under Test (DUT)
    pipe_mw #(WIDTH) DUT( 
        .CLK( clk ),
        .CLR( clr ),
        .REG_WRITE_M( regwrite_m ),
        .MEM_TO_REG_M( memtoreg_m ),
        .READ_DATA_M( readdata_m ),
        .ALU_OUT_M( aluout_m ),
        .WRITE_REG_M( writereg_m ),

        .REG_WRITE_W( regwrite_w ),
        .MEM_TO_REG_W( memtoreg_w ),
        .READ_DATA_W(  readdata_w),
        .ALU_OUT_W( aluout_w ),
        .WRITE_REG_W( writereg_w )
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
        regwrite_m = 0;
        memtoreg_m = 0;
        readdata_m = 0;
        aluout_m = 0;
        writereg_m = 0;
        #5;

        for( int i=0; i < 10; i++ ) begin
            #10;
            clr = 0;
            regwrite_m = $urandom();
            memtoreg_m = $urandom();
            readdata_m = $urandom();
            aluout_m = $urandom();
            writereg_m = $urandom();
        end

        #30;
        $stop;

	end
endmodule
