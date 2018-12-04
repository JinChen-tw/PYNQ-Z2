-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2018.2
-- Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Block_proc is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_continue : IN STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    r1_V : IN STD_LOGIC_VECTOR (31 downto 0);
    r2_V : IN STD_LOGIC_VECTOR (31 downto 0);
    r3_V : IN STD_LOGIC_VECTOR (31 downto 0);
    kernel_val_0_V_0_out_din : OUT STD_LOGIC_VECTOR (7 downto 0);
    kernel_val_0_V_0_out_full_n : IN STD_LOGIC;
    kernel_val_0_V_0_out_write : OUT STD_LOGIC;
    kernel_val_0_V_1_out_din : OUT STD_LOGIC_VECTOR (7 downto 0);
    kernel_val_0_V_1_out_full_n : IN STD_LOGIC;
    kernel_val_0_V_1_out_write : OUT STD_LOGIC;
    kernel_val_0_V_2_out_din : OUT STD_LOGIC_VECTOR (7 downto 0);
    kernel_val_0_V_2_out_full_n : IN STD_LOGIC;
    kernel_val_0_V_2_out_write : OUT STD_LOGIC;
    kernel_val_1_V_0_out_din : OUT STD_LOGIC_VECTOR (7 downto 0);
    kernel_val_1_V_0_out_full_n : IN STD_LOGIC;
    kernel_val_1_V_0_out_write : OUT STD_LOGIC;
    kernel_val_1_V_1_out_din : OUT STD_LOGIC_VECTOR (7 downto 0);
    kernel_val_1_V_1_out_full_n : IN STD_LOGIC;
    kernel_val_1_V_1_out_write : OUT STD_LOGIC;
    kernel_val_1_V_2_out_din : OUT STD_LOGIC_VECTOR (7 downto 0);
    kernel_val_1_V_2_out_full_n : IN STD_LOGIC;
    kernel_val_1_V_2_out_write : OUT STD_LOGIC;
    kernel_val_2_V_0_out_din : OUT STD_LOGIC_VECTOR (7 downto 0);
    kernel_val_2_V_0_out_full_n : IN STD_LOGIC;
    kernel_val_2_V_0_out_write : OUT STD_LOGIC;
    kernel_val_2_V_1_out_din : OUT STD_LOGIC_VECTOR (7 downto 0);
    kernel_val_2_V_1_out_full_n : IN STD_LOGIC;
    kernel_val_2_V_1_out_write : OUT STD_LOGIC;
    kernel_val_2_V_2_out_din : OUT STD_LOGIC_VECTOR (7 downto 0);
    kernel_val_2_V_2_out_full_n : IN STD_LOGIC;
    kernel_val_2_V_2_out_write : OUT STD_LOGIC );
end;


architecture behav of Block_proc is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv32_8 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001000";
    constant ap_const_lv32_F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001111";
    constant ap_const_lv32_10 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010000";
    constant ap_const_lv32_17 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010111";
    constant ap_const_boolean_1 : BOOLEAN := true;

    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_CS_fsm : STD_LOGIC_VECTOR (0 downto 0) := "1";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal kernel_val_0_V_0_out_blk_n : STD_LOGIC;
    signal kernel_val_0_V_1_out_blk_n : STD_LOGIC;
    signal kernel_val_0_V_2_out_blk_n : STD_LOGIC;
    signal kernel_val_1_V_0_out_blk_n : STD_LOGIC;
    signal kernel_val_1_V_1_out_blk_n : STD_LOGIC;
    signal kernel_val_1_V_2_out_blk_n : STD_LOGIC;
    signal kernel_val_2_V_0_out_blk_n : STD_LOGIC;
    signal kernel_val_2_V_1_out_blk_n : STD_LOGIC;
    signal kernel_val_2_V_2_out_blk_n : STD_LOGIC;
    signal ap_block_state1 : BOOLEAN;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (0 downto 0);


