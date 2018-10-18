`timescale 1ns / 1ps
module pipe_fd_tb;

    parameter WIDTH = 32;

	// Inputs
    logic clk;
    logic clr;
    logic [WIDTH-1:0] instr;
    logic [WIDTH-1:0] pc;
	
	//Outputs
    logic [WIDTH-1:0] instr_out;
    logic [WIDTH-1:0] pc_out;

	// Instantiate the Device Under Test (DUT)
    pipe_fd #(WIDTH) DUT( 
			.CLK( clk ),
            .CLR( clr ),
            .INSTR_F( instr ),
            .PCPLUS4_F( pc ),
            .INSTR_D( instr_out ),
            .PCPLUS4_D( pc_out )
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
        clr = 0;
        instr = 32'd0;
        pc = 32'b0;
        #5;

        #10;
        instr = 32'd1;
        pc = 32'd4;
        #10;
        instr = 32'd2;
        pc = 32'd8;
        #10;
        instr = 32'd3;
        pc = 32'd12;
        #10;
        $stop;

	end
endmodule