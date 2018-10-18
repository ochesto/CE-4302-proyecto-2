`timescale 1ns / 1ps
module shifter_tb;

    parameter WIDTH = 8;

	// Inputs
    logic [WIDTH-1:0] data;
	
	//Outputs
    logic [WIDTH-1:0] shifted;

	// Instantiate the Device Under Test (DUT)
    shifter #(WIDTH) DUT(
        .DATA( data ),
        .SHIFTED( shifted )
    );

	initial begin
		// Initialize Inputs
		data = 8'b00000001;

		// Wait 100 ns for global reset to finish
		#50;

        data = 8'b11111111;
        #50;

	end
endmodule