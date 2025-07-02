----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/02/2025 10:26:17 PM
-- Design Name: 
-- Module Name: tb_D_FF_cnt_max13 - Behavioral
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

entity tb_D_FF_cnt_max13 is
--  Port ( );
end tb_D_FF_cnt_max13;

architecture Behavioral of tb_D_FF_cnt_max13 is
        component D_FF_cnt_max13
        Port ( 
            CLK : in std_logic;
            cnt : out std_logic_vector(3 downto 0);
            Y   : out std_logic
        );
        end component;

    signal CLK : std_logic := '0';
    signal cnt : std_logic_vector(3 downto 0);
    signal Y   : std_logic;
    
    constant CLK_period : time := 10 ns;
    
    function vec_to_str(vec : std_logic_vector) return string is
        variable result : string(1 to vec'length);
    begin
        for i in vec'range loop
            result(i+1) := std_logic'image(vec(i))(2);
        end loop;
        return result;
    end function;
begin
    uut: D_FF_cnt_max13 port map (
        CLK => CLK,
        cnt => cnt,
        Y => Y
    );
    CLK_process: process
    begin
        CLK <= '0';
        wait for CLK_period/2;
        CLK <= '1';
        wait for CLK_period/2;
    end process;
    stim_proc: process
    begin
        wait for 10 ns;
        for i in 0 to 15 loop
            wait until rising_edge(CLK);
            report "Clock Cycle: " & integer'image(i) & 
                   " | cnt = " & vec_to_str(cnt) & 
                   " | Y = " & std_logic'image(Y);
            if cnt = "110" then
                assert Y = '1' 
                    report "ERROR: Y phai bang 1 khi cnt=110" 
                    severity error;
            else
                assert Y = '0' 
                    report "ERROR: Y phai bang 0 khi cnt khac 110" 
                    severity error;
            end if;
        end loop;
        report "Testbench ok" severity note;
        std.env.stop;
wait;
    end process;
end Behavioral;