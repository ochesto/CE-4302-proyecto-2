`timescale 1ns / 1ps
module instruction_rom_tb;

	// Inputs
	bit clk;
	bit reset;
    logic [31:0] address;
	
	//Outputs
    logic [31:0] instr;

	// Instantiate the Device Under Test (DUT)
    instruction_rom #(32) DUT( .CLK(clk), .Reset(reset), 
				.Address(address), .Instr(instr) );

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
		reset = 1;
		address = 32'd0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		reset = 0;

		for ( int i = 0 ; i < 10 ; i++ ) begin
			#10;
            address = address + 48'd4;
		end
	end
endmodule