`timescale 1ns / 1ps
module cpu #( parameter WIDTH = 32 )
(
    input logic CLK,
    input logic RESET,
    input logic [WIDTH-1:0] INSTR,
    input logic [WIDTH-1:0] READ_MEM_DATA,
    output logic [WIDTH-1:0] PC,
    output logic [WIDTH-1:0] MEM_ADDR,
    output logic WRITE_MEM_EN,
    output logic [WIDTH-1:0] WRITE_MEM_DATA
);

logic [WIDTH-1:0] temp_pc;
logic [WIDTH-1:0] const_four;

initial begin
    temp_pc = {32{1'b0}};
    const_four = 32'd4;
end

/* WIRES */
logic [WIDTH-1:0] pc_f;
logic [WIDTH-1:0] pcplus4_f;

logic [WIDTH-1:0] instr_d;
logic regwrite_d;
logic memtoreg_d;
logic memwrite_d;
logic [3:0] alucontrol_d;
logic [1:0] alusrc_d;
logic branch_d;
logic pcsrc_d;
logic pcbranch_d;
logic [WIDTH-1:0] rd1_d;
logic [WIDTH-1:0] rd2_d;
logic [WIDTH-1:0] signimm_d;
logic [WIDTH-1:0] pcplus4_d;
logic [WIDTH-1:0] signimm_ext_d;
logic [2:0] shift_d;
logic notequal_d;

logic regwrite_e;
logic memtoreg_e;
logic memwrite_e;
logic [3:0] alucontrol_e;
logic [1:0] alusrc_e;
logic [WIDTH-1:0] rd1_e;
logic [WIDTH-1:0] rd2_e;
logic [4:0] ra1_e;
logic [4:0] ra2_e;
logic [4:0] rs_e;
logic [WIDTH-1:0] signimm_e;
logic [2:0] shift_e;
logic [WIDTH-1:0] srca_e;
logic [WIDTH-1:0] srcb_e;
logic [WIDTH-1:0] aluout_e;
logic [4:0] writereg_e;

logic regwrite_m;
logic memtoreg_m;
logic memwrite_m;
logic [WIDTH-1:0] aluout_m;
logic [WIDTH-1:0] writedata_m;
logic [4:0] writereg_m;
logic [WIDTH-1:0] readdata_m;

logic regwrite_w;
logic memtoreg_w;
logic [WIDTH-1:0] readdata_w;
logic [WIDTH-1:0] aluout_w;
logic [4:0] writereg_w;
logic [WIDTH-1:0] result_w;

/**************************************/
/* FETCH */
pipe_wf p_wf(
    .CLK( CLK ),
    .CLR( RESET ),
    .PC( temp_pc ),
    .PC_F( pc_f )
);

adder #(WIDTH) add_pc_4(
    .DATA_IN_1( pc_f ),
    .DATA_IN_2( const_four ),
    .DATA_OUT( pcplus4_f )
);

/**************************************/
/* DECODE */
pipe_fd p_fd(
    .CLK( CLK ),
    .CLR( RESET ),
    .INSTR_F( INSTR ),
    .PCPLUS4_F( pcplus4_f ),
    .INSTR_D( instr_d ),
    .PCPLUS4_D( pcplus4_d )
);
control_unit cu(
    .OP( instr_d[31:26] ),
    .VEC( instr_d[0] ),
    .REG_WRITE( regwrite_d ),
    .MEM_TO_REG( memtoreg_d ),
    .MEM_WRITE( memwrite_d ),
    .ALU_CONTROL( alucontrol_d ),
    .ALU_SRC( alusrc_d ),
    .BRANCH( branch_d ),
    .NOT_EQUAL( notequal_d )
);
reg_bank #(WIDTH, WIDTH) rb(
    .CLK( CLK ),
    .WE3( regwrite_w ),
    .RA1( instr_d[20:16] ),
    .RA2( instr_d[15:11] ),
    .RA3( writereg_w ),
    .WD3( result_w ),
    .RD1( rd1_d ),
    .RD2( rd2_d )
);
is_equal #(WIDTH) ie(
    .ENABLE( notequal_d ),
    .DATA_IN_1( rd2_d ),
    .DATA_IN_2( rd1_d ),
    .EQUAL( equal_d )
);
and_gate ag_1(
    .DATA_IN_1( branch_d ),
    .DATA_IN_2( equal_d ),
    .DATA_OUT( pcsrc_d )
);
sign_extend #(WIDTH) se(
    .DATA( instr_d[15:0] ),
    .EXTENDED( signimm_d )
);
shifter #(WIDTH) sh(
    .DATA( signimm_d ),
    .SHIFTED( signimm_ext_d )
);
adder #(WIDTH) add_sig(
    .DATA_IN_1( signimm_ext_d ),
    .DATA_IN_2( pcplus4_d ),
    .DATA_OUT( pcbranch_d )
);

/**************************************/
/* EXECUTE */
pipe_de #(WIDTH) p_de( 
    .CLK( CLK ),
    .CLR( RESET ),
    .REG_WRITE_D( regwrite_d ),
    .MEM_TO_REG_D( memtoreg_d ),
    .MEM_WRITE_D( memwrite_d ),
    .ALU_CONTROL_D( alucontrol_d ),
    .ALU_SRC_D( alusrc_d ),
    .RD1_D( rd1_d ),
    .RD2_D( rd2_d ),
    .RA1_D( instr_d[20:16] ),
    .RA2_D( instr_d[15:11] ),
    .RS_D( rs_d ),
    .SIGN_IMM_D( signimm_d ),
    .SHIFT_D( instr_d[3:1] ),
    .WRITE_REG_D( instr_d[25:21] ),

    .REG_WRITE_E( regwrite_e ),
    .MEM_TO_REG_E( memtoreg_e ),
    .MEM_WRITE_E( memwrite_e ),
    .ALU_CONTROL_E(  alucontrol_e),
    .ALU_SRC_E( alusrc_e ),
    .RD1_E( rd1_e ),
    .RD2_E( rd2_e ),
    .RA1_E( ra1_e ),
    .RA2_E( ra2_e ),
    .RS_E( rs_e ),
    .SIGN_IMM_E( signimm_e ),
    .SHIFT_E( shift_e ),
    .WRITE_REG_E( writereg_e )
);
mux_3x1 #(WIDTH) m_2(
    .SELECT( alusrc_e ),
    .DATA_IN_1( rd2_e ), 
    .DATA_IN_2( shift_e ), 
    .DATA_IN_3( signimm_e ), 
    .DATA_OUT( srcb_e )
);
alu #(WIDTH) alu_1( 
    .SRC_A( rd1_e ),
    .SRC_B( srcb_e ),
    .ALU_CONTROL( alucontrol_e ),
    .ALU_OUT( aluout_e )
);

/**************************************/
/* MEMORY */
pipe_em #(WIDTH) p_em( 
    .CLK( CLK ),
    .CLR( RESET ),
    .REG_WRITE_E( regwrite_e ),
    .MEM_TO_REG_E( memtoreg_e ),
    .MEM_WRITE_E( memwrite_e ),
    .ALU_OUT_E( aluout_e ),
    .WRITE_DATA_E( writedata_e ),
    .WRITE_REG_E( writereg_e ),

    .REG_WRITE_M( regwrite_m ),
    .MEM_TO_REG_M( memtoreg_m ),
    .MEM_WRITE_M( memwrite_m ),
    .ALU_OUT_M( aluout_m ),
    .WRITE_DATA_M( writedata_m ),
    .WRITE_REG_M( writereg_m )
);
ram ram_1(
    .CLK( CLK ), 
    .WE( memwrite_m ),
    .ADDRESS( aluout_m ), 
    .WD( writedata_m ),
    .RD( readdata_m )
);

/**************************************/
/* WRITEBACK */
pipe_mw p_mw(
    .CLK( CLK ),
    .CLR( RESET ),
    .REG_WRITE_M( regwrite_m ),
    .MEM_TO_REG_M( memtoreg_m ),
    .READ_DATA_M( readdata_m ),
    .ALU_OUT_M( aluout_m ),
    .WRITE_REG_M( writereg_m ),

    .REG_WRITE_W( regwrite_w ),
    .MEM_TO_REG_W( memtoreg_w ),
    .READ_DATA_W(  readdata_w),
    .ALU_OUT_W( aluout_w ),
    .WRITE_REG_W( writereg_w )
);
mux_2x1 m_4(
    .SELECT( memtoreg_w ),
    .DATA_IN_1( aluout_w ),
    .DATA_IN_2( readdata_w ),
    .DATA_OUT( result_w )
);
mux_2x1 m_1(
    .SELECT( pcsrc_d ),
    .DATA_IN_1( pcplus4_f ),
    .DATA_IN_2( pcbranch_d ),
    .DATA_OUT( temp_pc )
);

/**************************************/
/* OUTPUTS */
assign PC = pc_f;
assign MEM_ADDR = aluout_m;
assign WRITE_MEM_EN = memwrite_m;
assign WRITE_MEM_DATA = writedata_m;

endmodule