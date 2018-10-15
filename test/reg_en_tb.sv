

`timescale 1ns / 1ps
module reg_en_tb;

    parameter WIDTH = 32;

	// Inputs
	bit clk;
	bit enable;
    logic [WIDTH-1:0] data_in;
	
	//Outputs
    logic [WIDTH-1:0] data_out;

	// Instantiate the Device Under Test (DUT)
    reg_en #(WIDTH) DUT( 
            .CLK(clk), 
            .ENABLE(enable), 
			.DATA_IN(data_in), 
            .DATA_OUT(data_out) );

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
		enable = 0;
		data_in = 32'd100;

		// Wait 100 ns for global reset to finish
		#50;
        
		// Add stimulus here
		enable = 1;
        #50;
        enable = 0;

	end
endmodule