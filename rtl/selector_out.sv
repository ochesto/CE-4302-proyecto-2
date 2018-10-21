`timescale 1ns / 1ps
module selector_out #( parameter WIDTH = 32)
(
    input logic SELECT,
	input logic [WIDTH-1:0] DATA_IN,
	output logic [WIDTH-1:0] DATA_OUT_0,
    output logic [WIDTH-1:0] DATA_OUT_1
);

parameter OPTION_0 = 1'b0;
parameter OPTION_1 = 1'b1;

logic [WIDTH-1:0] result_0;
logic [WIDTH-1:0] result_1;

always_comb begin
    case( SELECT )
        
        OPTION_0: begin
            result_0 = DATA_IN;
            result_1 = {32{1'b0}};
        end

        OPTION_1: begin
            result_0 = {32{1'b0}};
            result_1 = DATA_IN;
        end

        default: begin
            result_0 = DATA_IN;
            result_1 = {32{1'b0}};
        end
    endcase    
end

assign DATA_OUT_0 = result_0;
assign DATA_OUT_1 = result_1;

endmodule