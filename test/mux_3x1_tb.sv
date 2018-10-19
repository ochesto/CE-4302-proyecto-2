`timescale 1ns / 1ps
module mux_3x1_tb;

    parameter WIDTH = 32;

    parameter SELECT_1 = 2'b00;
    parameter SELECT_2 = 2'b01;
    parameter SELECT_3 = 2'b10;

	// Inputs
    logic [1:0] select;
    logic [WIDTH-1:0] data_in_1;
    logic [WIDTH-1:0] data_in_2;
    logic [WIDTH-1:0] data_in_3;
	
	//Outputs
    logic [WIDTH-1:0] data_out;

	// Instantiate the Device Under Test (DUT)
    mux_3x1 #(WIDTH) DUT( 
        .SELECT(select),
        .DATA_IN_1(data_in_1), 
        .DATA_IN_2(data_in_2), 
        .DATA_IN_3(data_in_3), 
        .DATA_OUT(data_out) 
    );

	initial begin
		// Initialize Inputs
		data_in_1 = 32'd1;
        data_in_2 = 32'd2;
        data_in_3 = 32'd3;
        select = SELECT_1;

		// Wait 100 ns for global reset to finish
		#50;
        select = SELECT_2;

		#50;
        select = SELECT_3;
        
        #50;
	end
endmodule