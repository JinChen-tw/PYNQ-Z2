// ==============================================================
// File generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2018.2
// Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
// 
// ==============================================================

// CONTROL_BUS
// 0x00 : Control signals
//        bit 0  - ap_start (Read/Write/COH)
//        bit 1  - ap_done (Read/COR)
//        bit 2  - ap_idle (Read)
//        bit 3  - ap_ready (Read)
//        bit 7  - auto_restart (Read/Write)
//        others - reserved
// 0x04 : Global Interrupt Enable Register
//        bit 0  - Global Interrupt Enable (Read/Write)
//        others - reserved
// 0x08 : IP Interrupt Enable Register (Read/Write)
//        bit 0  - Channel 0 (ap_done)
//        bit 1  - Channel 1 (ap_ready)
//        others - reserved
// 0x0c : IP Interrupt Status Register (Read/TOW)
//        bit 0  - Channel 0 (ap_done)
//        bit 1  - Channel 1 (ap_ready)
//        others - reserved
// 0x14 : Data signal of rows
//        bit 31~0 - rows[31:0] (Read/Write)
// 0x18 : reserved
// 0x1c : Data signal of cols
//        bit 31~0 - cols[31:0] (Read/Write)
// 0x20 : reserved
// 0x24 : Data signal of channels
//        bit 31~0 - channels[31:0] (Read/Write)
// 0x28 : reserved
// 0x2c : Data signal of mode
//        bit 31~0 - mode[31:0] (Read/Write)
// 0x30 : reserved
// 0x34 : Data signal of r1_V
//        bit 31~0 - r1_V[31:0] (Read/Write)
// 0x38 : reserved
// 0x3c : Data signal of r2_V
//        bit 31~0 - r2_V[31:0] (Read/Write)
// 0x40 : reserved
// 0x44 : Data signal of r3_V
//        bit 31~0 - r3_V[31:0] (Read/Write)
// 0x48 : reserved
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define XFILTER2D_HLS_CONTROL_BUS_ADDR_AP_CTRL       0x00
#define XFILTER2D_HLS_CONTROL_BUS_ADDR_GIE           0x04
#define XFILTER2D_HLS_CONTROL_BUS_ADDR_IER           0x08
#define XFILTER2D_HLS_CONTROL_BUS_ADDR_ISR           0x0c
#define XFILTER2D_HLS_CONTROL_BUS_ADDR_ROWS_DATA     0x14
#define XFILTER2D_HLS_CONTROL_BUS_BITS_ROWS_DATA     32
#define XFILTER2D_HLS_CONTROL_BUS_ADDR_COLS_DATA     0x1c
#define XFILTER2D_HLS_CONTROL_BUS_BITS_COLS_DATA     32
#define XFILTER2D_HLS_CONTROL_BUS_ADDR_CHANNELS_DATA 0x24
#define XFILTER2D_HLS_CONTROL_BUS_BITS_CHANNELS_DATA 32
#define XFILTER2D_HLS_CONTROL_BUS_ADDR_MODE_DATA     0x2c
#define XFILTER2D_HLS_CONTROL_BUS_BITS_MODE_DATA     32
#define XFILTER2D_HLS_CONTROL_BUS_ADDR_R1_V_DATA     0x34
#define XFILTER2D_HLS_CONTROL_BUS_BITS_R1_V_DATA     32
#define XFILTER2D_HLS_CONTROL_BUS_ADDR_R2_V_DATA     0x3c
#define XFILTER2D_HLS_CONTROL_BUS_BITS_R2_V_DATA     32
#define XFILTER2D_HLS_CONTROL_BUS_ADDR_R3_V_DATA     0x44
#define XFILTER2D_HLS_CONTROL_BUS_BITS_R3_V_DATA     32

