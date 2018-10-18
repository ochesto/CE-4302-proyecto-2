`timescale 1ns / 1ps
module is_equal_tb;

    parameter WIDTH = 32;

	// Inputs
    logic [WIDTH-1:0] data_in_1;
    logic [WIDTH-1:0] data_in_2;
	
	//Outputs
    logic [WIDTH-1:0] equal;

	// Instantiate the Device Under Test (DUT)
    is_equal #(WIDTH) DUT( 
			.DATA_IN_1(data_in_1), 
            .DATA_IN_2(data_in_2), 
            .EQUAL(equal) );

	initial begin
		// Initialize Inputs
		data_in_1 = 32'd100;
        data_in_2 = 32'd4;

		// Wait 100 ns for global reset to finish
		#50;

        data_in_1 = 32'd256;
        data_in_2 = 32'd256;

		#50;
        data_in_1 = 32'd0;
        data_in_2 = 32'd256;

        #50;

	end
endmodule