`timescale 1ns / 1ps
module pipe_wf_tb;

    parameter WIDTH = 32;

	// Inputs
    logic clk;
    logic [WIDTH-1:0] pc;
	
	//Outputs
    logic [WIDTH-1:0] pc_out;

	// Instantiate the Device Under Test (DUT)
    pipe_wf #(WIDTH) DUT( 
			.CLK( clk ),
            .PC( pc ),
            .PC_F( pc_out )
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
        pc = 32'b0;
        #5;

        #10;
        pc = 32'd4;
        #10;
        pc = 32'd8;
        #10;
        pc = 32'd12;
        #10;
        $stop;

	end
endmodule