begin




    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_state1;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    ap_done_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_done_reg <= ap_const_logic_0;
            else
                if ((ap_continue = ap_const_logic_1)) then 
                    ap_done_reg <= ap_const_logic_0;
                elsif ((not(((kernel_val_2_V_2_out_full_n = ap_const_logic_0) or (ap_start = ap_const_logic_0) or (kernel_val_2_V_1_out_full_n = ap_const_logic_0) or (kernel_val_2_V_0_out_full_n = ap_const_logic_0) or (kernel_val_1_V_2_out_full_n = ap_const_logic_0) or (kernel_val_1_V_1_out_full_n = ap_const_logic_0) or (kernel_val_1_V_0_out_full_n = ap_const_logic_0) or (kernel_val_0_V_2_out_full_n = ap_const_logic_0) or (kernel_val_0_V_1_out_full_n = ap_const_logic_0) or (kernel_val_0_V_0_out_full_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    ap_NS_fsm_assign_proc : process (ap_start, ap_done_reg, ap_CS_fsm, ap_CS_fsm_state1, kernel_val_0_V_0_out_full_n, kernel_val_0_V_1_out_full_n, kernel_val_0_V_2_out_full_n, kernel_val_1_V_0_out_full_n, kernel_val_1_V_1_out_full_n, kernel_val_1_V_2_out_full_n, kernel_val_2_V_0_out_full_n, kernel_val_2_V_1_out_full_n, kernel_val_2_V_2_out_full_n)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                ap_NS_fsm <= ap_ST_fsm_state1;
            when others =>  
                ap_NS_fsm <= "X";
        end case;
    end process;
    ap_CS_fsm_state1 <= ap_CS_fsm(0);

    ap_block_state1_assign_proc : process(ap_start, ap_done_reg, kernel_val_0_V_0_out_full_n, kernel_val_0_V_1_out_full_n, kernel_val_0_V_2_out_full_n, kernel_val_1_V_0_out_full_n, kernel_val_1_V_1_out_full_n, kernel_val_1_V_2_out_full_n, kernel_val_2_V_0_out_full_n, kernel_val_2_V_1_out_full_n, kernel_val_2_V_2_out_full_n)
    begin
                ap_block_state1 <= ((kernel_val_2_V_2_out_full_n = ap_const_logic_0) or (ap_start = ap_const_logic_0) or (kernel_val_2_V_1_out_full_n = ap_const_logic_0) or (kernel_val_2_V_0_out_full_n = ap_const_logic_0) or (kernel_val_1_V_2_out_full_n = ap_const_logic_0) or (kernel_val_1_V_1_out_full_n = ap_const_logic_0) or (kernel_val_1_V_0_out_full_n = ap_const_logic_0) or (kernel_val_0_V_2_out_full_n = ap_const_logic_0) or (kernel_val_0_V_1_out_full_n = ap_const_logic_0) or (kernel_val_0_V_0_out_full_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1));
    end process;


    ap_done_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, kernel_val_0_V_0_out_full_n, kernel_val_0_V_1_out_full_n, kernel_val_0_V_2_out_full_n, kernel_val_1_V_0_out_full_n, kernel_val_1_V_1_out_full_n, kernel_val_1_V_2_out_full_n, kernel_val_2_V_0_out_full_n, kernel_val_2_V_1_out_full_n, kernel_val_2_V_2_out_full_n)
    begin
        if ((not(((kernel_val_2_V_2_out_full_n = ap_const_logic_0) or (ap_start = ap_const_logic_0) or (kernel_val_2_V_1_out_full_n = ap_const_logic_0) or (kernel_val_2_V_0_out_full_n = ap_const_logic_0) or (kernel_val_1_V_2_out_full_n = ap_const_logic_0) or (kernel_val_1_V_1_out_full_n = ap_const_logic_0) or (kernel_val_1_V_0_out_full_n = ap_const_logic_0) or (kernel_val_0_V_2_out_full_n = ap_const_logic_0) or (kernel_val_0_V_1_out_full_n = ap_const_logic_0) or (kernel_val_0_V_0_out_full_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_done_reg;
        end if; 
    end process;


    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_start = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_ready_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, kernel_val_0_V_0_out_full_n, kernel_val_0_V_1_out_full_n, kernel_val_0_V_2_out_full_n, kernel_val_1_V_0_out_full_n, kernel_val_1_V_1_out_full_n, kernel_val_1_V_2_out_full_n, kernel_val_2_V_0_out_full_n, kernel_val_2_V_1_out_full_n, kernel_val_2_V_2_out_full_n)
    begin
        if ((not(((kernel_val_2_V_2_out_full_n = ap_const_logic_0) or (ap_start = ap_const_logic_0) or (kernel_val_2_V_1_out_full_n = ap_const_logic_0) or (kernel_val_2_V_0_out_full_n = ap_const_logic_0) or (kernel_val_1_V_2_out_full_n = ap_const_logic_0) or (kernel_val_1_V_1_out_full_n = ap_const_logic_0) or (kernel_val_1_V_0_out_full_n = ap_const_logic_0) or (kernel_val_0_V_2_out_full_n = ap_const_logic_0) or (kernel_val_0_V_1_out_full_n = ap_const_logic_0) or (kernel_val_0_V_0_out_full_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    kernel_val_0_V_0_out_blk_n_assign_proc : process(ap_CS_fsm_state1, kernel_val_0_V_0_out_full_n)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state1)) then 
            kernel_val_0_V_0_out_blk_n <= kernel_val_0_V_0_out_full_n;
        else 
            kernel_val_0_V_0_out_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    kernel_val_0_V_0_out_din <= r1_V(8 - 1 downto 0);

    kernel_val_0_V_0_out_write_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, kernel_val_0_V_0_out_full_n, kernel_val_0_V_1_out_full_n, kernel_val_0_V_2_out_full_n, kernel_val_1_V_0_out_full_n, kernel_val_1_V_1_out_full_n, kernel_val_1_V_2_out_full_n, kernel_val_2_V_0_out_full_n, kernel_val_2_V_1_out_full_n, kernel_val_2_V_2_out_full_n)
    begin
        if ((not(((kernel_val_2_V_2_out_full_n = ap_const_logic_0) or (ap_start = ap_const_logic_0) or (kernel_val_2_V_1_out_full_n = ap_const_logic_0) or (kernel_val_2_V_0_out_full_n = ap_const_logic_0) or (kernel_val_1_V_2_out_full_n = ap_const_logic_0) or (kernel_val_1_V_1_out_full_n = ap_const_logic_0) or (kernel_val_1_V_0_out_full_n = ap_const_logic_0) or (kernel_val_0_V_2_out_full_n = ap_const_logic_0) or (kernel_val_0_V_1_out_full_n = ap_const_logic_0) or (kernel_val_0_V_0_out_full_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            kernel_val_0_V_0_out_write <= ap_const_logic_1;
        else 
            kernel_val_0_V_0_out_write <= ap_const_logic_0;
        end if; 
    end process;


    kernel_val_0_V_1_out_blk_n_assign_proc : process(ap_CS_fsm_state1, kernel_val_0_V_1_out_full_n)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state1)) then 
            kernel_val_0_V_1_out_blk_n <= kernel_val_0_V_1_out_full_n;
        else 
            kernel_val_0_V_1_out_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    kernel_val_0_V_1_out_din <= r1_V(15 downto 8);

    kernel_val_0_V_1_out_write_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, kernel_val_0_V_0_out_full_n, kernel_val_0_V_1_out_full_n, kernel_val_0_V_2_out_full_n, kernel_val_1_V_0_out_full_n, kernel_val_1_V_1_out_full_n, kernel_val_1_V_2_out_full_n, kernel_val_2_V_0_out_full_n, kernel_val_2_V_1_out_full_n, kernel_val_2_V_2_out_full_n)
    begin
        if ((not(((kernel_val_2_V_2_out_full_n = ap_const_logic_0) or (ap_start = ap_const_logic_0) or (kernel_val_2_V_1_out_full_n = ap_const_logic_0) or (kernel_val_2_V_0_out_full_n = ap_const_logic_0) or (kernel_val_1_V_2_out_full_n = ap_const_logic_0) or (kernel_val_1_V_1_out_full_n = ap_const_logic_0) or (kernel_val_1_V_0_out_full_n = ap_const_logic_0) or (kernel_val_0_V_2_out_full_n = ap_const_logic_0) or (kernel_val_0_V_1_out_full_n = ap_const_logic_0) or (kernel_val_0_V_0_out_full_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            kernel_val_0_V_1_out_write <= ap_const_logic_1;
        else 
            kernel_val_0_V_1_out_write <= ap_const_logic_0;
        end if; 
    end process;


    kernel_val_0_V_2_out_blk_n_assign_proc : process(ap_CS_fsm_state1, kernel_val_0_V_2_out_full_n)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state1)) then 
            kernel_val_0_V_2_out_blk_n <= kernel_val_0_V_2_out_full_n;
        else 
            kernel_val_0_V_2_out_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    kernel_val_0_V_2_out_din <= r1_V(23 downto 16);

    kernel_val_0_V_2_out_write_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, kernel_val_0_V_0_out_full_n, kernel_val_0_V_1_out_full_n, kernel_val_0_V_2_out_full_n, kernel_val_1_V_0_out_full_n, kernel_val_1_V_1_out_full_n, kernel_val_1_V_2_out_full_n, kernel_val_2_V_0_out_full_n, kernel_val_2_V_1_out_full_n, kernel_val_2_V_2_out_full_n)
    begin
        if ((not(((kernel_val_2_V_2_out_full_n = ap_const_logic_0) or (ap_start = ap_const_logic_0) or (kernel_val_2_V_1_out_full_n = ap_const_logic_0) or (kernel_val_2_V_0_out_full_n = ap_const_logic_0) or (kernel_val_1_V_2_out_full_n = ap_const_logic_0) or (kernel_val_1_V_1_out_full_n = ap_const_logic_0) or (kernel_val_1_V_0_out_full_n = ap_const_logic_0) or (kernel_val_0_V_2_out_full_n = ap_const_logic_0) or (kernel_val_0_V_1_out_full_n = ap_const_logic_0) or (kernel_val_0_V_0_out_full_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            kernel_val_0_V_2_out_write <= ap_const_logic_1;
        else 
            kernel_val_0_V_2_out_write <= ap_const_logic_0;
        end if; 
    end process;


    kernel_val_1_V_0_out_blk_n_assign_proc : process(ap_CS_fsm_state1, kernel_val_1_V_0_out_full_n)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state1)) then 
            kernel_val_1_V_0_out_blk_n <= kernel_val_1_V_0_out_full_n;
        else 
            kernel_val_1_V_0_out_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    kernel_val_1_V_0_out_din <= r2_V(8 - 1 downto 0);

    kernel_val_1_V_0_out_write_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, kernel_val_0_V_0_out_full_n, kernel_val_0_V_1_out_full_n, kernel_val_0_V_2_out_full_n, kernel_val_1_V_0_out_full_n, kernel_val_1_V_1_out_full_n, kernel_val_1_V_2_out_full_n, kernel_val_2_V_0_out_full_n, kernel_val_2_V_1_out_full_n, kernel_val_2_V_2_out_full_n)
    begin
        if ((not(((kernel_val_2_V_2_out_full_n = ap_const_logic_0) or (ap_start = ap_const_logic_0) or (kernel_val_2_V_1_out_full_n = ap_const_logic_0) or (kernel_val_2_V_0_out_full_n = ap_const_logic_0) or (kernel_val_1_V_2_out_full_n = ap_const_logic_0) or (kernel_val_1_V_1_out_full_n = ap_const_logic_0) or (kernel_val_1_V_0_out_full_n = ap_const_logic_0) or (kernel_val_0_V_2_out_full_n = ap_const_logic_0) or (kernel_val_0_V_1_out_full_n = ap_const_logic_0) or (kernel_val_0_V_0_out_full_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            kernel_val_1_V_0_out_write <= ap_const_logic_1;
        else 
            kernel_val_1_V_0_out_write <= ap_const_logic_0;
        end if; 
    end process;


    kernel_val_1_V_1_out_blk_n_assign_proc : process(ap_CS_fsm_state1, kernel_val_1_V_1_out_full_n)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state1)) then 
            kernel_val_1_V_1_out_blk_n <= kernel_val_1_V_1_out_full_n;
        else 
            kernel_val_1_V_1_out_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    kernel_val_1_V_1_out_din <= r2_V(15 downto 8);

    kernel_val_1_V_1_out_write_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, kernel_val_0_V_0_out_full_n, kernel_val_0_V_1_out_full_n, kernel_val_0_V_2_out_full_n, kernel_val_1_V_0_out_full_n, kernel_val_1_V_1_out_full_n, kernel_val_1_V_2_out_full_n, kernel_val_2_V_0_out_full_n, kernel_val_2_V_1_out_full_n, kernel_val_2_V_2_out_full_n)
    begin
        if ((not(((kernel_val_2_V_2_out_full_n = ap_const_logic_0) or (ap_start = ap_const_logic_0) or (kernel_val_2_V_1_out_full_n = ap_const_logic_0) or (kernel_val_2_V_0_out_full_n = ap_const_logic_0) or (kernel_val_1_V_2_out_full_n = ap_const_logic_0) or (kernel_val_1_V_1_out_full_n = ap_const_logic_0) or (kernel_val_1_V_0_out_full_n = ap_const_logic_0) or (kernel_val_0_V_2_out_full_n = ap_const_logic_0) or (kernel_val_0_V_1_out_full_n = ap_const_logic_0) or (kernel_val_0_V_0_out_full_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            kernel_val_1_V_1_out_write <= ap_const_logic_1;
        else 
            kernel_val_1_V_1_out_write <= ap_const_logic_0;
        end if; 
    end process;


    kernel_val_1_V_2_out_blk_n_assign_proc : process(ap_CS_fsm_state1, kernel_val_1_V_2_out_full_n)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state1)) then 
            kernel_val_1_V_2_out_blk_n <= kernel_val_1_V_2_out_full_n;
        else 
            kernel_val_1_V_2_out_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    kernel_val_1_V_2_out_din <= r2_V(23 downto 16);

    kernel_val_1_V_2_out_write_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, kernel_val_0_V_0_out_full_n, kernel_val_0_V_1_out_full_n, kernel_val_0_V_2_out_full_n, kernel_val_1_V_0_out_full_n, kernel_val_1_V_1_out_full_n, kernel_val_1_V_2_out_full_n, kernel_val_2_V_0_out_full_n, kernel_val_2_V_1_out_full_n, kernel_val_2_V_2_out_full_n)
    begin
        if ((not(((kernel_val_2_V_2_out_full_n = ap_const_logic_0) or (ap_start = ap_const_logic_0) or (kernel_val_2_V_1_out_full_n = ap_const_logic_0) or (kernel_val_2_V_0_out_full_n = ap_const_logic_0) or (kernel_val_1_V_2_out_full_n = ap_const_logic_0) or (kernel_val_1_V_1_out_full_n = ap_const_logic_0) or (kernel_val_1_V_0_out_full_n = ap_const_logic_0) or (kernel_val_0_V_2_out_full_n = ap_const_logic_0) or (kernel_val_0_V_1_out_full_n = ap_const_logic_0) or (kernel_val_0_V_0_out_full_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            kernel_val_1_V_2_out_write <= ap_const_logic_1;
        else 
            kernel_val_1_V_2_out_write <= ap_const_logic_0;
        end if; 
    end process;


    kernel_val_2_V_0_out_blk_n_assign_proc : process(ap_CS_fsm_state1, kernel_val_2_V_0_out_full_n)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state1)) then 
            kernel_val_2_V_0_out_blk_n <= kernel_val_2_V_0_out_full_n;
        else 
            kernel_val_2_V_0_out_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    kernel_val_2_V_0_out_din <= r3_V(8 - 1 downto 0);

    kernel_val_2_V_0_out_write_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, kernel_val_0_V_0_out_full_n, kernel_val_0_V_1_out_full_n, kernel_val_0_V_2_out_full_n, kernel_val_1_V_0_out_full_n, kernel_val_1_V_1_out_full_n, kernel_val_1_V_2_out_full_n, kernel_val_2_V_0_out_full_n, kernel_val_2_V_1_out_full_n, kernel_val_2_V_2_out_full_n)
    begin
        if ((not(((kernel_val_2_V_2_out_full_n = ap_const_logic_0) or (ap_start = ap_const_logic_0) or (kernel_val_2_V_1_out_full_n = ap_const_logic_0) or (kernel_val_2_V_0_out_full_n = ap_const_logic_0) or (kernel_val_1_V_2_out_full_n = ap_const_logic_0) or (kernel_val_1_V_1_out_full_n = ap_const_logic_0) or (kernel_val_1_V_0_out_full_n = ap_const_logic_0) or (kernel_val_0_V_2_out_full_n = ap_const_logic_0) or (kernel_val_0_V_1_out_full_n = ap_const_logic_0) or (kernel_val_0_V_0_out_full_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            kernel_val_2_V_0_out_write <= ap_const_logic_1;
        else 
            kernel_val_2_V_0_out_write <= ap_const_logic_0;
        end if; 
    end process;


    kernel_val_2_V_1_out_blk_n_assign_proc : process(ap_CS_fsm_state1, kernel_val_2_V_1_out_full_n)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state1)) then 
            kernel_val_2_V_1_out_blk_n <= kernel_val_2_V_1_out_full_n;
        else 
            kernel_val_2_V_1_out_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    kernel_val_2_V_1_out_din <= r3_V(15 downto 8);

    kernel_val_2_V_1_out_write_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, kernel_val_0_V_0_out_full_n, kernel_val_0_V_1_out_full_n, kernel_val_0_V_2_out_full_n, kernel_val_1_V_0_out_full_n, kernel_val_1_V_1_out_full_n, kernel_val_1_V_2_out_full_n, kernel_val_2_V_0_out_full_n, kernel_val_2_V_1_out_full_n, kernel_val_2_V_2_out_full_n)
    begin
        if ((not(((kernel_val_2_V_2_out_full_n = ap_const_logic_0) or (ap_start = ap_const_logic_0) or (kernel_val_2_V_1_out_full_n = ap_const_logic_0) or (kernel_val_2_V_0_out_full_n = ap_const_logic_0) or (kernel_val_1_V_2_out_full_n = ap_const_logic_0) or (kernel_val_1_V_1_out_full_n = ap_const_logic_0) or (kernel_val_1_V_0_out_full_n = ap_const_logic_0) or (kernel_val_0_V_2_out_full_n = ap_const_logic_0) or (kernel_val_0_V_1_out_full_n = ap_const_logic_0) or (kernel_val_0_V_0_out_full_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            kernel_val_2_V_1_out_write <= ap_const_logic_1;
        else 
            kernel_val_2_V_1_out_write <= ap_const_logic_0;
        end if; 
    end process;


    kernel_val_2_V_2_out_blk_n_assign_proc : process(ap_CS_fsm_state1, kernel_val_2_V_2_out_full_n)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state1)) then 
            kernel_val_2_V_2_out_blk_n <= kernel_val_2_V_2_out_full_n;
        else 
            kernel_val_2_V_2_out_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    kernel_val_2_V_2_out_din <= r3_V(23 downto 16);

    kernel_val_2_V_2_out_write_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, kernel_val_0_V_0_out_full_n, kernel_val_0_V_1_out_full_n, kernel_val_0_V_2_out_full_n, kernel_val_1_V_0_out_full_n, kernel_val_1_V_1_out_full_n, kernel_val_1_V_2_out_full_n, kernel_val_2_V_0_out_full_n, kernel_val_2_V_1_out_full_n, kernel_val_2_V_2_out_full_n)
    begin
        if ((not(((kernel_val_2_V_2_out_full_n = ap_const_logic_0) or (ap_start = ap_const_logic_0) or (kernel_val_2_V_1_out_full_n = ap_const_logic_0) or (kernel_val_2_V_0_out_full_n = ap_const_logic_0) or (kernel_val_1_V_2_out_full_n = ap_const_logic_0) or (kernel_val_1_V_1_out_full_n = ap_const_logic_0) or (kernel_val_1_V_0_out_full_n = ap_const_logic_0) or (kernel_val_0_V_2_out_full_n = ap_const_logic_0) or (kernel_val_0_V_1_out_full_n = ap_const_logic_0) or (kernel_val_0_V_0_out_full_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            kernel_val_2_V_2_out_write <= ap_const_logic_1;
        else 
            kernel_val_2_V_2_out_write <= ap_const_logic_0;
        end if; 
    end process;

end behav;
