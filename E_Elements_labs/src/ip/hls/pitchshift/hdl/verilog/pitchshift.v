// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2018.2
// Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="pitchshift,hls_ip_2018_2,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7z020clg400-1,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=dataflow,HLS_SYN_CLOCK=8.651000,HLS_SYN_LAT=-1,HLS_SYN_TPT=-1,HLS_SYN_MEM=52,HLS_SYN_DSP=117,HLS_SYN_FF=13430,HLS_SYN_LUT=18439,HLS_VERSION=2018_2}" *)

module pitchshift (
        s_axi_ctrl_AWVALID,
        s_axi_ctrl_AWREADY,
        s_axi_ctrl_AWADDR,
        s_axi_ctrl_WVALID,
        s_axi_ctrl_WREADY,
        s_axi_ctrl_WDATA,
        s_axi_ctrl_WSTRB,
        s_axi_ctrl_ARVALID,
        s_axi_ctrl_ARREADY,
        s_axi_ctrl_ARADDR,
        s_axi_ctrl_RVALID,
        s_axi_ctrl_RREADY,
        s_axi_ctrl_RDATA,
        s_axi_ctrl_RRESP,
        s_axi_ctrl_BVALID,
        s_axi_ctrl_BREADY,
        s_axi_ctrl_BRESP,
        ap_clk,
        ap_rst_n,
        interrupt,
        InA_TDATA,
        InA_TKEEP,
        InA_TSTRB,
        InA_TUSER,
        InA_TLAST,
        InA_TID,
        InA_TDEST,
        InB_TDATA,
        InB_TKEEP,
        InB_TSTRB,
        InB_TUSER,
        InB_TLAST,
        InB_TID,
        InB_TDEST,
        OutA_TDATA,
        OutA_TKEEP,
        OutA_TSTRB,
        OutA_TUSER,
        OutA_TLAST,
        OutA_TID,
        OutA_TDEST,
        OutB_TDATA,
        OutB_TKEEP,
        OutB_TSTRB,
        OutB_TUSER,
        OutB_TLAST,
        OutB_TID,
        OutB_TDEST,
        InA_TVALID,
        InA_TREADY,
        InB_TVALID,
        InB_TREADY,
        OutA_TVALID,
        OutA_TREADY,
        OutB_TVALID,
        OutB_TREADY
);

parameter    C_S_AXI_CTRL_DATA_WIDTH = 32;
parameter    C_S_AXI_CTRL_ADDR_WIDTH = 5;
parameter    C_S_AXI_DATA_WIDTH = 32;
parameter    C_S_AXI_ADDR_WIDTH = 32;

parameter C_S_AXI_CTRL_WSTRB_WIDTH = (32 / 8);
parameter C_S_AXI_WSTRB_WIDTH = (32 / 8);

