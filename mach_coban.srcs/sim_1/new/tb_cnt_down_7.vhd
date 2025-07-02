library IEEE;
use ieee.std_logic_1164.all;

entity tb_cnt_down_7 is
end tb_cnt_down_7;

architecture sim of tb_cnt_down_7 is
    signal CLK : std_logic := '1';
    signal cnt : std_logic_vector(2 downto 0);
    signal Y   : std_logic;
    
    constant chuky_clk: time := 10ns;
begin
    utt: entity work.cnt_down_7
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
