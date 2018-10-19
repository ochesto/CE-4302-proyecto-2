`timescale 1ns / 1ps
module ram_tb;

    parameter WIDTH = 32;

	// Inputs
	logic clk;
    logic write_enable;
    logic [1024:0] address;
    logic [WIDTH-1:0] data;
	
	//Outputs
    logic [WIDTH-1:0] read_data;

	// Instantiate the Device Under Test (DUT)
    ram #(WIDTH) DUT( 
        .CLK( clk ), 
        .WE( write_enable ),
        .ADDRESS( address ), 
        .WD( data ),
        .RD( read_data )
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
        write_enable = 0;
        address = 0;
        data = 1000;
    
		// Add stimulus here
        for( int i=0; i<100; i++ ) begin
            #20;
            write_enable = 1;
            address = address + 1'b1;
            data = data + 1'b1;
        end

        #20;
        address = 0;
        for( int j=0; j<100; j++ ) begin    
            #20;
            write_enable = 0;
            address = address + 1'b1;
            data = 0;
        end

        $stop;

	end
endmodule