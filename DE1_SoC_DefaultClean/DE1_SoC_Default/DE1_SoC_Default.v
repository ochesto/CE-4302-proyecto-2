// ============================================================================
// Copyright (c) 2013 by Terasic Technologies Inc.
// ============================================================================
//
// Permission:
//
//   Terasic grants permission to use and modify this code for use
//   in synthesis for all Terasic Development Boards and Altera Development 
//   Kits made by Terasic.  Other use of this code, including the selling 
//   ,duplication, or modification of any portion is strictly prohibited.
//
// Disclaimer:
//
//   This VHDL/Verilog or C/C++ source code is intended as a design reference
//   which illustrates how these types of functions can be implemented.
//   It is the user's responsibility to verify their design for
//   consistency and functionality through the use of formal
//   verification methods.  Terasic provides no warranty regarding the use 
//   or functionality of this code.
//
// ============================================================================
//           
//  Terasic Technologies Inc
//  9F., No.176, Sec.2, Gongdao 5th Rd, East Dist, Hsinchu City, 30070. Taiwan
//  
//  
//                     web: http://www.terasic.com/  
//                     email: support@terasic.com
//
// ============================================================================
//Date:  Mon Jun 17 20:35:29 2013
// ============================================================================

//`define ENABLE_HPS

module DE1_SoC_Default(

      ///////// ADC /////////
      inout              ADC_CS_N,
      output             ADC_DIN,
      input              ADC_DOUT,
      output             ADC_SCLK,

      ///////// AUD /////////
      input              AUD_ADCDAT,
      inout              AUD_ADCLRCK,
      inout              AUD_BCLK,
      output             AUD_DACDAT,
      inout              AUD_DACLRCK,
      output             AUD_XCK,

      ///////// CLOCK2 /////////
      input              CLOCK2_50,

      ///////// CLOCK3 /////////
      input              CLOCK3_50,

      ///////// CLOCK4 /////////
      input              CLOCK4_50,

      ///////// CLOCK /////////
      input              CLOCK_50,


      ///////// FAN /////////
      output             FAN_CTRL,

      ///////// FPGA /////////
      output             FPGA_I2C_SCLK,
      inout              FPGA_I2C_SDAT,

 

  



      ///////// KEY /////////
      input       [3:0]  KEY,

    



      ///////// SW /////////
      input       [9:0]  SW,

      ///////// TD /////////
      input              TD_CLK27,
      input      [7:0]  TD_DATA,
      input             TD_HS,
      output             TD_RESET_N,
      input             TD_VS,

      ///////// VGA /////////
      output      [7:0]  VGA_B,
      output             VGA_BLANK_N,
      output             VGA_CLK,
      output      [7:0]  VGA_G,
      output             VGA_HS,
      output      [7:0]  VGA_R,
      output             VGA_SYNC_N,
      output             VGA_VS
);



//=======================================================
//  REG/WIRE declarations
//=======================================================


//	For Audio CODEC
//wire		   AUD_CTRL_CLK;	//	For Audio Controller

//	For VGA Controller
wire		   VGA_CTRL_CLK;
wire  [9:0]	mVGA_R;
wire  [9:0]	mVGA_G;
wire  [9:0]	mVGA_B;
wire [19:0]	mVGA_ADDR;

wire			mVGA_CLK;
wire	[9:0]	mRed;
wire	[9:0]	mGreen;
wire	[9:0]	mBlue;
wire			VGA_Read;	//	VGA data request

wire  [9:0] recon_VGA_R;
wire  [9:0] recon_VGA_G;
wire  [9:0] recon_VGA_B;

wire		   DLY_RST;
reg  [31:0]	Cont;
wire [23:0]	mSEG7_DIG;

wire			mDVAL;

//audio count
reg [31:0] audio_count;
reg        key1_reg;

//=======================================================
//  Structural coding
//=======================================================

// initial //  
	         
assign DRAM_DQ 			= 16'hzzzz;

assign GPIO_A  		=	36'hzzzzzzzz;
assign GPIO_B  		=	36'hzzzzzzzz;

//	Enable TV Decoder
//assign	TD_RESET_N	=	KEY[0];


always@(posedge CLOCK_50 or negedge KEY[0])
    begin
        if(!KEY[0])
			 Cont	<=	0;
        else
			 Cont	<=	Cont+1;
    end
	 

always@(posedge CLOCK_50)
    begin
			 key1_reg	<=	KEY[1];
        if(key1_reg & (!KEY[1]))
		    audio_count = audio_count + 1;
    end	 

//	Reset Delay Timer
Reset_Delay			r0	(	
							 .iCLK(CLOCK_50),
							 .oRESET(DLY_RST));
//	 Audio VGA PLL clock							 

VGA_Audio u1(
		                .refclk(CLOCK_50),   //  refclk.clk
		                .rst(~DLY_RST),      //   reset.reset
		                .outclk_0(VGA_CTRL_CLK), // outclk0.clk
		                .outclk_1(AUD_CTRL_CLK), // outclk1.clk
		                .outclk_2(mVGA_CLK), // outclk2.clk
		                .locked()    //  locked.export
	);


assign VGA_CLK = VGA_CTRL_CLK;
vga_controller vga_ins(.iRST_n(DLY_RST),
                      .iVGA_CLK(VGA_CTRL_CLK),
                      .oBLANK_n(VGA_BLANK_N),
                      .oHS(VGA_HS),
                      .oVS(VGA_VS),
                      .b_data(VGA_B),
                      .g_data(VGA_G),
                      .r_data(VGA_R));	

endmodule
