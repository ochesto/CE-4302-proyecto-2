`timescale 1ns / 1ps
module adder_tb;

    parameter WIDTH = 32;

	// Inputs
    logic [WIDTH-1:0] data_in_1;
    logic [WIDTH-1:0] data_in_2;
	
	//Outputs
    logic [WIDTH-1:0] data_out;

	// Instantiate the Device Under Test (DUT)
    adder #(WIDTH) DUT( 
			.DATA_IN_1(data_in_1), 
            .DATA_IN_2(data_in_2), 
            .DATA_OUT(data_out) );

	initial begin
		// Initialize Inputs
		data_in_1 = 32'd100;
        data_in_2 = 32'd4;

		// Wait 100 ns for global reset to finish
		#50;

        data_in_1 = 32'd80;
        data_in_2 = 32'd110;

		#50;

	end
endmodule