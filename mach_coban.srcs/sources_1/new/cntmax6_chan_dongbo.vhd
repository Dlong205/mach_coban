----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/02/2025 01:16:46 AM
-- Design Name: 
-- Module Name: cntmax6_chan_dongbo - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity cntmax6_chan_dongbo is
      Port ( 
                CLK: in std_logic;
                cnt: out std_logic_vector(2 downto 0);
                Y: out std_logic
                );
end cntmax6_chan_dongbo;

architecture Behavioral of cntmax6_chan_dongbo is
    component JK_FF
            Port(
                   J: in std_logic;
                   K: in std_logic;
                   CLK: in std_logic;
                   Q : buffer std_logic;
                   Q_inv: buffer std_logic 
                    );
    end component;
        signal Q_sig : STD_LOGIC_VECTOR(2 downto 0) := "000";
        signal J, K  : STD_LOGIC_VECTOR(2 downto 0);
        signal Q_inv_sig : STD_LOGIC_VECTOR(2 downto 0);
begin
        J(0) <= '0';
        K(0) <= '1';
        J(1) <= not Q_sig(0);
        K(1) <= '1';
        J(2) <= Q_sig(1);
        K(2) <= Q_sig(1);

     FF0: JK_FF port map (J(0), K(0), CLK, Q_sig(0), Q_inv_sig(0));
    FF1: JK_FF port map (J(1), K(1), CLK, Q_sig(1), Q_inv_sig(1));
    FF2: JK_FF port map (J(2), K(2), CLK, Q_sig(2), Q_inv_sig(2));
    
    cnt <= Q_sig;
    Y <= Q_sig(2) and Q_sig(1) and not Q_sig(0);
end Behavioral;