----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/02/2025 10:10:21 PM
-- Design Name: 
-- Module Name: D_FF_cnt_max13 - Behavioral
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

entity D_FF_cnt_max13 is
        Port ( 
            CLK: in std_logic;
            cnt: out std_logic_vector( 3 downto 0 );
            Y: out std_logic
        );
end D_FF_cnt_max13;

architecture Behavioral of D_FF_cnt_max13 is
   component D_FF
      Port(
        D: in std_logic;
        CLK: in std_logic;
        Q: out std_logic;
        Qn: out std_logic
        );
     end component;
     
     signal Q_sig: std_logic_vector( 3 downto 0 );
     signal D_in: std_logic_vector( 3 downto 0 );
        
begin
        D_in(0) <= not Q_sig(1) or not Q_sig(2) or not Q_sig(3);
        D_in(1) <= not Q_sig(1) and Q_sig(0);
        D_in(2) <= Q_sig(2) xor Q_sig(1);
        D_in(3) <= (not Q_sig(3) and Q_sig(2) and Q_sig(1)) or (Q_sig(3)and (not Q_sig(1) or not Q_sig(2)));
        
    FF0: D_FF port map (D => D_in(0), CLK => CLK, Q => Q_sig(0), Qn => open);
    FF1: D_FF port map (D => D_in(1), CLK => CLK, Q => Q_sig(1), Qn => open);
    FF2: D_FF port map (D => D_in(2), CLK => CLK, Q => Q_sig(2), Qn => open);
    FF3: D_FF port map (D => D_in(3), CLK => CLK, Q => Q_sig(3), Qn => open);
    
        cnt <= Q_sig;
        Y <= Q_sig(0) and Q_sig(1) and Q_sig(2) and Q_sig(3);
end Behavioral;
