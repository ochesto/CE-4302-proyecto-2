`timescale 1ns / 1ps
module sign_extend_tb;

    parameter WIDTH = 32;

	// Inputs
    logic [15:0] data;
	
	//Outputs
    logic [WIDTH-1:0] extended;

	// Instantiate the Device Under Test (DUT)
    sign_extend #(WIDTH) DUT(
        .DATA( data ),
        .EXTENDED( extended )
    );

	initial begin
		// Initialize Inputs
		data = 16'd256;

		// Wait 100 ns for global reset to finish
		#50;

        data = {16{1'b1}};
        #50;

        data = 16'd14;
        #50;

	end
endmodule