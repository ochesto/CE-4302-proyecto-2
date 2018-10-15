`timescale 1ns / 1ps
module mux_2x1_tb;

    parameter WIDTH = 32;

	// Inputs
    logic select;
    logic [WIDTH-1:0] data_in_1;
    logic [WIDTH-1:0] data_in_2;
	
	//Outputs
    logic [WIDTH-1:0] data_out;

	// Instantiate the Device Under Test (DUT)
    mux_2x1 #(WIDTH) DUT( 
            .SELECT(select),
			.DATA_IN_1(data_in_1), 
            .DATA_IN_2(data_in_2), 
            .DATA_OUT(data_out) );

	initial begin
		// Initialize Inputs
		data_in_1 = 32'd1;
        data_in_2 = 32'd2;
        select = 0;

		// Wait 100 ns for global reset to finish
		#50;
        select = 1;

		#50;
        select = 0;

	end
endmodule