input   s_axi_ctrl_AWVALID;
output   s_axi_ctrl_AWREADY;
input  [C_S_AXI_CTRL_ADDR_WIDTH - 1:0] s_axi_ctrl_AWADDR;
input   s_axi_ctrl_WVALID;
output   s_axi_ctrl_WREADY;
input  [C_S_AXI_CTRL_DATA_WIDTH - 1:0] s_axi_ctrl_WDATA;
input  [C_S_AXI_CTRL_WSTRB_WIDTH - 1:0] s_axi_ctrl_WSTRB;
input   s_axi_ctrl_ARVALID;
output   s_axi_ctrl_ARREADY;
input  [C_S_AXI_CTRL_ADDR_WIDTH - 1:0] s_axi_ctrl_ARADDR;
output   s_axi_ctrl_RVALID;
input   s_axi_ctrl_RREADY;
output  [C_S_AXI_CTRL_DATA_WIDTH - 1:0] s_axi_ctrl_RDATA;
output  [1:0] s_axi_ctrl_RRESP;
output   s_axi_ctrl_BVALID;
input   s_axi_ctrl_BREADY;
output  [1:0] s_axi_ctrl_BRESP;
input   ap_clk;
input   ap_rst_n;
output   interrupt;
input  [31:0] InA_TDATA;
input  [3:0] InA_TKEEP;
input  [3:0] InA_TSTRB;
input  [0:0] InA_TUSER;
input  [0:0] InA_TLAST;
input  [0:0] InA_TID;
input  [0:0] InA_TDEST;
input  [31:0] InB_TDATA;
input  [3:0] InB_TKEEP;
input  [3:0] InB_TSTRB;
input  [0:0] InB_TUSER;
input  [0:0] InB_TLAST;
input  [0:0] InB_TID;
input  [0:0] InB_TDEST;
output  [31:0] OutA_TDATA;
output  [3:0] OutA_TKEEP;
output  [3:0] OutA_TSTRB;
output  [0:0] OutA_TUSER;
output  [0:0] OutA_TLAST;
output  [0:0] OutA_TID;
output  [0:0] OutA_TDEST;
output  [31:0] OutB_TDATA;
output  [3:0] OutB_TKEEP;
output  [3:0] OutB_TSTRB;
output  [0:0] OutB_TUSER;
output  [0:0] OutB_TLAST;
output  [0:0] OutB_TID;
output  [0:0] OutB_TDEST;
input   InA_TVALID;
output   InA_TREADY;
input   InB_TVALID;
output   InB_TREADY;
output   OutA_TVALID;
input   OutA_TREADY;
output   OutB_TVALID;
input   OutB_TREADY;

 reg    ap_rst_n_inv;
wire    ap_start;
wire    ap_ready;
wire    ap_done;
wire    ap_idle;
wire   [31:0] Len;
wire    Loop_1_proc117_U0_ap_start;
wire    Loop_1_proc117_U0_ap_done;
wire    Loop_1_proc117_U0_ap_continue;
wire    Loop_1_proc117_U0_ap_idle;
wire    Loop_1_proc117_U0_ap_ready;
wire    Loop_1_proc117_U0_start_out;
wire    Loop_1_proc117_U0_start_write;
wire    Loop_1_proc117_U0_InA_TREADY;
wire    Loop_1_proc117_U0_InB_TREADY;
wire   [31:0] Loop_1_proc117_U0_Buff_A_din;
wire    Loop_1_proc117_U0_Buff_A_write;
wire   [31:0] Loop_1_proc117_U0_Buff_B_din;
wire    Loop_1_proc117_U0_Buff_B_write;
wire   [31:0] Loop_1_proc117_U0_Len_out_din;
wire    Loop_1_proc117_U0_Len_out_write;
wire    Loop_2_proc118_U0_ap_start;
wire    Loop_2_proc118_U0_ap_done;
wire    Loop_2_proc118_U0_ap_continue;
wire    Loop_2_proc118_U0_ap_idle;
wire    Loop_2_proc118_U0_ap_ready;
wire    Loop_2_proc118_U0_Len_read;
wire    Loop_2_proc118_U0_Buff_A_read;
wire    Loop_2_proc118_U0_Buff_B_read;
wire   [31:0] Loop_2_proc118_U0_OutA_TDATA;
wire    Loop_2_proc118_U0_OutA_TVALID;
wire   [3:0] Loop_2_proc118_U0_OutA_TKEEP;
wire   [3:0] Loop_2_proc118_U0_OutA_TSTRB;
wire   [0:0] Loop_2_proc118_U0_OutA_TUSER;
wire   [0:0] Loop_2_proc118_U0_OutA_TLAST;
wire   [0:0] Loop_2_proc118_U0_OutA_TID;
wire   [0:0] Loop_2_proc118_U0_OutA_TDEST;
wire   [31:0] Loop_2_proc118_U0_OutB_TDATA;
wire    Loop_2_proc118_U0_OutB_TVALID;
wire   [3:0] Loop_2_proc118_U0_OutB_TKEEP;
wire   [3:0] Loop_2_proc118_U0_OutB_TSTRB;
wire   [0:0] Loop_2_proc118_U0_OutB_TUSER;
wire   [0:0] Loop_2_proc118_U0_OutB_TLAST;
wire   [0:0] Loop_2_proc118_U0_OutB_TID;
wire   [0:0] Loop_2_proc118_U0_OutB_TDEST;
wire    ap_sync_continue;
wire    Buff_A_channel_full_n;
wire   [31:0] Buff_A_channel_dout;
wire    Buff_A_channel_empty_n;
wire    Buff_B_channel_full_n;
wire   [31:0] Buff_B_channel_dout;
wire    Buff_B_channel_empty_n;
wire    Len_c_full_n;
wire   [31:0] Len_c_dout;
wire    Len_c_empty_n;
wire    ap_sync_done;
wire    ap_sync_ready;
wire   [0:0] start_for_Loop_2_proc118_U0_din;
wire    start_for_Loop_2_proc118_U0_full_n;
wire   [0:0] start_for_Loop_2_proc118_U0_dout;
wire    start_for_Loop_2_proc118_U0_empty_n;
wire    Loop_2_proc118_U0_start_full_n;
wire    Loop_2_proc118_U0_start_write;

