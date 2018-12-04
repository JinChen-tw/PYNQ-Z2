// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2018.2
// Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module Loop_2_proc (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        rows,
        col_packets_loc_dout,
        col_packets_loc_empty_n,
        col_packets_loc_read,
        out_stream_TDATA,
        out_stream_TVALID,
        out_stream_TREADY,
        g_img_1_data_stream_0_V_dout,
        g_img_1_data_stream_0_V_empty_n,
        g_img_1_data_stream_0_V_read,
        out_stream_TUSER,
        out_stream_TLAST
);

parameter    ap_ST_fsm_state1 = 11'd1;
parameter    ap_ST_fsm_state2 = 11'd2;
parameter    ap_ST_fsm_state3 = 11'd4;
parameter    ap_ST_fsm_state4 = 11'd8;
parameter    ap_ST_fsm_state5 = 11'd16;
parameter    ap_ST_fsm_state6 = 11'd32;
parameter    ap_ST_fsm_pp0_stage0 = 11'd64;
parameter    ap_ST_fsm_pp0_stage1 = 11'd128;
parameter    ap_ST_fsm_pp0_stage2 = 11'd256;
parameter    ap_ST_fsm_pp0_stage3 = 11'd512;
parameter    ap_ST_fsm_state13 = 11'd1024;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
input  [31:0] rows;
input  [30:0] col_packets_loc_dout;
input   col_packets_loc_empty_n;
output   col_packets_loc_read;
output  [31:0] out_stream_TDATA;
output   out_stream_TVALID;
input   out_stream_TREADY;
input  [7:0] g_img_1_data_stream_0_V_dout;
input   g_img_1_data_stream_0_V_empty_n;
output   g_img_1_data_stream_0_V_read;
output  [0:0] out_stream_TUSER;
output  [0:0] out_stream_TLAST;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg col_packets_loc_read;
reg g_img_1_data_stream_0_V_read;

