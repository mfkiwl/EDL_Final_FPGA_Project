// ============================================================================
//   Ver  :| Author					:| Mod. Date :| Changes Made:
//   V1.1 :| Alexandra Du			:| 06/01/2016:| Added Verilog file
// ============================================================================


//=======================================================
//  This code is generated by Terasic System Builder
//=======================================================

`define ENABLE_ADC_CLOCK
`define ENABLE_CLOCK1
`define ENABLE_CLOCK2
`define ENABLE_SDRAM
`define ENABLE_HEX0
`define ENABLE_HEX1
`define ENABLE_HEX2
`define ENABLE_HEX3
`define ENABLE_HEX4
`define ENABLE_HEX5
`define ENABLE_KEY
`define ENABLE_LED
`define ENABLE_SW
`define ENABLE_VGA
`define ENABLE_ACCELEROMETER
`define ENABLE_ARDUINO
`define ENABLE_GPIO

module DE10_LITE_Golden_Top(

	//////////// ADC CLOCK: 3.3-V LVTTL //////////
`ifdef ENABLE_ADC_CLOCK
	input 		          		ADC_CLK_10,
`endif
	//////////// CLOCK 1: 3.3-V LVTTL //////////
`ifdef ENABLE_CLOCK1
	input 		          		MAX10_CLK1_50,
`endif
	//////////// CLOCK 2: 3.3-V LVTTL //////////
`ifdef ENABLE_CLOCK2
	input 		          		MAX10_CLK2_50,
`endif

	//////////// SDRAM: 3.3-V LVTTL //////////
`ifdef ENABLE_SDRAM
	output		    [12:0]		DRAM_ADDR,
	output		     [1:0]		DRAM_BA,
	output		          		DRAM_CAS_N,
	output		          		DRAM_CKE,
	output		          		DRAM_CLK,
	output		          		DRAM_CS_N,
	inout 		    [15:0]		DRAM_DQ,
	output		          		DRAM_LDQM,
	output		          		DRAM_RAS_N,
	output		          		DRAM_UDQM,
	output		          		DRAM_WE_N,
`endif

	//////////// SEG7: 3.3-V LVTTL //////////
`ifdef ENABLE_HEX0
	output		     [7:0]		HEX0,
`endif
`ifdef ENABLE_HEX1
	output		     [7:0]		HEX1,
`endif
`ifdef ENABLE_HEX2
	output		     [7:0]		HEX2,
`endif
`ifdef ENABLE_HEX3
	output		     [7:0]		HEX3,
`endif
`ifdef ENABLE_HEX4
	output		     [7:0]		HEX4,
`endif
`ifdef ENABLE_HEX5
	output		     [7:0]		HEX5,
`endif

	//////////// KEY: 3.3 V SCHMITT TRIGGER //////////
`ifdef ENABLE_KEY
	input 		     [1:0]		KEY,
`endif

	//////////// LED: 3.3-V LVTTL //////////
`ifdef ENABLE_LED
	output		     [9:0]		LEDR,
`endif

	//////////// SW: 3.3-V LVTTL //////////
`ifdef ENABLE_SW
	input 		     [9:0]		SW,
`endif

	//////////// VGA: 3.3-V LVTTL //////////
`ifdef ENABLE_VGA
	output		     [3:0]		VGA_B,
	output		     [3:0]		VGA_G,
	output		          		VGA_HS,
	output		     [3:0]		VGA_R,
	output		          		VGA_VS,
`endif

	//////////// Accelerometer: 3.3-V LVTTL //////////
`ifdef ENABLE_ACCELEROMETER
	output		          		GSENSOR_CS_N,
	input 		     [2:1]		GSENSOR_INT,
	output		          		GSENSOR_SCLK,
	inout 		          		GSENSOR_SDI,
	inout 		          		GSENSOR_SDO,
`endif

	//////////// Arduino: 3.3-V LVTTL //////////
`ifdef ENABLE_ARDUINO
	inout 		    [15:0]		ARDUINO_IO,
	inout 		          		ARDUINO_RESET_N,
`endif

	//////////// GPIO, GPIO connect to GPIO Default: 3.3-V LVTTL //////////
`ifdef ENABLE_GPIO
	inout 		    [35:0]		GPIO