pitchshift_ctrl_s_axi #(
    .C_S_AXI_ADDR_WIDTH( C_S_AXI_CTRL_ADDR_WIDTH ),
    .C_S_AXI_DATA_WIDTH( C_S_AXI_CTRL_DATA_WIDTH ))
pitchshift_ctrl_s_axi_U(
    .AWVALID(s_axi_ctrl_AWVALID),
    .AWREADY(s_axi_ctrl_AWREADY),
    .AWADDR(s_axi_ctrl_AWADDR),
    .WVALID(s_axi_ctrl_WVALID),
    .WREADY(s_axi_ctrl_WREADY),
    .WDATA(s_axi_ctrl_WDATA),
    .WSTRB(s_axi_ctrl_WSTRB),
    .ARVALID(s_axi_ctrl_ARVALID),
    .ARREADY(s_axi_ctrl_ARREADY),
    .ARADDR(s_axi_ctrl_ARADDR),
    .RVALID(s_axi_ctrl_RVALID),
    .RREADY(s_axi_ctrl_RREADY),
    .RDATA(s_axi_ctrl_RDATA),
    .RRESP(s_axi_ctrl_RRESP),
    .BVALID(s_axi_ctrl_BVALID),
    .BREADY(s_axi_ctrl_BREADY),
    .BRESP(s_axi_ctrl_BRESP),
    .ACLK(ap_clk),
    .ARESET(ap_rst_n_inv),
    .ACLK_EN(1'b1),
    .ap_start(ap_start),
    .interrupt(interrupt),
    .ap_ready(ap_ready),
    .ap_done(ap_done),
    .ap_idle(ap_idle),
    .Len(Len)
);

Loop_1_proc117 Loop_1_proc117_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(Loop_1_proc117_U0_ap_start),
    .start_full_n(start_for_Loop_2_proc118_U0_full_n),
    .ap_done(Loop_1_proc117_U0_ap_done),
    .ap_continue(Loop_1_proc117_U0_ap_continue),
    .ap_idle(Loop_1_proc117_U0_ap_idle),
    .ap_ready(Loop_1_proc117_U0_ap_ready),
    .start_out(Loop_1_proc117_U0_start_out),
    .start_write(Loop_1_proc117_U0_start_write),
    .Len(Len),
    .InA_TDATA(InA_TDATA),
    .InA_TVALID(InA_TVALID),
    .InA_TREADY(Loop_1_proc117_U0_InA_TREADY),
    .InA_TKEEP(InA_TKEEP),
    .InA_TSTRB(InA_TSTRB),
    .InA_TUSER(InA_TUSER),
    .InA_TLAST(InA_TLAST),
    .InA_TID(InA_TID),
    .InA_TDEST(InA_TDEST),
    .InB_TDATA(InB_TDATA),
    .InB_TVALID(InB_TVALID),
    .InB_TREADY(Loop_1_proc117_U0_InB_TREADY),
    .InB_TKEEP(InB_TKEEP),
    .InB_TSTRB(InB_TSTRB),
    .InB_TUSER(InB_TUSER),
    .InB_TLAST(InB_TLAST),
    .InB_TID(InB_TID),
    .InB_TDEST(InB_TDEST),
    .Buff_A_din(Loop_1_proc117_U0_Buff_A_din),
    .Buff_A_full_n(Buff_A_channel_full_n),
    .Buff_A_write(Loop_1_proc117_U0_Buff_A_write),
    .Buff_B_din(Loop_1_proc117_U0_Buff_B_din),
    .Buff_B_full_n(Buff_B_channel_full_n),
    .Buff_B_write(Loop_1_proc117_U0_Buff_B_write),
    .Len_out_din(Loop_1_proc117_U0_Len_out_din),
    .Len_out_full_n(Len_c_full_n),
    .Len_out_write(Loop_1_proc117_U0_Len_out_write)
);