reg    ap_done_reg;
(* fsm_encoding = "none" *) reg   [10:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg   [31:0] out_stream_data_V_1_data_out;
reg    out_stream_data_V_1_vld_in;
wire    out_stream_data_V_1_vld_out;
wire    out_stream_data_V_1_ack_in;
wire    out_stream_data_V_1_ack_out;
reg   [31:0] out_stream_data_V_1_payload_A;
reg   [31:0] out_stream_data_V_1_payload_B;
reg    out_stream_data_V_1_sel_rd;
reg    out_stream_data_V_1_sel_wr;
wire    out_stream_data_V_1_sel;
wire    out_stream_data_V_1_load_A;
wire    out_stream_data_V_1_load_B;
reg   [1:0] out_stream_data_V_1_state;
wire    out_stream_data_V_1_state_cmp_full;
reg   [0:0] out_stream_user_V_1_data_out;
reg    out_stream_user_V_1_vld_in;
wire    out_stream_user_V_1_vld_out;
wire    out_stream_user_V_1_ack_in;
wire    out_stream_user_V_1_ack_out;
reg   [0:0] out_stream_user_V_1_payload_A;
reg   [0:0] out_stream_user_V_1_payload_B;
reg    out_stream_user_V_1_sel_rd;
reg    out_stream_user_V_1_sel_wr;
wire    out_stream_user_V_1_sel;
wire    out_stream_user_V_1_load_A;
wire    out_stream_user_V_1_load_B;
reg   [1:0] out_stream_user_V_1_state;
wire    out_stream_user_V_1_state_cmp_full;
reg   [0:0] out_stream_last_V_1_data_out;
reg    out_stream_last_V_1_vld_in;
wire    out_stream_last_V_1_vld_out;
wire    out_stream_last_V_1_ack_in;
wire    out_stream_last_V_1_ack_out;
reg   [0:0] out_stream_last_V_1_payload_A;
reg   [0:0] out_stream_last_V_1_payload_B;
reg    out_stream_last_V_1_sel_rd;
reg    out_stream_last_V_1_sel_wr;
wire    out_stream_last_V_1_sel;
wire    out_stream_last_V_1_load_A;
wire    out_stream_last_V_1_load_B;
reg   [1:0] out_stream_last_V_1_state;
wire    out_stream_last_V_1_state_cmp_full;
reg    col_packets_loc_blk_n;
reg    out_stream_TDATA_blk_n;
wire    ap_CS_fsm_pp0_stage0;
reg    ap_enable_reg_pp0_iter1;
wire    ap_block_pp0_stage0;
reg   [0:0] exitcond_flatten_reg_347;
wire    ap_CS_fsm_pp0_stage1;
wire    ap_block_pp0_stage1;
reg   [0:0] exitcond_flatten_reg_347_pp0_iter1_reg;
reg    g_img_1_data_stream_0_V_blk_n;
reg    ap_enable_reg_pp0_iter0;
wire    ap_CS_fsm_pp0_stage2;
wire    ap_block_pp0_stage2;
wire    ap_CS_fsm_pp0_stage3;
wire    ap_block_pp0_stage3;
reg   [62:0] indvar_flatten_reg_129;
reg   [31:0] r4_i_i_reg_140;
reg   [29:0] p_1_rec_i_i_reg_152;
reg   [30:0] col_packets_loc_read_reg_303;
reg    ap_block_state1;
wire    ap_CS_fsm_state2;
wire   [31:0] tmp_23_i_i_fu_176_p2;
wire    ap_CS_fsm_state6;
wire   [30:0] tmp_36_i_i_fu_181_p2;
reg   [30:0] tmp_36_i_i_reg_331;
wire   [62:0] grp_fu_170_p2;
reg   [62:0] bound_reg_336;
wire   [0:0] tmp_42_i_i_fu_190_p2;
reg   [0:0] tmp_42_i_i_reg_341;
wire    ap_block_state7_pp0_stage0_iter0;
reg    ap_block_state11_pp0_stage0_iter1;
reg    ap_block_state11_io;
reg    ap_block_pp0_stage0_11001;
wire   [0:0] exitcond_flatten_fu_195_p2;
wire   [62:0] indvar_flatten_next_fu_200_p2;
reg   [62:0] indvar_flatten_next_reg_351;
wire   [29:0] p_1_rec_i_i_mid2_fu_206_p3;
reg   [29:0] p_1_rec_i_i_mid2_reg_356;
wire   [31:0] r2_fu_214_p2;
reg   [31:0] r2_reg_363;
wire   [0:0] tmp_40_i_i_mid1_fu_220_p2;
reg   [0:0] tmp_40_i_i_mid1_reg_368;
wire   [0:0] tmp_40_i_i3_fu_225_p2;
reg   [0:0] tmp_40_i_i3_reg_373;
wire   [31:0] tmp_20_mid2_v_fu_235_p3;
reg   [31:0] tmp_20_mid2_v_reg_378;
reg    ap_block_state8_pp0_stage1_iter0;
wire    ap_block_state12_pp0_stage1_iter1;
reg    ap_block_state12_io;
reg    ap_block_pp0_stage1_11001;
reg   [7:0] tmp_1_reg_383;
wire   [0:0] out_stream_user_V_tm_fu_271_p2;
reg   [0:0] out_stream_user_V_tm_reg_388;
wire   [0:0] out_stream_last_V_tm_fu_282_p2;
reg   [0:0] out_stream_last_V_tm_reg_393;
reg   [7:0] tmp_2_reg_398;
reg    ap_block_state9_pp0_stage2_iter0;
reg    ap_block_pp0_stage2_11001;
reg   [7:0] tmp_3_reg_403;
reg    ap_block_state10_pp0_stage3_iter0;
reg    ap_block_pp0_stage3_11001;
wire   [29:0] c_fu_288_p2;
reg   [29:0] c_reg_408;
wire   [31:0] p_Result_s_fu_293_p5;
reg    ap_block_pp0_stage0_subdone;
reg    ap_condition_pp0_exit_iter0_state7;
reg    ap_block_pp0_stage3_subdone;
reg    ap_block_pp0_stage1_subdone;
reg   [62:0] ap_phi_mux_indvar_flatten_phi_fu_133_p4;
reg   [31:0] ap_phi_mux_r4_i_i_phi_fu_144_p4;
reg   [29:0] ap_phi_mux_p_1_rec_i_i_phi_fu_156_p4;
reg    ap_block_pp0_stage0_01001;
reg    ap_block_pp0_stage1_01001;
wire   [30:0] grp_fu_170_p0;
wire   [31:0] grp_fu_170_p1;
wire   [30:0] c_cast_i_i_fu_186_p1;
wire   [29:0] tmp_fu_241_p1;
wire   [1:0] tmp_4_fu_253_p4;
wire   [29:0] tmp_s_fu_248_p2;
wire   [31:0] tmp_51_i_i_fu_263_p3;
wire   [30:0] c_cast_i_i_mid2_cast_fu_245_p1;
wire   [0:0] tmp_40_i_i_mid2_fu_230_p3;
wire   [0:0] tmp_53_i_i_fu_277_p2;
wire    ap_CS_fsm_state13;
reg    ap_block_state13;
reg   [10:0] ap_NS_fsm;
reg    ap_block_pp0_stage2_subdone;
reg    ap_idle_pp0;
wire    ap_enable_pp0;
wire   [62:0] grp_fu_170_p00;
wire   [62:0] grp_fu_170_p10;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 11'd1;
#0 out_stream_data_V_1_sel_rd = 1'b0;
#0 out_stream_data_V_1_sel_wr = 1'b0;
#0 out_stream_data_V_1_state = 2'd0;
#0 out_stream_user_V_1_sel_rd = 1'b0;
#0 out_stream_user_V_1_sel_wr = 1'b0;
#0 out_stream_user_V_1_state = 2'd0;
#0 out_stream_last_V_1_sel_rd = 1'b0;
#0 out_stream_last_V_1_sel_wr = 1'b0;
#0 out_stream_last_V_1_state = 2'd0;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter0 = 1'b0;
end

filter2D_hls_mul_jbC #(
    .ID( 1 ),
    .NUM_STAGE( 5 ),
    .din0_WIDTH( 31 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 63 ))