`endif
);


wire 		  CAMERA_CLOCK;		// Clock driving camera
wire [7:0] CAMERA_DATA;			// Camera parallel interface
wire       PIXEL_CLOCK;			// Pixel clock coming back from camera
wire 		  VSYNC;					// Camera vertical sync pulse
wire 		  HREF;					// camera horizontal reference

wire RST_BRIDGE;
wire SYSCLK;

wire [23:0] RGB_DATA;
wire 			SOP;
wire 			EOP;
wire 			VALID;
wire 			READY;

wire		  PWM_CLOCK;
wire [7:0] PWM_1;
wire [7:0] PWM_2;
wire 		  PWM_1_OUT;
wire 		  PWM_2_OUT;

wire C_1;
wire CW_1;
wire C_2;
wire CW_2;

wire ON_OFF;

wire [31:0] UPTIME;

//encoder counters
wire signed [31:0] LEFT_ENC;
wire signed [31:0] RIGHT_ENC;

// Camera external connections

assign GPIO[0] = CAMERA_CLOCK;

assign PIXEL_CLOCK = GPIO[2];
assign CAMERA_DATA = {GPIO[7:3], GPIO[11], GPIO[1], GPIO[10]};
assign VSYNC 		 = GPIO[8];
assign HREF  		 = GPIO[9];

// Turn off HEX displays
assign HEX0 = 8'hFF;
assign HEX1 = 8'hFF;
assign HEX2 = 8'hFF;
assign HEX3 = 8'hFF;
assign HEX4 = 8'hFF;
assign HEX5 = 8'hFF;

// Setup Arduino GPIO for motor drive

assign ARDUINO_IO[0] = PWM_1_OUT;

assign ARDUINO_IO[1] = C_1;
assign ARDUINO_IO[2] = CW_1;

assign ENC_A_1 = ARDUINO_IO[3];
assign ENC_B_1 = ARDUINO_IO[4];

assign ARDUINO_IO[5] = PWM_2_OUT;

assign ARDUINO_IO[6] = C_2;
assign ARDUINO_IO[7] = CW_2;

assign ENC_A_2 = ARDUINO_IO[8];
assign ENC_B_2 = ARDUINO_IO[9];

assign ON_OFF = ARDUINO_IO[10];

Uptime uptime(

    .clk				(PWM_CLOCK),
    .uptime			(UPTIME)

);


PWM pwm_1(
    .clk				(PWM_CLOCK),
    .PWM_in			(PWM_1),
    .PWM_out		(PWM_1_OUT)
);

PWM pwm_2(
    .clk				(PWM_CLOCK),
    .PWM_in			(PWM_2),
    .PWM_out		(PWM_2_OUT)
);

CameraClockGenerator cam_clk (
	.inclk0			(MAX10_CLK1_50),
	.c0				(CAMERA_CLOCK),
	.c1				(PWM_CLOCK)
);

CameraStreamer streamer (

	.clk					(SYSCLK),
	.reset				(RST_BRIDGE),
	.ready				(READY),

	.camera_data		(CAMERA_DATA),
	.pixel_clock		(PIXEL_CLOCK),
	.vsync				(VSYNC),
	.href					(HREF),

	.data					(RGB_DATA),
	.startofpacket		(SOP),
	.endofpacket		(EOP),
	.empty				(),
	.valid				(VALID)
	
);

quadrature left_wheel(
	.clk 					(PWM_CLOCK),
	.quadA				(ENC_A_1),
	.quadB				(ENC_B_1),
	.count				(LEFT_ENC)
);

quadrature right_wheel(
	.clk 					(PWM_CLOCK),
	.quadA				(ENC_A_2),
	.quadB				(ENC_B_2),
	.count				(RIGHT_ENC)
);

/*
ColorBarTest color_bar_generator (

	.clk					(SYSCLK),
	.reset				(RST_BRIDGE),
	.ready				(READY),
	
	.data					(RGB_DATA),
	.startofpacket		(SOP),
	.endofpacket		(EOP),
	.empty				(),
	.valid				(VALID)

);
*/
	
EDL_Final cpu (

		.clk_clk							  		   (MAX10_CLK1_50),          //             clk.clk

		.sysclk_clk									(SYSCLK),                 //          sysclk.clk
		
		.reset_reset								(1'b1), 					     //           reset.reset_n
		.reset_bridge_reset                 (RST_BRIDGE),             //    reset_bridge.reset

		.pixel_clk_clk								(PIXEL_CLK),              //       pixel_clk.clk
		.pixel_reset_reset						(1'b1),                   //     pixel_reset.reset
		
		.button_external_connection_export  (KEY),

		.led_external_connection_export		(LEDR),
		
		.pwm_export									({PWM_1, PWM_2}),         //             pwm.export

		.encoder_left_export						(LEFT_ENC),               //    encoder_left.export
		.encoder_right_export					(RIGHT_ENC),              //   encoder_right.export

		.motor_direction_export					({C_1, CW_1, C_2, CW_2}), // motor_direction.export
		.on_button_export							(ON_OFF),                 //       on_button.export

		.uptime_export								(UPTIME),                 //          uptime.export
		
		.sdram_clk_clk								(DRAM_CLK), 			     //       sdram_clk.clk
		.sdram_wire_addr							(DRAM_ADDR),				  //      sdram_wire.addr
		.sdram_wire_ba								(DRAM_BA),				     //                .ba
		.sdram_wire_cas_n							(DRAM_CAS_N),				  //                .cas_n
		.sdram_wire_cke 							(DRAM_CKE),					  //                .cke
		.sdram_wire_cs_n							(DRAM_CS_N),				  //                .cs_n
		.sdram_wire_dq								(DRAM_DQ), 					  //                .dq
		.sdram_wire_dqm							({DRAM_UDQM, DRAM_LDQM}), //                .dqm
		.sdram_wire_ras_n							(DRAM_RAS_N),				  //                .ras_n
		.sdram_wire_we_n							(DRAM_WE_N),   			  //                .we_n

		.video_dma_sink_data						(RGB_DATA),               //  video_dma_sink.data
		.video_dma_sink_startofpacket			(SOP),      				  //                .startofpacket
		.video_dma_sink_endofpacket			(EOP),        				  //                .endofpacket
		.video_dma_sink_valid					(VALID),              	  //                .valid
		.video_dma_sink_ready               (READY) 						  //                .ready

	);


endmodule
