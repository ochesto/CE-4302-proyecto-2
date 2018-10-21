`timescale 1ns / 1ps
module cpu_tb;

    parameter WIDTH = 32;

	// Inputs
    logic clk;
    logic reset;
    logic [WIDTH-1:0] instr;
    logic [WIDTH-1:0] read_mem_data;
    logic switch_0;
    logic switch_1;
	
	//Outputs
    logic [WIDTH-1:0] pc;
    logic [WIDTH-1:0] mem_address;
    logic write_mem_data_enable;
    logic [WIDTH-1:0] write_mem_data;

	// Instantiate the Device Under Test (DUT)
    cpu #(WIDTH) DUT( 
        .CLK( clk ),
        .RESET( reset ),
        .INSTR( instr ),
        .READ_MEM_DATA( read_mem_data ),
        .SWITCH_0( switch_0 ),
        .SWITCH_1( switch_1 ),
        .PC( pc ),
        .MEM_ADDR( mem_address ),
        .WRITE_MEM_EN( write_mem_data_enable ),
        .WRITE_MEM_DATA(write_mem_data  )
    );
    
    instruction_rom ir(
        .CLK( clk ),
        .RESET( reset ),
        .ADDRESS( pc ),
        .INSTR( instr )
    );

    ram rm(
        .CLK( clk ), 
        .WE( write_mem_data_enable ),
        .ADDRESS( mem_address ), 
        .WD( write_mem_data ),
        .RD( read_mem_data )
    );
    /*iniRam nr(
        .address( mem_address ),
        .clock( clk ),
        .data( write_mem_data ),
        .wren( write_mem_data_enable ),
        .q( read_mem_data )
    );*/

    initial begin
		clk = 1'b0;
		forever begin
			#5;
			clk = ~clk;
		end
	end

	initial begin
        reset = 1;
        switch_0 = 0;
        switch_1 = 0;
        #100;
        reset = 0;

        #500;
        $stop;
	end
endmodule