filter2D_hls_mul_jbC_U52(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(grp_fu_170_p0),
    .din1(grp_fu_170_p1),
    .ce(1'b1),
    .dout(grp_fu_170_p2)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if ((~((out_stream_data_V_1_ack_in == 1'b0) | (out_stream_last_V_1_ack_in == 1'b0) | (out_stream_user_V_1_ack_in == 1'b0)) & (1'b1 == ap_CS_fsm_state13))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter0 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_condition_pp0_exit_iter0_state7) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_enable_reg_pp0_iter0 <= 1'b0;
        end else if ((1'b1 == ap_CS_fsm_state6)) begin
            ap_enable_reg_pp0_iter0 <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if (((1'b1 == ap_condition_pp0_exit_iter0_state7) & (((1'b0 == ap_block_pp0_stage3_subdone) & (1'b1 == ap_CS_fsm_pp0_stage3)) | ((1'b0 == ap_block_pp0_stage1_subdone) & (1'b1 == ap_CS_fsm_pp0_stage1))))) begin
            ap_enable_reg_pp0_iter1 <= (1'b1 ^ ap_condition_pp0_exit_iter0_state7);
        end else if ((((1'b0 == ap_block_pp0_stage3_subdone) & (1'b1 == ap_CS_fsm_pp0_stage3)) | ((1'b0 == ap_block_pp0_stage1_subdone) & (1'b1 == ap_CS_fsm_pp0_stage1)))) begin
            ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
        end else if ((1'b1 == ap_CS_fsm_state6)) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        out_stream_data_V_1_sel_rd <= 1'b0;
    end else begin
        if (((out_stream_data_V_1_ack_out == 1'b1) & (out_stream_data_V_1_vld_out == 1'b1))) begin
            out_stream_data_V_1_sel_rd <= ~out_stream_data_V_1_sel_rd;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        out_stream_data_V_1_sel_wr <= 1'b0;
    end else begin
        if (((out_stream_data_V_1_ack_in == 1'b1) & (out_stream_data_V_1_vld_in == 1'b1))) begin
            out_stream_data_V_1_sel_wr <= ~out_stream_data_V_1_sel_wr;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        out_stream_data_V_1_state <= 2'd0;
    end else begin
        if ((((out_stream_data_V_1_state == 2'd2) & (out_stream_data_V_1_vld_in == 1'b0)) | ((out_stream_data_V_1_state == 2'd3) & (out_stream_data_V_1_vld_in == 1'b0) & (out_stream_data_V_1_ack_out == 1'b1)))) begin
            out_stream_data_V_1_state <= 2'd2;
        end else if ((((out_stream_data_V_1_state == 2'd1) & (out_stream_data_V_1_ack_out == 1'b0)) | ((out_stream_data_V_1_state == 2'd3) & (out_stream_data_V_1_ack_out == 1'b0) & (out_stream_data_V_1_vld_in == 1'b1)))) begin
            out_stream_data_V_1_state <= 2'd1;
        end else if (((~((out_stream_data_V_1_vld_in == 1'b0) & (out_stream_data_V_1_ack_out == 1'b1)) & ~((out_stream_data_V_1_ack_out == 1'b0) & (out_stream_data_V_1_vld_in == 1'b1)) & (out_stream_data_V_1_state == 2'd3)) | ((out_stream_data_V_1_state == 2'd1) & (out_stream_data_V_1_ack_out == 1'b1)) | ((out_stream_data_V_1_state == 2'd2) & (out_stream_data_V_1_vld_in == 1'b1)))) begin
            out_stream_data_V_1_state <= 2'd3;
        end else begin
            out_stream_data_V_1_state <= 2'd2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        out_stream_last_V_1_sel_rd <= 1'b0;
    end else begin
        if (((out_stream_last_V_1_ack_out == 1'b1) & (out_stream_last_V_1_vld_out == 1'b1))) begin
            out_stream_last_V_1_sel_rd <= ~out_stream_last_V_1_sel_rd;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        out_stream_last_V_1_sel_wr <= 1'b0;
    end else begin
        if (((out_stream_last_V_1_ack_in == 1'b1) & (out_stream_last_V_1_vld_in == 1'b1))) begin
            out_stream_last_V_1_sel_wr <= ~out_stream_last_V_1_sel_wr;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        out_stream_last_V_1_state <= 2'd0;
    end else begin
        if ((((out_stream_last_V_1_state == 2'd2) & (out_stream_last_V_1_vld_in == 1'b0)) | ((out_stream_last_V_1_state == 2'd3) & (out_stream_last_V_1_vld_in == 1'b0) & (out_stream_last_V_1_ack_out == 1'b1)))) begin
            out_stream_last_V_1_state <= 2'd2;
        end else if ((((out_stream_last_V_1_state == 2'd1) & (out_stream_last_V_1_ack_out == 1'b0)) | ((out_stream_last_V_1_state == 2'd3) & (out_stream_last_V_1_ack_out == 1'b0) & (out_stream_last_V_1_vld_in == 1'b1)))) begin
            out_stream_last_V_1_state <= 2'd1;
        end else if (((~((out_stream_last_V_1_vld_in == 1'b0) & (out_stream_last_V_1_ack_out == 1'b1)) & ~((out_stream_last_V_1_ack_out == 1'b0) & (out_stream_last_V_1_vld_in == 1'b1)) & (out_stream_last_V_1_state == 2'd3)) | ((out_stream_last_V_1_state == 2'd1) & (out_stream_last_V_1_ack_out == 1'b1)) | ((out_stream_last_V_1_state == 2'd2) & (out_stream_last_V_1_vld_in == 1'b1)))) begin
            out_stream_last_V_1_state <= 2'd3;
        end else begin
            out_stream_last_V_1_state <= 2'd2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        out_stream_user_V_1_sel_rd <= 1'b0;
    end else begin
        if (((out_stream_user_V_1_ack_out == 1'b1) & (out_stream_user_V_1_vld_out == 1'b1))) begin
            out_stream_user_V_1_sel_rd <= ~out_stream_user_V_1_sel_rd;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        out_stream_user_V_1_sel_wr <= 1'b0;
    end else begin
        if (((out_stream_user_V_1_ack_in == 1'b1) & (out_stream_user_V_1_vld_in == 1'b1))) begin
            out_stream_user_V_1_sel_wr <= ~out_stream_user_V_1_sel_wr;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        out_stream_user_V_1_state <= 2'd0;
    end else begin
        if ((((out_stream_user_V_1_state == 2'd2) & (out_stream_user_V_1_vld_in == 1'b0)) | ((out_stream_user_V_1_state == 2'd3) & (out_stream_user_V_1_vld_in == 1'b0) & (out_stream_user_V_1_ack_out == 1'b1)))) begin
            out_stream_user_V_1_state <= 2'd2;
        end else if ((((out_stream_user_V_1_state == 2'd1) & (out_stream_user_V_1_ack_out == 1'b0)) | ((out_stream_user_V_1_state == 2'd3) & (out_stream_user_V_1_ack_out == 1'b0) & (out_stream_user_V_1_vld_in == 1'b1)))) begin
            out_stream_user_V_1_state <= 2'd1;
        end else if (((~((out_stream_user_V_1_vld_in == 1'b0) & (out_stream_user_V_1_ack_out == 1'b1)) & ~((out_stream_user_V_1_ack_out == 1'b0) & (out_stream_user_V_1_vld_in == 1'b1)) & (out_stream_user_V_1_state == 2'd3)) | ((out_stream_user_V_1_state == 2'd1) & (out_stream_user_V_1_ack_out == 1'b1)) | ((out_stream_user_V_1_state == 2'd2) & (out_stream_user_V_1_vld_in == 1'b1)))) begin
            out_stream_user_V_1_state <= 2'd3;
        end else begin
            out_stream_user_V_1_state <= 2'd2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond_flatten_reg_347 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        indvar_flatten_reg_129 <= indvar_flatten_next_reg_351;
    end else if ((1'b1 == ap_CS_fsm_state6)) begin
        indvar_flatten_reg_129 <= 63'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond_flatten_reg_347 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        p_1_rec_i_i_reg_152 <= c_reg_408;
    end else if ((1'b1 == ap_CS_fsm_state6)) begin
        p_1_rec_i_i_reg_152 <= 30'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond_flatten_reg_347 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        r4_i_i_reg_140 <= tmp_20_mid2_v_reg_378;
    end else if ((1'b1 == ap_CS_fsm_state6)) begin
        r4_i_i_reg_140 <= 32'd0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        bound_reg_336 <= grp_fu_170_p2;
        tmp_36_i_i_reg_331 <= tmp_36_i_i_fu_181_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond_flatten_reg_347 == 1'd0) & (1'b0 == ap_block_pp0_stage3_11001) & (1'b1 == ap_CS_fsm_pp0_stage3) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
        c_reg_408 <= c_fu_288_p2;
        tmp_3_reg_403 <= g_img_1_data_stream_0_V_dout;
    end
end

always @ (posedge ap_clk) begin
    if ((~((col_packets_loc_empty_n == 1'b0) | (ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        col_packets_loc_read_reg_303 <= col_packets_loc_dout;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        exitcond_flatten_reg_347 <= exitcond_flatten_fu_195_p2;
        exitcond_flatten_reg_347_pp0_iter1_reg <= exitcond_flatten_reg_347;
        tmp_42_i_i_reg_341 <= tmp_42_i_i_fu_190_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        indvar_flatten_next_reg_351 <= indvar_flatten_next_fu_200_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((out_stream_data_V_1_load_A == 1'b1)) begin
        out_stream_data_V_1_payload_A <= p_Result_s_fu_293_p5;
    end
end

always @ (posedge ap_clk) begin
    if ((out_stream_data_V_1_load_B == 1'b1)) begin
        out_stream_data_V_1_payload_B <= p_Result_s_fu_293_p5;
    end
end

always @ (posedge ap_clk) begin
    if ((out_stream_last_V_1_load_A == 1'b1)) begin
        out_stream_last_V_1_payload_A <= out_stream_last_V_tm_reg_393;
    end
end

always @ (posedge ap_clk) begin
    if ((out_stream_last_V_1_load_B == 1'b1)) begin
        out_stream_last_V_1_payload_B <= out_stream_last_V_tm_reg_393;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond_flatten_reg_347 == 1'd0) & (1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        out_stream_last_V_tm_reg_393 <= out_stream_last_V_tm_fu_282_p2;
        out_stream_user_V_tm_reg_388 <= out_stream_user_V_tm_fu_271_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((out_stream_user_V_1_load_A == 1'b1)) begin
        out_stream_user_V_1_payload_A <= out_stream_user_V_tm_reg_388;
    end
end

always @ (posedge ap_clk) begin
    if ((out_stream_user_V_1_load_B == 1'b1)) begin
        out_stream_user_V_1_payload_B <= out_stream_user_V_tm_reg_388;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond_flatten_fu_195_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        p_1_rec_i_i_mid2_reg_356 <= p_1_rec_i_i_mid2_fu_206_p3;
        r2_reg_363 <= r2_fu_214_p2;
        tmp_40_i_i3_reg_373 <= tmp_40_i_i3_fu_225_p2;
        tmp_40_i_i_mid1_reg_368 <= tmp_40_i_i_mid1_fu_220_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond_flatten_reg_347 == 1'd0) & (1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        tmp_1_reg_383 <= g_img_1_data_stream_0_V_dout;
        tmp_20_mid2_v_reg_378 <= tmp_20_mid2_v_fu_235_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond_flatten_reg_347 == 1'd0) & (1'b0 == ap_block_pp0_stage2_11001) & (1'b1 == ap_CS_fsm_pp0_stage2) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
        tmp_2_reg_398 <= g_img_1_data_stream_0_V_dout;
    end
end

always @ (*) begin
    if ((exitcond_flatten_fu_195_p2 == 1'd1)) begin
        ap_condition_pp0_exit_iter0_state7 = 1'b1;
    end else begin
        ap_condition_pp0_exit_iter0_state7 = 1'b0;
    end
end

always @ (*) begin
    if ((~((out_stream_data_V_1_ack_in == 1'b0) | (out_stream_last_V_1_ack_in == 1'b0) | (out_stream_user_V_1_ack_in == 1'b0)) & (1'b1 == ap_CS_fsm_state13))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = ap_done_reg;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((exitcond_flatten_reg_347 == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_phi_mux_indvar_flatten_phi_fu_133_p4 = indvar_flatten_next_reg_351;
    end else begin
        ap_phi_mux_indvar_flatten_phi_fu_133_p4 = indvar_flatten_reg_129;
    end
end

always @ (*) begin
    if (((exitcond_flatten_reg_347 == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_phi_mux_p_1_rec_i_i_phi_fu_156_p4 = c_reg_408;
    end else begin
        ap_phi_mux_p_1_rec_i_i_phi_fu_156_p4 = p_1_rec_i_i_reg_152;
    end
end

always @ (*) begin
    if (((exitcond_flatten_reg_347 == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_phi_mux_r4_i_i_phi_fu_144_p4 = tmp_20_mid2_v_reg_378;
    end else begin
        ap_phi_mux_r4_i_i_phi_fu_144_p4 = r4_i_i_reg_140;
    end
end

always @ (*) begin
    if ((~((out_stream_data_V_1_ack_in == 1'b0) | (out_stream_last_V_1_ack_in == 1'b0) | (out_stream_user_V_1_ack_in == 1'b0)) & (1'b1 == ap_CS_fsm_state13))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        col_packets_loc_blk_n = col_packets_loc_empty_n;
    end else begin
        col_packets_loc_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((col_packets_loc_empty_n == 1'b0) | (ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        col_packets_loc_read = 1'b1;
    end else begin
        col_packets_loc_read = 1'b0;
    end
end

always @ (*) begin
    if ((((exitcond_flatten_reg_347 == 1'd0) & (1'b0 == ap_block_pp0_stage3) & (1'b1 == ap_CS_fsm_pp0_stage3) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((exitcond_flatten_reg_347 == 1'd0) & (1'b0 == ap_block_pp0_stage2) & (1'b1 == ap_CS_fsm_pp0_stage2) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((exitcond_flatten_reg_347 == 1'd0) & (1'b0 == ap_block_pp0_stage1) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1)) | ((exitcond_flatten_reg_347 == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)))) begin
        g_img_1_data_stream_0_V_blk_n = g_img_1_data_stream_0_V_empty_n;
    end else begin
        g_img_1_data_stream_0_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((((exitcond_flatten_reg_347 == 1'd0) & (1'b0 == ap_block_pp0_stage3_11001) & (1'b1 == ap_CS_fsm_pp0_stage3) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((exitcond_flatten_reg_347 == 1'd0) & (1'b0 == ap_block_pp0_stage2_11001) & (1'b1 == ap_CS_fsm_pp0_stage2) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((exitcond_flatten_reg_347 == 1'd0) & (1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1)) | ((exitcond_flatten_reg_347 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)))) begin
        g_img_1_data_stream_0_V_read = 1'b1;
    end else begin
        g_img_1_data_stream_0_V_read = 1'b0;
    end
end

always @ (*) begin
    if ((((exitcond_flatten_reg_347_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage1) & (1'b1 == ap_CS_fsm_pp0_stage1) & (ap_enable_reg_pp0_iter1 == 1'b1)) | ((exitcond_flatten_reg_347 == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)))) begin
        out_stream_TDATA_blk_n = out_stream_data_V_1_state[1'd1];
    end else begin
        out_stream_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((out_stream_data_V_1_sel == 1'b1)) begin
        out_stream_data_V_1_data_out = out_stream_data_V_1_payload_B;
    end else begin
        out_stream_data_V_1_data_out = out_stream_data_V_1_payload_A;
    end
end

always @ (*) begin
    if (((exitcond_flatten_reg_347 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        out_stream_data_V_1_vld_in = 1'b1;
    end else begin
        out_stream_data_V_1_vld_in = 1'b0;
    end
end

always @ (*) begin
    if ((out_stream_last_V_1_sel == 1'b1)) begin
        out_stream_last_V_1_data_out = out_stream_last_V_1_payload_B;
    end else begin
        out_stream_last_V_1_data_out = out_stream_last_V_1_payload_A;
    end
end

always @ (*) begin
    if (((exitcond_flatten_reg_347 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        out_stream_last_V_1_vld_in = 1'b1;
    end else begin
        out_stream_last_V_1_vld_in = 1'b0;
    end
end

always @ (*) begin
    if ((out_stream_user_V_1_sel == 1'b1)) begin
        out_stream_user_V_1_data_out = out_stream_user_V_1_payload_B;
    end else begin
        out_stream_user_V_1_data_out = out_stream_user_V_1_payload_A;
    end
end

always @ (*) begin
    if (((exitcond_flatten_reg_347 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        out_stream_user_V_1_vld_in = 1'b1;
    end else begin
        out_stream_user_V_1_vld_in = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((col_packets_loc_empty_n == 1'b0) | (ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            ap_NS_fsm = ap_ST_fsm_state3;
        end
        ap_ST_fsm_state3 : begin
            ap_NS_fsm = ap_ST_fsm_state4;
        end
        ap_ST_fsm_state4 : begin
            ap_NS_fsm = ap_ST_fsm_state5;
        end
        ap_ST_fsm_state5 : begin
            ap_NS_fsm = ap_ST_fsm_state6;
        end
        ap_ST_fsm_state6 : begin
            ap_NS_fsm = ap_ST_fsm_pp0_stage0;
        end
        ap_ST_fsm_pp0_stage0 : begin
            if ((~((exitcond_flatten_fu_195_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1)) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage1;
            end else if (((exitcond_flatten_fu_195_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state13;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_pp0_stage1 : begin
            if ((~((1'b0 == ap_block_pp0_stage1_subdone) & (ap_enable_reg_pp0_iter0 == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage1) & (ap_enable_reg_pp0_iter1 == 1'b1)) & (1'b0 == ap_block_pp0_stage1_subdone))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage2;
            end else if (((1'b0 == ap_block_pp0_stage1_subdone) & (ap_enable_reg_pp0_iter0 == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage1) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state13;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage1;
            end
        end
        ap_ST_fsm_pp0_stage2 : begin
            if ((1'b0 == ap_block_pp0_stage2_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage3;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage2;
            end
        end
        ap_ST_fsm_pp0_stage3 : begin
            if ((1'b0 == ap_block_pp0_stage3_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage3;
            end
        end
        ap_ST_fsm_state13 : begin
            if ((~((out_stream_data_V_1_ack_in == 1'b0) | (out_stream_last_V_1_ack_in == 1'b0) | (out_stream_user_V_1_ack_in == 1'b0)) & (1'b1 == ap_CS_fsm_state13))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state13;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd6];

assign ap_CS_fsm_pp0_stage1 = ap_CS_fsm[32'd7];

assign ap_CS_fsm_pp0_stage2 = ap_CS_fsm[32'd8];

assign ap_CS_fsm_pp0_stage3 = ap_CS_fsm[32'd9];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state13 = ap_CS_fsm[32'd10];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state6 = ap_CS_fsm[32'd5];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_01001 = ((exitcond_flatten_reg_347 == 1'd0) & (g_img_1_data_stream_0_V_empty_n == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = ((ap_enable_reg_pp0_iter1 == 1'b1) & ((1'b1 == ap_block_state11_io) | ((exitcond_flatten_reg_347 == 1'd0) & (g_img_1_data_stream_0_V_empty_n == 1'b0))));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = ((ap_enable_reg_pp0_iter1 == 1'b1) & ((1'b1 == ap_block_state11_io) | ((exitcond_flatten_reg_347 == 1'd0) & (g_img_1_data_stream_0_V_empty_n == 1'b0))));
end

assign ap_block_pp0_stage1 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage1_01001 = ((exitcond_flatten_reg_347 == 1'd0) & (g_img_1_data_stream_0_V_empty_n == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1));
end

always @ (*) begin
    ap_block_pp0_stage1_11001 = (((exitcond_flatten_reg_347 == 1'd0) & (g_img_1_data_stream_0_V_empty_n == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((1'b1 == ap_block_state12_io) & (ap_enable_reg_pp0_iter1 == 1'b1)));
end

always @ (*) begin
    ap_block_pp0_stage1_subdone = (((exitcond_flatten_reg_347 == 1'd0) & (g_img_1_data_stream_0_V_empty_n == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((1'b1 == ap_block_state12_io) & (ap_enable_reg_pp0_iter1 == 1'b1)));
end

assign ap_block_pp0_stage2 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage2_11001 = ((exitcond_flatten_reg_347 == 1'd0) & (g_img_1_data_stream_0_V_empty_n == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1));
end

always @ (*) begin
    ap_block_pp0_stage2_subdone = ((exitcond_flatten_reg_347 == 1'd0) & (g_img_1_data_stream_0_V_empty_n == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1));
end

assign ap_block_pp0_stage3 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage3_11001 = ((exitcond_flatten_reg_347 == 1'd0) & (g_img_1_data_stream_0_V_empty_n == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1));
end

always @ (*) begin
    ap_block_pp0_stage3_subdone = ((exitcond_flatten_reg_347 == 1'd0) & (g_img_1_data_stream_0_V_empty_n == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1));
end

always @ (*) begin
    ap_block_state1 = ((col_packets_loc_empty_n == 1'b0) | (ap_start == 1'b0) | (ap_done_reg == 1'b1));
end

always @ (*) begin
    ap_block_state10_pp0_stage3_iter0 = ((exitcond_flatten_reg_347 == 1'd0) & (g_img_1_data_stream_0_V_empty_n == 1'b0));
end

always @ (*) begin
    ap_block_state11_io = ((exitcond_flatten_reg_347 == 1'd0) & (out_stream_last_V_1_ack_in == 1'b0));
end

always @ (*) begin
    ap_block_state11_pp0_stage0_iter1 = ((exitcond_flatten_reg_347 == 1'd0) & (g_img_1_data_stream_0_V_empty_n == 1'b0));
end

always @ (*) begin
    ap_block_state12_io = ((exitcond_flatten_reg_347_pp0_iter1_reg == 1'd0) & (out_stream_last_V_1_ack_in == 1'b0));
end

assign ap_block_state12_pp0_stage1_iter1 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state13 = ((out_stream_data_V_1_ack_in == 1'b0) | (out_stream_last_V_1_ack_in == 1'b0) | (out_stream_user_V_1_ack_in == 1'b0));
end

assign ap_block_state7_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state8_pp0_stage1_iter0 = ((exitcond_flatten_reg_347 == 1'd0) & (g_img_1_data_stream_0_V_empty_n == 1'b0));
end

always @ (*) begin
    ap_block_state9_pp0_stage2_iter0 = ((exitcond_flatten_reg_347 == 1'd0) & (g_img_1_data_stream_0_V_empty_n == 1'b0));
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign c_cast_i_i_fu_186_p1 = ap_phi_mux_p_1_rec_i_i_phi_fu_156_p4;

assign c_cast_i_i_mid2_cast_fu_245_p1 = p_1_rec_i_i_mid2_reg_356;

assign c_fu_288_p2 = (30'd1 + p_1_rec_i_i_mid2_reg_356);

assign exitcond_flatten_fu_195_p2 = ((ap_phi_mux_indvar_flatten_phi_fu_133_p4 == bound_reg_336) ? 1'b1 : 1'b0);

assign grp_fu_170_p0 = grp_fu_170_p00;

assign grp_fu_170_p00 = col_packets_loc_read_reg_303;

assign grp_fu_170_p1 = grp_fu_170_p10;

assign grp_fu_170_p10 = rows;

assign indvar_flatten_next_fu_200_p2 = (ap_phi_mux_indvar_flatten_phi_fu_133_p4 + 63'd1);

assign out_stream_TDATA = out_stream_data_V_1_data_out;

assign out_stream_TLAST = out_stream_last_V_1_data_out;

assign out_stream_TUSER = out_stream_user_V_1_data_out;

assign out_stream_TVALID = out_stream_last_V_1_state[1'd0];

assign out_stream_data_V_1_ack_in = out_stream_data_V_1_state[1'd1];

assign out_stream_data_V_1_ack_out = out_stream_TREADY;

assign out_stream_data_V_1_load_A = (out_stream_data_V_1_state_cmp_full & ~out_stream_data_V_1_sel_wr);

assign out_stream_data_V_1_load_B = (out_stream_data_V_1_state_cmp_full & out_stream_data_V_1_sel_wr);

assign out_stream_data_V_1_sel = out_stream_data_V_1_sel_rd;

assign out_stream_data_V_1_state_cmp_full = ((out_stream_data_V_1_state != 2'd1) ? 1'b1 : 1'b0);

assign out_stream_data_V_1_vld_out = out_stream_data_V_1_state[1'd0];

assign out_stream_last_V_1_ack_in = out_stream_last_V_1_state[1'd1];

assign out_stream_last_V_1_ack_out = out_stream_TREADY;

assign out_stream_last_V_1_load_A = (out_stream_last_V_1_state_cmp_full & ~out_stream_last_V_1_sel_wr);

assign out_stream_last_V_1_load_B = (out_stream_last_V_1_state_cmp_full & out_stream_last_V_1_sel_wr);

assign out_stream_last_V_1_sel = out_stream_last_V_1_sel_rd;

assign out_stream_last_V_1_state_cmp_full = ((out_stream_last_V_1_state != 2'd1) ? 1'b1 : 1'b0);

assign out_stream_last_V_1_vld_out = out_stream_last_V_1_state[1'd0];

assign out_stream_last_V_tm_fu_282_p2 = (tmp_53_i_i_fu_277_p2 & tmp_40_i_i_mid2_fu_230_p3);

assign out_stream_user_V_1_ack_in = out_stream_user_V_1_state[1'd1];

assign out_stream_user_V_1_ack_out = out_stream_TREADY;

assign out_stream_user_V_1_load_A = (out_stream_user_V_1_state_cmp_full & ~out_stream_user_V_1_sel_wr);

assign out_stream_user_V_1_load_B = (out_stream_user_V_1_state_cmp_full & out_stream_user_V_1_sel_wr);

assign out_stream_user_V_1_sel = out_stream_user_V_1_sel_rd;

assign out_stream_user_V_1_state_cmp_full = ((out_stream_user_V_1_state != 2'd1) ? 1'b1 : 1'b0);

assign out_stream_user_V_1_vld_out = out_stream_user_V_1_state[1'd0];

assign out_stream_user_V_tm_fu_271_p2 = ((tmp_51_i_i_fu_263_p3 == 32'd0) ? 1'b1 : 1'b0);

assign p_1_rec_i_i_mid2_fu_206_p3 = ((tmp_42_i_i_fu_190_p2[0:0] === 1'b1) ? ap_phi_mux_p_1_rec_i_i_phi_fu_156_p4 : 30'd0);

assign p_Result_s_fu_293_p5 = {{{{g_img_1_data_stream_0_V_dout}, {tmp_3_reg_403}}, {tmp_2_reg_398}}, {tmp_1_reg_383}};

assign r2_fu_214_p2 = (32'd1 + ap_phi_mux_r4_i_i_phi_fu_144_p4);

assign tmp_20_mid2_v_fu_235_p3 = ((tmp_42_i_i_reg_341[0:0] === 1'b1) ? r4_i_i_reg_140 : r2_reg_363);

assign tmp_23_i_i_fu_176_p2 = ($signed(rows) + $signed(32'd4294967295));

assign tmp_36_i_i_fu_181_p2 = ($signed(col_packets_loc_read_reg_303) + $signed(31'd2147483647));

assign tmp_40_i_i3_fu_225_p2 = ((ap_phi_mux_r4_i_i_phi_fu_144_p4 == tmp_23_i_i_fu_176_p2) ? 1'b1 : 1'b0);

assign tmp_40_i_i_mid1_fu_220_p2 = ((r2_fu_214_p2 == tmp_23_i_i_fu_176_p2) ? 1'b1 : 1'b0);

assign tmp_40_i_i_mid2_fu_230_p3 = ((tmp_42_i_i_reg_341[0:0] === 1'b1) ? tmp_40_i_i3_reg_373 : tmp_40_i_i_mid1_reg_368);

assign tmp_42_i_i_fu_190_p2 = (($signed(c_cast_i_i_fu_186_p1) < $signed(col_packets_loc_read_reg_303)) ? 1'b1 : 1'b0);

assign tmp_4_fu_253_p4 = {{tmp_20_mid2_v_fu_235_p3[31:30]}};

assign tmp_51_i_i_fu_263_p3 = {{tmp_4_fu_253_p4}, {tmp_s_fu_248_p2}};

assign tmp_53_i_i_fu_277_p2 = ((c_cast_i_i_mid2_cast_fu_245_p1 == tmp_36_i_i_reg_331) ? 1'b1 : 1'b0);

assign tmp_fu_241_p1 = tmp_20_mid2_v_fu_235_p3[29:0];

assign tmp_s_fu_248_p2 = (tmp_fu_241_p1 | p_1_rec_i_i_mid2_reg_356);

endmodule //Loop_2_proc
