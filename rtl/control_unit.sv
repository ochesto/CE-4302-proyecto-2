`timescale 1ns / 1ps
module control_unit
(
input logic [31:26] OP,
input logic [0:0] VEC,
output logic REG_WRITE,
output logic MEM_TO_REG,
output logic MEM_WRITE,
output logic [3:0] ALU_CONTROL,
output logic [1:0] ALU_SRC,
output logic BRANCH,
output logic NOT_EQUAL
);

parameter ADD = 6'b000000;
parameter ADDI = 6'b000001;
parameter ADDV = 6'b000000;
parameter SUB = 6'b000010;
parameter SUBI = 6'b000011;
parameter SUBV = 6'b000010;
parameter XOR = 6'b000100;
parameter XORI = 6'b000101;
parameter XORV = 6'b000100;
parameter MULT = 6'b000110;
parameter SLV = 6'b000111;
parameter SRV = 6'b001000;
parameter SCLV = 6'b001001;
parameter SCRV = 6'b001010;
parameter LW = 6'b001011;
parameter LWV = 6'b001011;
parameter SW = 6'b001100;
parameter SWV = 6'b001100;
parameter JUMP = 6'b001101;
parameter BRANCH_EQ = 6'b010000;
parameter NOP = 6'b111111;

parameter ALU_ADD = 4'b0000;
parameter ALU_SUB = 4'b0001;
parameter ALU_MULT = 4'b0010;
parameter ALU_XOR = 4'b0011;
parameter ALU_ADDV = 4'b0100;
parameter ALU_SUBV = 4'b0101;
parameter ALU_XORV = 4'b0110;
parameter ALU_SLV = 4'b0111;
parameter ALU_SRV = 4'b1000;
parameter ALU_SCLV = 4'b1001;
parameter ALU_SCRV = 4'b1010;
parameter ALU_NOP = 4'b1111;

parameter BIT_OFF = 1'b0;
parameter BIT_ON = 1'b1;

parameter ALU_SRC_RD = 2'b00;
parameter ALU_SRC_SHIFT = 2'b01;
parameter ALU_SRC_SE = 2'b10;

logic [10:0] controls;

always_comb begin
case(OP)
	
	ADD: begin
			controls = (VEC) ? {BIT_ON,BIT_OFF,BIT_OFF,ALU_ADDV,ALU_SRC_RD,BIT_OFF,BIT_OFF} : 
			{BIT_ON,BIT_OFF,BIT_OFF,ALU_ADD,ALU_SRC_RD,BIT_OFF,BIT_OFF};
	end

	ADDI: begin
			controls = {BIT_ON,BIT_OFF,BIT_OFF,ALU_ADD,ALU_SRC_SE,BIT_OFF,BIT_OFF};
	end

	SUB: begin
			controls = (VEC) ? {BIT_ON,BIT_OFF,BIT_OFF,ALU_SUBV,ALU_SRC_RD,BIT_OFF,BIT_OFF} : 
			{BIT_ON,BIT_OFF,BIT_OFF,ALU_SUB,ALU_SRC_RD,BIT_OFF,BIT_OFF};
	end

	SUBI: begin
			controls = {BIT_ON,BIT_OFF,BIT_OFF,ALU_SUB,ALU_SRC_SE,BIT_OFF,BIT_OFF};
	end

	XOR: begin
			controls = (VEC) ? {BIT_ON,BIT_OFF,BIT_OFF,ALU_XORV,ALU_SRC_RD,BIT_OFF,BIT_OFF} : 
			{BIT_ON,BIT_OFF,BIT_OFF,ALU_XOR,ALU_SRC_RD,BIT_OFF,BIT_OFF};
	end

	XORI: begin
			controls = (VEC) ? {BIT_ON,BIT_OFF,BIT_OFF,ALU_XORV,ALU_SRC_SE,BIT_OFF,BIT_OFF} : 
			{BIT_ON,BIT_OFF,BIT_OFF,ALU_XOR,ALU_SRC_SE,BIT_OFF,BIT_OFF};
	end

	MULT: begin
			controls = {BIT_ON,BIT_OFF,BIT_OFF,ALU_MULT,ALU_SRC_RD,BIT_OFF,BIT_OFF};
	end

	SLV: begin
			controls = {BIT_ON,BIT_OFF,BIT_OFF,ALU_SLV,ALU_SRC_SHIFT,BIT_OFF,BIT_OFF};
	end

	SRV: begin
			controls = {BIT_ON,BIT_OFF,BIT_OFF,ALU_SRV,ALU_SRC_SHIFT,BIT_OFF,BIT_OFF};
	end

	SCLV: begin
			controls = {BIT_ON,BIT_OFF,BIT_OFF,ALU_SCLV,ALU_SRC_SHIFT,BIT_OFF,BIT_OFF};
	end

	SCRV: begin
			controls = {BIT_ON,BIT_OFF,BIT_OFF,ALU_SCRV,ALU_SRC_SHIFT,BIT_OFF,BIT_OFF};
	end

	LW: begin
			controls = {BIT_ON,BIT_ON,BIT_OFF,ALU_ADD,ALU_SRC_RD,BIT_OFF,BIT_OFF};
	end

	LWV: begin
			controls = {BIT_ON,BIT_ON,BIT_OFF,ALU_ADD,ALU_SRC_RD,BIT_OFF,BIT_OFF};
	end

	SW: begin
			controls = {BIT_OFF,BIT_OFF,BIT_ON,ALU_ADD,ALU_SRC_RD,BIT_OFF,BIT_OFF};
	end

	SWV: begin
			controls = {BIT_OFF,BIT_OFF,BIT_ON,ALU_ADD,ALU_SRC_RD,BIT_OFF,BIT_OFF};
	end

	JUMP: begin /* TODO: add clear pipes controller */
			controls = {BIT_OFF,BIT_OFF,BIT_OFF,ALU_ADD,ALU_SRC_RD,BIT_ON,BIT_ON};
	end

	BRANCH_EQ: begin
			controls = {BIT_OFF,BIT_OFF,BIT_OFF,ALU_ADD,ALU_SRC_RD,BIT_ON,BIT_OFF};
	end

	NOP: begin 
			controls = {BIT_OFF,BIT_OFF,BIT_OFF,ALU_NOP,ALU_SRC_SHIFT,BIT_OFF,BIT_OFF};
	end

endcase
end

assign {	REG_WRITE, 
					MEM_TO_REG, 
					MEM_WRITE, 
					ALU_CONTROL, 
					ALU_SRC, 
					BRANCH,
					NOT_EQUAL } = controls;

endmodule
