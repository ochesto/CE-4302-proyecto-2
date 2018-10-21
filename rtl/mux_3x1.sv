`timescale 1ns / 1ps
module mux_3x1 #( parameter WIDTH = 32)
(
    input logic [1:0] SELECT,
	input logic [WIDTH-1:0] DATA_IN_1,
    input logic [WIDTH-1:0] DATA_IN_2,
    input logic [WIDTH-1:0] DATA_IN_3,
	output logic [WIDTH-1:0] DATA_OUT
);

parameter SELECT_1 = 2'b00;
parameter SELECT_2 = 2'b01;
parameter SELECT_3 = 2'b10;

logic [WIDTH-1:0] out;

always_comb begin
    case( SELECT )
        
        SELECT_1: begin
            out = DATA_IN_1;
        end

        SELECT_2: begin
            out = {{29{1'b0}}, DATA_IN_2[2:0]};
        end

        SELECT_3: begin
            out = DATA_IN_3;
        end

        default: begin
            out = {32{1'b0}};
        end

    endcase    
end

assign DATA_OUT = out;

endmodule