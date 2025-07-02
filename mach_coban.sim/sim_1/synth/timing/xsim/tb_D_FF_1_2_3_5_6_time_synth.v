// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
// Date        : Wed Jul  2 12:17:06 2025
// Host        : DESKTOP-CKHAQIJ running 64-bit major release  (build 9200)
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file
//               D:/Vivado/Source/mach_coban/mach_coban.sim/sim_1/synth/timing/xsim/tb_D_FF_1_2_3_5_6_time_synth.v
// Design      : cnt_down_7
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7z020iclg484-1L
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

module JK_FF
   (cnt_OBUF,
    Y_OBUF,
    Q_tmp_reg_0,
    CLK_IBUF_BUFG,
    Y);
  output [0:0]cnt_OBUF;
  output Y_OBUF;
  output Q_tmp_reg_0;
  input CLK_IBUF_BUFG;
  input [1:0]Y;

  wire CLK_IBUF_BUFG;
  wire J;
  wire Q_tmp_reg_0;
  wire [1:0]Y;
  wire Y_OBUF;
  wire [0:0]cnt_OBUF;

  LUT1 #(
    .INIT(2'h1)) 
    Q_tmp_i_1__0
       (.I0(cnt_OBUF),
        .O(J));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h9)) 
    Q_tmp_i_1__1
       (.I0(cnt_OBUF),
        .I1(Y[0]),
        .O(Q_tmp_reg_0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    Q_tmp_reg
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(J),
        .Q(cnt_OBUF),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'h01)) 
    Y_OBUF_inst_i_1
       (.I0(cnt_OBUF),
        .I1(Y[0]),
        .I2(Y[1]),
        .O(Y_OBUF));
endmodule

(* ORIG_REF_NAME = "JK_FF" *) 
module JK_FF_0
   (Q_tmp_reg_0,
    Q_tmp_reg_1,
    CLK_IBUF_BUFG);
  output [0:0]Q_tmp_reg_0;
  input Q_tmp_reg_1;
  input CLK_IBUF_BUFG;

  wire CLK_IBUF_BUFG;
  wire [0:0]Q_tmp_reg_0;
  wire Q_tmp_reg_1;

  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    Q_tmp_reg
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(Q_tmp_reg_1),
        .Q(Q_tmp_reg_0),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "JK_FF" *) 
module JK_FF_1
   (Q_tmp_reg_0,
    CLK_IBUF_BUFG,
    cnt_OBUF);
  output [0:0]Q_tmp_reg_0;
  input CLK_IBUF_BUFG;
  input [1:0]cnt_OBUF;

  wire CLK_IBUF_BUFG;
  wire Q_tmp_i_1_n_0;
  wire [0:0]Q_tmp_reg_0;
  wire [1:0]cnt_OBUF;

  LUT3 #(
    .INIT(8'hA9)) 
    Q_tmp_i_1
       (.I0(Q_tmp_reg_0),
        .I1(cnt_OBUF[0]),
        .I2(cnt_OBUF[1]),
        .O(Q_tmp_i_1_n_0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    Q_tmp_reg
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(Q_tmp_i_1_n_0),
        .Q(Q_tmp_reg_0),
        .R(1'b0));
endmodule

(* NotValidForBitStream *)
module cnt_down_7
   (CLK,
    cnt,
    Y);
  input CLK;
  output [2:0]cnt;
  output Y;

  wire CLK;
  wire CLK_IBUF;
  wire CLK_IBUF_BUFG;
  wire FF0_n_2;
  wire Y;
  wire Y_OBUF;
  wire [2:0]cnt;
  wire [2:0]cnt_OBUF;

initial begin
 $sdf_annotate("tb_D_FF_1_2_3_5_6_time_synth.sdf",,,,"tool_control");
end
  BUFG CLK_IBUF_BUFG_inst
       (.I(CLK_IBUF),
        .O(CLK_IBUF_BUFG));
  IBUF CLK_IBUF_inst
       (.I(CLK),
        .O(CLK_IBUF));
  JK_FF FF0
       (.CLK_IBUF_BUFG(CLK_IBUF_BUFG),
        .Q_tmp_reg_0(FF0_n_2),
        .Y(cnt_OBUF[2:1]),
        .Y_OBUF(Y_OBUF),
        .cnt_OBUF(cnt_OBUF[0]));
  JK_FF_0 FF1
       (.CLK_IBUF_BUFG(CLK_IBUF_BUFG),
        .Q_tmp_reg_0(cnt_OBUF[1]),
        .Q_tmp_reg_1(FF0_n_2));
  JK_FF_1 FF2
       (.CLK_IBUF_BUFG(CLK_IBUF_BUFG),
        .Q_tmp_reg_0(cnt_OBUF[2]),
        .cnt_OBUF(cnt_OBUF[1:0]));
  OBUF Y_OBUF_inst
       (.I(Y_OBUF),
        .O(Y));
  OBUF \cnt_OBUF[0]_inst 
       (.I(cnt_OBUF[0]),
        .O(cnt[0]));
  OBUF \cnt_OBUF[1]_inst 
       (.I(cnt_OBUF[1]),
        .O(cnt[1]));
  OBUF \cnt_OBUF[2]_inst 
       (.I(cnt_OBUF[2]),
        .O(cnt[2]));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
