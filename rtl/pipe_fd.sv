`timescale 1ns / 1ps
module pipe_fd #( parameter WIDTH = 32 )
(
    input logic CLK,
    input logic CLR,
    input logic [WIDTH-1:0] INSTR_F,
    input logic [WIDTH-1:0] PCPLUS4_F,
    output logic [WIDTH-1:0] INSTR_D,
    output logic [WIDTH-1:0] PCPLUS4_D
);

logic [31:0] temp_instr;
logic [31:0] temp_pc_plus4;

initial begin
    temp_instr = {32{1'b1}};
    temp_pc_plus4 = {32{1'b0}};
end

always@( negedge CLK or posedge CLR ) begin
    if( CLR ) begin
        temp_instr = {32{1'b1}};
        temp_pc_plus4 = {32{1'b1}};
    end
    else begin
        temp_instr = INSTR_F;
        temp_pc_plus4 = PCPLUS4_F;
    end
end

assign INSTR_D = temp_instr;
assign PCPLUS4_D = temp_pc_plus4;

endmodule