Loop_2_proc118 Loop_2_proc118_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(Loop_2_proc118_U0_ap_start),
    .ap_done(Loop_2_proc118_U0_ap_done),
    .ap_continue(Loop_2_proc118_U0_ap_continue),
    .ap_idle(Loop_2_proc118_U0_ap_idle),
    .ap_ready(Loop_2_proc118_U0_ap_ready),
    .Len_dout(Len_c_dout),
    .Len_empty_n(Len_c_empty_n),
    .Len_read(Loop_2_proc118_U0_Len_read),
    .Buff_A_dout(Buff_A_channel_dout),
    .Buff_A_empty_n(Buff_A_channel_empty_n),
    .Buff_A_read(Loop_2_proc118_U0_Buff_A_read),
    .Buff_B_dout(Buff_B_channel_dout),
    .Buff_B_empty_n(Buff_B_channel_empty_n),
    .Buff_B_read(Loop_2_proc118_U0_Buff_B_read),
    .OutA_TDATA(Loop_2_proc118_U0_OutA_TDATA),
    .OutA_TVALID(Loop_2_proc118_U0_OutA_TVALID),
    .OutA_TREADY(OutA_TREADY),
    .OutA_TKEEP(Loop_2_proc118_U0_OutA_TKEEP),
    .OutA_TSTRB(Loop_2_proc118_U0_OutA_TSTRB),
    .OutA_TUSER(Loop_2_proc118_U0_OutA_TUSER),
    .OutA_TLAST(Loop_2_proc118_U0_OutA_TLAST),
    .OutA_TID(Loop_2_proc118_U0_OutA_TID),
    .OutA_TDEST(Loop_2_proc118_U0_OutA_TDEST),
    .OutB_TDATA(Loop_2_proc118_U0_OutB_TDATA),
    .OutB_TVALID(Loop_2_proc118_U0_OutB_TVALID),
    .OutB_TREADY(OutB_TREADY),
    .OutB_TKEEP(Loop_2_proc118_U0_OutB_TKEEP),
    .OutB_TSTRB(Loop_2_proc118_U0_OutB_TSTRB),
    .OutB_TUSER(Loop_2_proc118_U0_OutB_TUSER),
    .OutB_TLAST(Loop_2_proc118_U0_OutB_TLAST),
    .OutB_TID(Loop_2_proc118_U0_OutB_TID),
    .OutB_TDEST(Loop_2_proc118_U0_OutB_TDEST)
);

fifo_w32_d8192_A Buff_A_channel_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(Loop_1_proc117_U0_Buff_A_din),
    .if_full_n(Buff_A_channel_full_n),
    .if_write(Loop_1_proc117_U0_Buff_A_write),
    .if_dout(Buff_A_channel_dout),
    .if_empty_n(Buff_A_channel_empty_n),
    .if_read(Loop_2_proc118_U0_Buff_A_read)
);

