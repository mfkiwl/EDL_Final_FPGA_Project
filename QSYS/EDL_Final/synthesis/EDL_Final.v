// EDL_Final.v

// Generated using ACDS version 18.1 625

`timescale 1 ps / 1 ps
module EDL_Final (
		input  wire [1:0]  button_external_connection_export, // button_external_connection.export
		input  wire        clk_clk,                           //                        clk.clk
		output wire [9:0]  led_external_connection_export,    //    led_external_connection.export
		input  wire        pixel_clk_clk,                     //                  pixel_clk.clk
		input  wire        pixel_reset_reset,                 //                pixel_reset.reset
		input  wire        reset_reset,                       //                      reset.reset
		output wire        reset_bridge_reset,                //               reset_bridge.reset
		output wire        sdram_clk_clk,                     //                  sdram_clk.clk
		output wire [12:0] sdram_wire_addr,                   //                 sdram_wire.addr
		output wire [1:0]  sdram_wire_ba,                     //                           .ba
		output wire        sdram_wire_cas_n,                  //                           .cas_n
		output wire        sdram_wire_cke,                    //                           .cke
		output wire        sdram_wire_cs_n,                   //                           .cs_n
		inout  wire [15:0] sdram_wire_dq,                     //                           .dq
		output wire [1:0]  sdram_wire_dqm,                    //                           .dqm
		output wire        sdram_wire_ras_n,                  //                           .ras_n
		output wire        sdram_wire_we_n,                   //                           .we_n
		output wire        sysclk_clk,                        //                     sysclk.clk
		input  wire [23:0] video_dma_sink_data,               //             video_dma_sink.data
		input  wire        video_dma_sink_startofpacket,      //                           .startofpacket
		input  wire        video_dma_sink_endofpacket,        //                           .endofpacket
		input  wire        video_dma_sink_valid,              //                           .valid
		output wire        video_dma_sink_ready               //                           .ready
	);

	wire         video_dma_controller_avalon_dma_master_waitrequest;                         // mm_interconnect_0:video_dma_controller_avalon_dma_master_waitrequest -> video_dma_controller:master_waitrequest
	wire  [31:0] video_dma_controller_avalon_dma_master_address;                             // video_dma_controller:master_address -> mm_interconnect_0:video_dma_controller_avalon_dma_master_address
	wire         video_dma_controller_avalon_dma_master_write;                               // video_dma_controller:master_write -> mm_interconnect_0:video_dma_controller_avalon_dma_master_write
	wire  [31:0] video_dma_controller_avalon_dma_master_writedata;                           // video_dma_controller:master_writedata -> mm_interconnect_0:video_dma_controller_avalon_dma_master_writedata
	wire  [31:0] cpu_data_master_readdata;                                                   // mm_interconnect_0:cpu_data_master_readdata -> cpu:d_readdata
	wire         cpu_data_master_waitrequest;                                                // mm_interconnect_0:cpu_data_master_waitrequest -> cpu:d_waitrequest
	wire         cpu_data_master_debugaccess;                                                // cpu:debug_mem_slave_debugaccess_to_roms -> mm_interconnect_0:cpu_data_master_debugaccess
	wire  [27:0] cpu_data_master_address;                                                    // cpu:d_address -> mm_interconnect_0:cpu_data_master_address
	wire   [3:0] cpu_data_master_byteenable;                                                 // cpu:d_byteenable -> mm_interconnect_0:cpu_data_master_byteenable
	wire         cpu_data_master_read;                                                       // cpu:d_read -> mm_interconnect_0:cpu_data_master_read
	wire         cpu_data_master_write;                                                      // cpu:d_write -> mm_interconnect_0:cpu_data_master_write
	wire  [31:0] cpu_data_master_writedata;                                                  // cpu:d_writedata -> mm_interconnect_0:cpu_data_master_writedata
	wire  [31:0] cpu_instruction_master_readdata;                                            // mm_interconnect_0:cpu_instruction_master_readdata -> cpu:i_readdata
	wire         cpu_instruction_master_waitrequest;                                         // mm_interconnect_0:cpu_instruction_master_waitrequest -> cpu:i_waitrequest
	wire  [27:0] cpu_instruction_master_address;                                             // cpu:i_address -> mm_interconnect_0:cpu_instruction_master_address
	wire         cpu_instruction_master_read;                                                // cpu:i_read -> mm_interconnect_0:cpu_instruction_master_read
	wire         mm_interconnect_0_sdram_s1_chipselect;                                      // mm_interconnect_0:sdram_s1_chipselect -> sdram:az_cs
	wire  [15:0] mm_interconnect_0_sdram_s1_readdata;                                        // sdram:za_data -> mm_interconnect_0:sdram_s1_readdata
	wire         mm_interconnect_0_sdram_s1_waitrequest;                                     // sdram:za_waitrequest -> mm_interconnect_0:sdram_s1_waitrequest
	wire  [24:0] mm_interconnect_0_sdram_s1_address;                                         // mm_interconnect_0:sdram_s1_address -> sdram:az_addr
	wire         mm_interconnect_0_sdram_s1_read;                                            // mm_interconnect_0:sdram_s1_read -> sdram:az_rd_n
	wire   [1:0] mm_interconnect_0_sdram_s1_byteenable;                                      // mm_interconnect_0:sdram_s1_byteenable -> sdram:az_be_n
	wire         mm_interconnect_0_sdram_s1_readdatavalid;                                   // sdram:za_valid -> mm_interconnect_0:sdram_s1_readdatavalid
	wire         mm_interconnect_0_sdram_s1_write;                                           // mm_interconnect_0:sdram_s1_write -> sdram:az_wr_n
	wire  [15:0] mm_interconnect_0_sdram_s1_writedata;                                       // mm_interconnect_0:sdram_s1_writedata -> sdram:az_data
	wire  [31:0] mm_interconnect_0_cpu_debug_mem_slave_readdata;                             // cpu:debug_mem_slave_readdata -> mm_interconnect_0:cpu_debug_mem_slave_readdata
	wire         mm_interconnect_0_cpu_debug_mem_slave_waitrequest;                          // cpu:debug_mem_slave_waitrequest -> mm_interconnect_0:cpu_debug_mem_slave_waitrequest
	wire         mm_interconnect_0_cpu_debug_mem_slave_debugaccess;                          // mm_interconnect_0:cpu_debug_mem_slave_debugaccess -> cpu:debug_mem_slave_debugaccess
	wire   [8:0] mm_interconnect_0_cpu_debug_mem_slave_address;                              // mm_interconnect_0:cpu_debug_mem_slave_address -> cpu:debug_mem_slave_address
	wire         mm_interconnect_0_cpu_debug_mem_slave_read;                                 // mm_interconnect_0:cpu_debug_mem_slave_read -> cpu:debug_mem_slave_read
	wire   [3:0] mm_interconnect_0_cpu_debug_mem_slave_byteenable;                           // mm_interconnect_0:cpu_debug_mem_slave_byteenable -> cpu:debug_mem_slave_byteenable
	wire         mm_interconnect_0_cpu_debug_mem_slave_write;                                // mm_interconnect_0:cpu_debug_mem_slave_write -> cpu:debug_mem_slave_write
	wire  [31:0] mm_interconnect_0_cpu_debug_mem_slave_writedata;                            // mm_interconnect_0:cpu_debug_mem_slave_writedata -> cpu:debug_mem_slave_writedata
	wire  [31:0] mm_interconnect_0_video_dma_controller_avalon_dma_control_slave_readdata;   // video_dma_controller:slave_readdata -> mm_interconnect_0:video_dma_controller_avalon_dma_control_slave_readdata
	wire   [1:0] mm_interconnect_0_video_dma_controller_avalon_dma_control_slave_address;    // mm_interconnect_0:video_dma_controller_avalon_dma_control_slave_address -> video_dma_controller:slave_address
	wire         mm_interconnect_0_video_dma_controller_avalon_dma_control_slave_read;       // mm_interconnect_0:video_dma_controller_avalon_dma_control_slave_read -> video_dma_controller:slave_read
	wire   [3:0] mm_interconnect_0_video_dma_controller_avalon_dma_control_slave_byteenable; // mm_interconnect_0:video_dma_controller_avalon_dma_control_slave_byteenable -> video_dma_controller:slave_byteenable
	wire         mm_interconnect_0_video_dma_controller_avalon_dma_control_slave_write;      // mm_interconnect_0:video_dma_controller_avalon_dma_control_slave_write -> video_dma_controller:slave_write
	wire  [31:0] mm_interconnect_0_video_dma_controller_avalon_dma_control_slave_writedata;  // mm_interconnect_0:video_dma_controller_avalon_dma_control_slave_writedata -> video_dma_controller:slave_writedata
	wire         mm_interconnect_0_jtag_uart_avalon_jtag_slave_chipselect;                   // mm_interconnect_0:jtag_uart_avalon_jtag_slave_chipselect -> jtag_uart:av_chipselect
	wire  [31:0] mm_interconnect_0_jtag_uart_avalon_jtag_slave_readdata;                     // jtag_uart:av_readdata -> mm_interconnect_0:jtag_uart_avalon_jtag_slave_readdata
	wire         mm_interconnect_0_jtag_uart_avalon_jtag_slave_waitrequest;                  // jtag_uart:av_waitrequest -> mm_interconnect_0:jtag_uart_avalon_jtag_slave_waitrequest
	wire   [0:0] mm_interconnect_0_jtag_uart_avalon_jtag_slave_address;                      // mm_interconnect_0:jtag_uart_avalon_jtag_slave_address -> jtag_uart:av_address
	wire         mm_interconnect_0_jtag_uart_avalon_jtag_slave_read;                         // mm_interconnect_0:jtag_uart_avalon_jtag_slave_read -> jtag_uart:av_read_n
	wire         mm_interconnect_0_jtag_uart_avalon_jtag_slave_write;                        // mm_interconnect_0:jtag_uart_avalon_jtag_slave_write -> jtag_uart:av_write_n
	wire  [31:0] mm_interconnect_0_jtag_uart_avalon_jtag_slave_writedata;                    // mm_interconnect_0:jtag_uart_avalon_jtag_slave_writedata -> jtag_uart:av_writedata
	wire  [31:0] mm_interconnect_0_button_s1_readdata;                                       // button:readdata -> mm_interconnect_0:button_s1_readdata
	wire   [1:0] mm_interconnect_0_button_s1_address;                                        // mm_interconnect_0:button_s1_address -> button:address
	wire         mm_interconnect_0_led_s1_chipselect;                                        // mm_interconnect_0:led_s1_chipselect -> led:chipselect
	wire  [31:0] mm_interconnect_0_led_s1_readdata;                                          // led:readdata -> mm_interconnect_0:led_s1_readdata
	wire   [1:0] mm_interconnect_0_led_s1_address;                                           // mm_interconnect_0:led_s1_address -> led:address
	wire         mm_interconnect_0_led_s1_write;                                             // mm_interconnect_0:led_s1_write -> led:write_n
	wire  [31:0] mm_interconnect_0_led_s1_writedata;                                         // mm_interconnect_0:led_s1_writedata -> led:writedata
	wire         irq_mapper_receiver0_irq;                                                   // jtag_uart:av_irq -> irq_mapper:receiver0_irq
	wire  [31:0] cpu_irq_irq;                                                                // irq_mapper:sender_irq -> cpu:irq
	wire         rst_controller_reset_out_reset_req;                                         // rst_controller:reset_req -> [cpu:reset_req, rst_translator:reset_req_in]
	wire         clk_reset_source_reset;                                                     // clk:reset_source_reset -> rst_controller:reset_in0

	EDL_Final_button button (
		.clk      (sysclk_clk),                           //                 clk.clk
		.reset_n  (~reset_bridge_reset),                  //               reset.reset_n
		.address  (mm_interconnect_0_button_s1_address),  //                  s1.address
		.readdata (mm_interconnect_0_button_s1_readdata), //                    .readdata
		.in_port  (button_external_connection_export)     // external_connection.export
	);

	EDL_Final_clk clk (
		.ref_clk_clk        (clk_clk),                //      ref_clk.clk
		.ref_reset_reset    (reset_reset),            //    ref_reset.reset
		.sys_clk_clk        (sysclk_clk),             //      sys_clk.clk
		.sdram_clk_clk      (sdram_clk_clk),          //    sdram_clk.clk
		.reset_source_reset (clk_reset_source_reset)  // reset_source.reset
	);

	EDL_Final_cpu cpu (
		.clk                                 (sysclk_clk),                                        //                       clk.clk
		.reset_n                             (~reset_bridge_reset),                               //                     reset.reset_n
		.reset_req                           (rst_controller_reset_out_reset_req),                //                          .reset_req
		.d_address                           (cpu_data_master_address),                           //               data_master.address
		.d_byteenable                        (cpu_data_master_byteenable),                        //                          .byteenable
		.d_read                              (cpu_data_master_read),                              //                          .read
		.d_readdata                          (cpu_data_master_readdata),                          //                          .readdata
		.d_waitrequest                       (cpu_data_master_waitrequest),                       //                          .waitrequest
		.d_write                             (cpu_data_master_write),                             //                          .write
		.d_writedata                         (cpu_data_master_writedata),                         //                          .writedata
		.debug_mem_slave_debugaccess_to_roms (cpu_data_master_debugaccess),                       //                          .debugaccess
		.i_address                           (cpu_instruction_master_address),                    //        instruction_master.address
		.i_read                              (cpu_instruction_master_read),                       //                          .read
		.i_readdata                          (cpu_instruction_master_readdata),                   //                          .readdata
		.i_waitrequest                       (cpu_instruction_master_waitrequest),                //                          .waitrequest
		.irq                                 (cpu_irq_irq),                                       //                       irq.irq
		.debug_reset_request                 (),                                                  //       debug_reset_request.reset
		.debug_mem_slave_address             (mm_interconnect_0_cpu_debug_mem_slave_address),     //           debug_mem_slave.address
		.debug_mem_slave_byteenable          (mm_interconnect_0_cpu_debug_mem_slave_byteenable),  //                          .byteenable
		.debug_mem_slave_debugaccess         (mm_interconnect_0_cpu_debug_mem_slave_debugaccess), //                          .debugaccess
		.debug_mem_slave_read                (mm_interconnect_0_cpu_debug_mem_slave_read),        //                          .read
		.debug_mem_slave_readdata            (mm_interconnect_0_cpu_debug_mem_slave_readdata),    //                          .readdata
		.debug_mem_slave_waitrequest         (mm_interconnect_0_cpu_debug_mem_slave_waitrequest), //                          .waitrequest
		.debug_mem_slave_write               (mm_interconnect_0_cpu_debug_mem_slave_write),       //                          .write
		.debug_mem_slave_writedata           (mm_interconnect_0_cpu_debug_mem_slave_writedata),   //                          .writedata
		.dummy_ci_port                       ()                                                   // custom_instruction_master.readra
	);

	EDL_Final_jtag_uart jtag_uart (
		.clk            (sysclk_clk),                                                //               clk.clk
		.rst_n          (~reset_bridge_reset),                                       //             reset.reset_n
		.av_chipselect  (mm_interconnect_0_jtag_uart_avalon_jtag_slave_chipselect),  // avalon_jtag_slave.chipselect
		.av_address     (mm_interconnect_0_jtag_uart_avalon_jtag_slave_address),     //                  .address
		.av_read_n      (~mm_interconnect_0_jtag_uart_avalon_jtag_slave_read),       //                  .read_n
		.av_readdata    (mm_interconnect_0_jtag_uart_avalon_jtag_slave_readdata),    //                  .readdata
		.av_write_n     (~mm_interconnect_0_jtag_uart_avalon_jtag_slave_write),      //                  .write_n
		.av_writedata   (mm_interconnect_0_jtag_uart_avalon_jtag_slave_writedata),   //                  .writedata
		.av_waitrequest (mm_interconnect_0_jtag_uart_avalon_jtag_slave_waitrequest), //                  .waitrequest
		.av_irq         (irq_mapper_receiver0_irq)                                   //               irq.irq
	);

	EDL_Final_led led (
		.clk        (sysclk_clk),                          //                 clk.clk
		.reset_n    (~reset_bridge_reset),                 //               reset.reset_n
		.address    (mm_interconnect_0_led_s1_address),    //                  s1.address
		.write_n    (~mm_interconnect_0_led_s1_write),     //                    .write_n
		.writedata  (mm_interconnect_0_led_s1_writedata),  //                    .writedata
		.chipselect (mm_interconnect_0_led_s1_chipselect), //                    .chipselect
		.readdata   (mm_interconnect_0_led_s1_readdata),   //                    .readdata
		.out_port   (led_external_connection_export)       // external_connection.export
	);

	EDL_Final_sdram sdram (
		.clk            (sysclk_clk),                               //   clk.clk
		.reset_n        (~reset_bridge_reset),                      // reset.reset_n
		.az_addr        (mm_interconnect_0_sdram_s1_address),       //    s1.address
		.az_be_n        (~mm_interconnect_0_sdram_s1_byteenable),   //      .byteenable_n
		.az_cs          (mm_interconnect_0_sdram_s1_chipselect),    //      .chipselect
		.az_data        (mm_interconnect_0_sdram_s1_writedata),     //      .writedata
		.az_rd_n        (~mm_interconnect_0_sdram_s1_read),         //      .read_n
		.az_wr_n        (~mm_interconnect_0_sdram_s1_write),        //      .write_n
		.za_data        (mm_interconnect_0_sdram_s1_readdata),      //      .readdata
		.za_valid       (mm_interconnect_0_sdram_s1_readdatavalid), //      .readdatavalid
		.za_waitrequest (mm_interconnect_0_sdram_s1_waitrequest),   //      .waitrequest
		.zs_addr        (sdram_wire_addr),                          //  wire.export
		.zs_ba          (sdram_wire_ba),                            //      .export
		.zs_cas_n       (sdram_wire_cas_n),                         //      .export
		.zs_cke         (sdram_wire_cke),                           //      .export
		.zs_cs_n        (sdram_wire_cs_n),                          //      .export
		.zs_dq          (sdram_wire_dq),                            //      .export
		.zs_dqm         (sdram_wire_dqm),                           //      .export
		.zs_ras_n       (sdram_wire_ras_n),                         //      .export
		.zs_we_n        (sdram_wire_we_n)                           //      .export
	);

	EDL_Final_video_dma_controller video_dma_controller (
		.clk                  (sysclk_clk),                                                                 //                      clk.clk
		.reset                (reset_bridge_reset),                                                         //                    reset.reset
		.stream_data          (video_dma_sink_data),                                                        //          avalon_dma_sink.data
		.stream_startofpacket (video_dma_sink_startofpacket),                                               //                         .startofpacket
		.stream_endofpacket   (video_dma_sink_endofpacket),                                                 //                         .endofpacket
		.stream_valid         (video_dma_sink_valid),                                                       //                         .valid
		.stream_ready         (video_dma_sink_ready),                                                       //                         .ready
		.slave_address        (mm_interconnect_0_video_dma_controller_avalon_dma_control_slave_address),    // avalon_dma_control_slave.address
		.slave_byteenable     (mm_interconnect_0_video_dma_controller_avalon_dma_control_slave_byteenable), //                         .byteenable
		.slave_read           (mm_interconnect_0_video_dma_controller_avalon_dma_control_slave_read),       //                         .read
		.slave_write          (mm_interconnect_0_video_dma_controller_avalon_dma_control_slave_write),      //                         .write
		.slave_writedata      (mm_interconnect_0_video_dma_controller_avalon_dma_control_slave_writedata),  //                         .writedata
		.slave_readdata       (mm_interconnect_0_video_dma_controller_avalon_dma_control_slave_readdata),   //                         .readdata
		.master_address       (video_dma_controller_avalon_dma_master_address),                             //        avalon_dma_master.address
		.master_waitrequest   (video_dma_controller_avalon_dma_master_waitrequest),                         //                         .waitrequest
		.master_write         (video_dma_controller_avalon_dma_master_write),                               //                         .write
		.master_writedata     (video_dma_controller_avalon_dma_master_writedata)                            //                         .writedata
	);

	EDL_Final_mm_interconnect_0 mm_interconnect_0 (
		.clk_sys_clk_clk                                          (sysclk_clk),                                                                 //                                      clk_sys_clk.clk
		.video_dma_controller_reset_reset_bridge_in_reset_reset   (reset_bridge_reset),                                                         // video_dma_controller_reset_reset_bridge_in_reset.reset
		.cpu_data_master_address                                  (cpu_data_master_address),                                                    //                                  cpu_data_master.address
		.cpu_data_master_waitrequest                              (cpu_data_master_waitrequest),                                                //                                                 .waitrequest
		.cpu_data_master_byteenable                               (cpu_data_master_byteenable),                                                 //                                                 .byteenable
		.cpu_data_master_read                                     (cpu_data_master_read),                                                       //                                                 .read
		.cpu_data_master_readdata                                 (cpu_data_master_readdata),                                                   //                                                 .readdata
		.cpu_data_master_write                                    (cpu_data_master_write),                                                      //                                                 .write
		.cpu_data_master_writedata                                (cpu_data_master_writedata),                                                  //                                                 .writedata
		.cpu_data_master_debugaccess                              (cpu_data_master_debugaccess),                                                //                                                 .debugaccess
		.cpu_instruction_master_address                           (cpu_instruction_master_address),                                             //                           cpu_instruction_master.address
		.cpu_instruction_master_waitrequest                       (cpu_instruction_master_waitrequest),                                         //                                                 .waitrequest
		.cpu_instruction_master_read                              (cpu_instruction_master_read),                                                //                                                 .read
		.cpu_instruction_master_readdata                          (cpu_instruction_master_readdata),                                            //                                                 .readdata
		.video_dma_controller_avalon_dma_master_address           (video_dma_controller_avalon_dma_master_address),                             //           video_dma_controller_avalon_dma_master.address
		.video_dma_controller_avalon_dma_master_waitrequest       (video_dma_controller_avalon_dma_master_waitrequest),                         //                                                 .waitrequest
		.video_dma_controller_avalon_dma_master_write             (video_dma_controller_avalon_dma_master_write),                               //                                                 .write
		.video_dma_controller_avalon_dma_master_writedata         (video_dma_controller_avalon_dma_master_writedata),                           //                                                 .writedata
		.button_s1_address                                        (mm_interconnect_0_button_s1_address),                                        //                                        button_s1.address
		.button_s1_readdata                                       (mm_interconnect_0_button_s1_readdata),                                       //                                                 .readdata
		.cpu_debug_mem_slave_address                              (mm_interconnect_0_cpu_debug_mem_slave_address),                              //                              cpu_debug_mem_slave.address
		.cpu_debug_mem_slave_write                                (mm_interconnect_0_cpu_debug_mem_slave_write),                                //                                                 .write
		.cpu_debug_mem_slave_read                                 (mm_interconnect_0_cpu_debug_mem_slave_read),                                 //                                                 .read
		.cpu_debug_mem_slave_readdata                             (mm_interconnect_0_cpu_debug_mem_slave_readdata),                             //                                                 .readdata
		.cpu_debug_mem_slave_writedata                            (mm_interconnect_0_cpu_debug_mem_slave_writedata),                            //                                                 .writedata
		.cpu_debug_mem_slave_byteenable                           (mm_interconnect_0_cpu_debug_mem_slave_byteenable),                           //                                                 .byteenable
		.cpu_debug_mem_slave_waitrequest                          (mm_interconnect_0_cpu_debug_mem_slave_waitrequest),                          //                                                 .waitrequest
		.cpu_debug_mem_slave_debugaccess                          (mm_interconnect_0_cpu_debug_mem_slave_debugaccess),                          //                                                 .debugaccess
		.jtag_uart_avalon_jtag_slave_address                      (mm_interconnect_0_jtag_uart_avalon_jtag_slave_address),                      //                      jtag_uart_avalon_jtag_slave.address
		.jtag_uart_avalon_jtag_slave_write                        (mm_interconnect_0_jtag_uart_avalon_jtag_slave_write),                        //                                                 .write
		.jtag_uart_avalon_jtag_slave_read                         (mm_interconnect_0_jtag_uart_avalon_jtag_slave_read),                         //                                                 .read
		.jtag_uart_avalon_jtag_slave_readdata                     (mm_interconnect_0_jtag_uart_avalon_jtag_slave_readdata),                     //                                                 .readdata
		.jtag_uart_avalon_jtag_slave_writedata                    (mm_interconnect_0_jtag_uart_avalon_jtag_slave_writedata),                    //                                                 .writedata
		.jtag_uart_avalon_jtag_slave_waitrequest                  (mm_interconnect_0_jtag_uart_avalon_jtag_slave_waitrequest),                  //                                                 .waitrequest
		.jtag_uart_avalon_jtag_slave_chipselect                   (mm_interconnect_0_jtag_uart_avalon_jtag_slave_chipselect),                   //                                                 .chipselect
		.led_s1_address                                           (mm_interconnect_0_led_s1_address),                                           //                                           led_s1.address
		.led_s1_write                                             (mm_interconnect_0_led_s1_write),                                             //                                                 .write
		.led_s1_readdata                                          (mm_interconnect_0_led_s1_readdata),                                          //                                                 .readdata
		.led_s1_writedata                                         (mm_interconnect_0_led_s1_writedata),                                         //                                                 .writedata
		.led_s1_chipselect                                        (mm_interconnect_0_led_s1_chipselect),                                        //                                                 .chipselect
		.sdram_s1_address                                         (mm_interconnect_0_sdram_s1_address),                                         //                                         sdram_s1.address
		.sdram_s1_write                                           (mm_interconnect_0_sdram_s1_write),                                           //                                                 .write
		.sdram_s1_read                                            (mm_interconnect_0_sdram_s1_read),                                            //                                                 .read
		.sdram_s1_readdata                                        (mm_interconnect_0_sdram_s1_readdata),                                        //                                                 .readdata
		.sdram_s1_writedata                                       (mm_interconnect_0_sdram_s1_writedata),                                       //                                                 .writedata
		.sdram_s1_byteenable                                      (mm_interconnect_0_sdram_s1_byteenable),                                      //                                                 .byteenable
		.sdram_s1_readdatavalid                                   (mm_interconnect_0_sdram_s1_readdatavalid),                                   //                                                 .readdatavalid
		.sdram_s1_waitrequest                                     (mm_interconnect_0_sdram_s1_waitrequest),                                     //                                                 .waitrequest
		.sdram_s1_chipselect                                      (mm_interconnect_0_sdram_s1_chipselect),                                      //                                                 .chipselect
		.video_dma_controller_avalon_dma_control_slave_address    (mm_interconnect_0_video_dma_controller_avalon_dma_control_slave_address),    //    video_dma_controller_avalon_dma_control_slave.address
		.video_dma_controller_avalon_dma_control_slave_write      (mm_interconnect_0_video_dma_controller_avalon_dma_control_slave_write),      //                                                 .write
		.video_dma_controller_avalon_dma_control_slave_read       (mm_interconnect_0_video_dma_controller_avalon_dma_control_slave_read),       //                                                 .read
		.video_dma_controller_avalon_dma_control_slave_readdata   (mm_interconnect_0_video_dma_controller_avalon_dma_control_slave_readdata),   //                                                 .readdata
		.video_dma_controller_avalon_dma_control_slave_writedata  (mm_interconnect_0_video_dma_controller_avalon_dma_control_slave_writedata),  //                                                 .writedata
		.video_dma_controller_avalon_dma_control_slave_byteenable (mm_interconnect_0_video_dma_controller_avalon_dma_control_slave_byteenable)  //                                                 .byteenable
	);

	EDL_Final_irq_mapper irq_mapper (
		.clk           (sysclk_clk),               //       clk.clk
		.reset         (reset_bridge_reset),       // clk_reset.reset
		.receiver0_irq (irq_mapper_receiver0_irq), // receiver0.irq
		.sender_irq    (cpu_irq_irq)               //    sender.irq
	);

	altera_reset_controller #(
		.NUM_RESET_INPUTS          (1),
		.OUTPUT_RESET_SYNC_EDGES   ("deassert"),
		.SYNC_DEPTH                (2),
		.RESET_REQUEST_PRESENT     (1),
		.RESET_REQ_WAIT_TIME       (1),
		.MIN_RST_ASSERTION_TIME    (3),
		.RESET_REQ_EARLY_DSRT_TIME (1),
		.USE_RESET_REQUEST_IN0     (0),
		.USE_RESET_REQUEST_IN1     (0),
		.USE_RESET_REQUEST_IN2     (0),
		.USE_RESET_REQUEST_IN3     (0),
		.USE_RESET_REQUEST_IN4     (0),
		.USE_RESET_REQUEST_IN5     (0),
		.USE_RESET_REQUEST_IN6     (0),
		.USE_RESET_REQUEST_IN7     (0),
		.USE_RESET_REQUEST_IN8     (0),
		.USE_RESET_REQUEST_IN9     (0),
		.USE_RESET_REQUEST_IN10    (0),
		.USE_RESET_REQUEST_IN11    (0),
		.USE_RESET_REQUEST_IN12    (0),
		.USE_RESET_REQUEST_IN13    (0),
		.USE_RESET_REQUEST_IN14    (0),
		.USE_RESET_REQUEST_IN15    (0),
		.ADAPT_RESET_REQUEST       (0)
	) rst_controller (
		.reset_in0      (clk_reset_source_reset),             // reset_in0.reset
		.clk            (sysclk_clk),                         //       clk.clk
		.reset_out      (reset_bridge_reset),                 // reset_out.reset
		.reset_req      (rst_controller_reset_out_reset_req), //          .reset_req
		.reset_req_in0  (1'b0),                               // (terminated)
		.reset_in1      (1'b0),                               // (terminated)
		.reset_req_in1  (1'b0),                               // (terminated)
		.reset_in2      (1'b0),                               // (terminated)
		.reset_req_in2  (1'b0),                               // (terminated)
		.reset_in3      (1'b0),                               // (terminated)
		.reset_req_in3  (1'b0),                               // (terminated)
		.reset_in4      (1'b0),                               // (terminated)
		.reset_req_in4  (1'b0),                               // (terminated)
		.reset_in5      (1'b0),                               // (terminated)
		.reset_req_in5  (1'b0),                               // (terminated)
		.reset_in6      (1'b0),                               // (terminated)
		.reset_req_in6  (1'b0),                               // (terminated)
		.reset_in7      (1'b0),                               // (terminated)
		.reset_req_in7  (1'b0),                               // (terminated)
		.reset_in8      (1'b0),                               // (terminated)
		.reset_req_in8  (1'b0),                               // (terminated)
		.reset_in9      (1'b0),                               // (terminated)
		.reset_req_in9  (1'b0),                               // (terminated)
		.reset_in10     (1'b0),                               // (terminated)
		.reset_req_in10 (1'b0),                               // (terminated)
		.reset_in11     (1'b0),                               // (terminated)
		.reset_req_in11 (1'b0),                               // (terminated)
		.reset_in12     (1'b0),                               // (terminated)
		.reset_req_in12 (1'b0),                               // (terminated)
		.reset_in13     (1'b0),                               // (terminated)
		.reset_req_in13 (1'b0),                               // (terminated)
		.reset_in14     (1'b0),                               // (terminated)
		.reset_req_in14 (1'b0),                               // (terminated)
		.reset_in15     (1'b0),                               // (terminated)
		.reset_req_in15 (1'b0)                                // (terminated)
	);

endmodule
