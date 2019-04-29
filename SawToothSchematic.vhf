--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : SawToothSchematic.vhf
-- /___/   /\     Timestamp : 04/01/2019 10:09:43
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -intstyle ise -family spartan3e -flat -suppress -vhdl C:/Users/lab/Desktop/ucisw2-organki/SawToothSchematic.vhf -w C:/Users/lab/Desktop/ucisw2-organki/SawToothSchematic.sch
--Design Name: SawToothSchematic
--Device: spartan3e
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesized and simulated, but it should not be modified. 
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity SawToothSchematic is
   port ( CLK_IN      : in    std_logic; 
          CLR_IN      : in    std_logic; 
          PS2_Clk     : in    std_logic; 
          PS2_Data    : in    std_logic; 
          AD_CONV     : out   std_logic; 
          AMP_CS      : out   std_logic; 
          DAC_CLR     : out   std_logic; 
          DAC_CS      : out   std_logic; 
          FPGA_INIT_B : out   std_logic; 
          SF_CE0      : out   std_logic; 
          SPI_MISO    : out   std_logic; 
          SPI_MOSI    : out   std_logic; 
          SPI_SCK     : out   std_logic; 
          SPI_SS_B    : out   std_logic);
end SawToothSchematic;

architecture BEHAVIORAL of SawToothSchematic is
   signal XLXN_13        : std_logic;
   signal XLXN_14        : std_logic_vector (3 downto 0);
   signal XLXN_15        : std_logic_vector (3 downto 0);
   signal XLXN_16        : std_logic_vector (11 downto 0);
   signal XLXN_17        : std_logic_vector (3 downto 0);
   signal XLXN_44        : std_logic_vector (7 downto 0);
   signal XLXN_45        : std_logic;
   signal XLXN_46        : std_logic;
   signal SPI_MISO_DUMMY : std_logic;
   component SawToothDivider
      port ( Clk         : in    std_logic; 
             Clr         : in    std_logic; 
             FreqIN      : in    std_logic_vector (3 downto 0); 
             StartOUT    : out   std_logic; 
             CmdOUT      : out   std_logic_vector (3 downto 0); 
             AddrOUT     : out   std_logic_vector (3 downto 0); 
             SawtoothOUT : out   std_logic_vector (11 downto 0));
   end component;
   
   component DACWrite
      port ( Reset       : in    std_logic; 
             Start       : in    std_logic; 
             SPI_MISO    : in    std_logic; 
             Cmd         : in    std_logic_vector (3 downto 0); 
             Addr        : in    std_logic_vector (3 downto 0); 
             DATA        : in    std_logic_vector (11 downto 0); 
             DAC_CLR     : out   std_logic; 
             DAC_CS      : out   std_logic; 
             SPI_MOSI    : out   std_logic; 
             SPI_SCK     : out   std_logic; 
             SPI_SS_B    : out   std_logic; 
             AMP_CS      : out   std_logic; 
             AD_CONV     : out   std_logic; 
             SF_CE0      : out   std_logic; 
             FPGA_INIT_B : out   std_logic; 
             Busy        : out   std_logic; 
             Clk_50MHz   : in    std_logic; 
             Clk_Sys     : in    std_logic);
   end component;
   
   component FreqButton
      port ( Clr     : in    std_logic; 
             Clk     : in    std_logic; 
             F0      : in    std_logic; 
             K_rdy   : in    std_logic; 
             IN_klaw : in    std_logic_vector (7 downto 0); 
             FreqOUT : out   std_logic_vector (3 downto 0));
   end component;
   
   component PS2_Kbd
      port ( PS2_Clk   : in    std_logic; 
             PS2_Data  : in    std_logic; 
             Clk_50MHz : in    std_logic; 
             E0        : out   std_logic; 
             F0        : out   std_logic; 
             DO_Rdy    : out   std_logic; 
             DO        : out   std_logic_vector (7 downto 0); 
             Clk_Sys   : in    std_logic);
   end component;
   
begin
   SPI_MISO <= SPI_MISO_DUMMY;
   XLXI_1 : SawToothDivider
      port map (Clk=>CLK_IN,
                Clr=>CLR_IN,
                FreqIN(3 downto 0)=>XLXN_17(3 downto 0),
                AddrOUT(3 downto 0)=>XLXN_15(3 downto 0),
                CmdOUT(3 downto 0)=>XLXN_14(3 downto 0),
                SawtoothOUT(11 downto 0)=>XLXN_16(11 downto 0),
                StartOUT=>XLXN_13);
   
   XLXI_2 : DACWrite
      port map (Addr(3 downto 0)=>XLXN_15(3 downto 0),
                Clk_Sys=>CLK_IN,
                Clk_50MHz=>CLK_IN,
                Cmd(3 downto 0)=>XLXN_14(3 downto 0),
                DATA(11 downto 0)=>XLXN_16(11 downto 0),
                Reset=>CLR_IN,
                SPI_MISO=>SPI_MISO_DUMMY,
                Start=>XLXN_13,
                AD_CONV=>AD_CONV,
                AMP_CS=>AMP_CS,
                Busy=>open,
                DAC_CLR=>DAC_CLR,
                DAC_CS=>DAC_CS,
                FPGA_INIT_B=>FPGA_INIT_B,
                SF_CE0=>SF_CE0,
                SPI_MOSI=>SPI_MOSI,
                SPI_SCK=>SPI_SCK,
                SPI_SS_B=>SPI_SS_B);
   
   XLXI_3 : FreqButton
      port map (Clk=>CLK_IN,
                Clr=>CLR_IN,
                F0=>XLXN_45,
                IN_klaw(7 downto 0)=>XLXN_44(7 downto 0),
                K_rdy=>XLXN_46,
                FreqOUT(3 downto 0)=>XLXN_17(3 downto 0));
   
   XLXI_7 : PS2_Kbd
      port map (Clk_Sys=>CLK_IN,
                Clk_50MHz=>CLK_IN,
                PS2_Clk=>PS2_Clk,
                PS2_Data=>PS2_Data,
                DO(7 downto 0)=>XLXN_44(7 downto 0),
                DO_Rdy=>XLXN_46,
                E0=>open,
                F0=>XLXN_45);
   
end BEHAVIORAL;


