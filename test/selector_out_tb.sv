`timescale 1ns / 1ps
module selector_out_tb;

    parameter WIDTH = 32;

	// Inputs
    logic select;
    logic [WIDTH-1:0] data_in;
	
	//Outputs
    logic [WIDTH-1:0] data_out_0;
    logic [WIDTH-1:0] data_out_1;

	// Instantiate the Device Under Test (DUT)
    selector_out #(WIDTH) DUT( 
        .SELECT(select),
        .DATA_IN(data_in), 
        .DATA_OUT_0(data_out_0),
        .DATA_OUT_1(data_out_1) 
    );

	initial begin
		// Initialize Inputs
		data_in = 32'd1;
        select = 0;

		// Wait 100 ns for global reset to finish
		#50;
        select = 1;

		#50;
        select = 1'bx;

	end
endmodule