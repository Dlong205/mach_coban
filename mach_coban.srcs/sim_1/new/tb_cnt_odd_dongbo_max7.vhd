----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/02/2025 02:03:34 AM
-- Design Name: 
-- Module Name: tb_cnt_odd_dongbo_max7 - Behavioral
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

entity tb_cnt_odd_dongbo_max7 is
--  Port ( );
end tb_cnt_odd_dongbo_max7;

architecture sim of tb_cnt_odd_dongbo_max7 is
    signal CLK : std_logic := '1';
    signal cnt : std_logic_vector(2 downto 0);
    signal Y   : std_logic;
    
    constant chuky_clk: time := 10ns;
begin
    utt: entity work.cnt_odd_dongbo_max7
    port map (
                CLK => CLK,
                cnt => cnt,
                Y => Y
                );
    CLK <= not CLK after chuky_clk / 2;
   
   process
    begin
        wait until rising_edge(CLK);
        
        if cnt = "111" then
            if Y = '1' then
                report " dung cnt = 111" severity note;
            else
                report " cnt phai bang = 111" severity note;
            end if;
        end if;
        
        if cnt = "000" then
            report "tro ve 000" severity note;
        end if;
--end loop;
end process;
end sim;