fifo_w32_d8192_A Buff_B_channel_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(Loop_1_proc117_U0_Buff_B_din),
    .if_full_n(Buff_B_channel_full_n),
    .if_write(Loop_1_proc117_U0_Buff_B_write),
    .if_dout(Buff_B_channel_dout),
    .if_empty_n(Buff_B_channel_empty_n),
    .if_read(Loop_2_proc118_U0_Buff_B_read)
);

fifo_w32_d2_A Len_c_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(Loop_1_proc117_U0_Len_out_din),
    .if_full_n(Len_c_full_n),
    .if_write(Loop_1_proc117_U0_Len_out_write),
    .if_dout(Len_c_dout),
    .if_empty_n(Len_c_empty_n),
    .if_read(Loop_2_proc118_U0_Len_read)
);

start_for_Loop_2_wdI start_for_Loop_2_wdI_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(start_for_Loop_2_proc118_U0_din),
    .if_full_n(start_for_Loop_2_proc118_U0_full_n),
    .if_write(Loop_1_proc117_U0_start_write),
    .if_dout(start_for_Loop_2_proc118_U0_dout),
    .if_empty_n(start_for_Loop_2_proc118_U0_empty_n),
    .if_read(Loop_2_proc118_U0_ap_ready)
);

assign InA_TREADY = Loop_1_proc117_U0_InA_TREADY;

assign InB_TREADY = Loop_1_proc117_U0_InB_TREADY;

assign Loop_1_proc117_U0_ap_continue = 1'b1;

assign Loop_1_proc117_U0_ap_start = ap_start;

assign Loop_2_proc118_U0_ap_continue = 1'b1;

assign Loop_2_proc118_U0_ap_start = start_for_Loop_2_proc118_U0_empty_n;

assign Loop_2_proc118_U0_start_full_n = 1'b1;

assign Loop_2_proc118_U0_start_write = 1'b0;

assign OutA_TDATA = Loop_2_proc118_U0_OutA_TDATA;

assign OutA_TDEST = Loop_2_proc118_U0_OutA_TDEST;

assign OutA_TID = Loop_2_proc118_U0_OutA_TID;

assign OutA_TKEEP = Loop_2_proc118_U0_OutA_TKEEP;

assign OutA_TLAST = Loop_2_proc118_U0_OutA_TLAST;

assign OutA_TSTRB = Loop_2_proc118_U0_OutA_TSTRB;

assign OutA_TUSER = Loop_2_proc118_U0_OutA_TUSER;

assign OutA_TVALID = Loop_2_proc118_U0_OutA_TVALID;

assign OutB_TDATA = Loop_2_proc118_U0_OutB_TDATA;

assign OutB_TDEST = Loop_2_proc118_U0_OutB_TDEST;

assign OutB_TID = Loop_2_proc118_U0_OutB_TID;

assign OutB_TKEEP = Loop_2_proc118_U0_OutB_TKEEP;

assign OutB_TLAST = Loop_2_proc118_U0_OutB_TLAST;

assign OutB_TSTRB = Loop_2_proc118_U0_OutB_TSTRB;

assign OutB_TUSER = Loop_2_proc118_U0_OutB_TUSER;

assign OutB_TVALID = Loop_2_proc118_U0_OutB_TVALID;

assign ap_done = Loop_2_proc118_U0_ap_done;

assign ap_idle = (Loop_2_proc118_U0_ap_idle & Loop_1_proc117_U0_ap_idle);

assign ap_ready = Loop_1_proc117_U0_ap_ready;

always @ (*) begin
    ap_rst_n_inv = ~ap_rst_n;
end

assign ap_sync_continue = 1'b1;

assign ap_sync_done = Loop_2_proc118_U0_ap_done;

assign ap_sync_ready = Loop_1_proc117_U0_ap_ready;

assign start_for_Loop_2_proc118_U0_din = 1'b1;

endmodule //pitchshift
