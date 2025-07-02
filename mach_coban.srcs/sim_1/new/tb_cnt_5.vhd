library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity cnt_5_tb is
end cnt_5_tb;

architecture sim of cnt_5_tb is
    -- Constants
    constant CLK_PERIOD : time := 10 ns;  -- Chu kỳ clock 10ns (100MHz)
    
    -- Signals
    signal CLK       : STD_LOGIC := '0';
    signal cnt       : STD_LOGIC_VECTOR(2 downto 0);
    signal carry_out : STD_LOGIC;
    
    -- Component Declaration
    component cnt_5
        Port ( 
            CLK       : in  STD_LOGIC;
            cnt       : out STD_LOGIC_VECTOR(2 downto 0);
            carry_out : out STD_LOGIC
        );
    end component;

begin
    -- Instantiation
    UUT: cnt_5
        port map (
            CLK       => CLK,
            cnt       => cnt,
            carry_out => carry_out
        );

    -- Clock Generation Process (vòng lặp vô hạn)
    clk_process: process
    begin
        while true loop
            CLK <= '0';
            wait for CLK_PERIOD / 2;
            CLK <= '1';
            wait for CLK_PERIOD / 2;
        end loop;
    end process;

    -- Stimulus Process (kết thúc sau 100ns)
    stim_proc: process
    begin
        wait for 100 ns;  -- Chạy mô phỏng trong 100ns
        report "Simulation completed after 100ns";
        std.env.finish;    -- Kết thúc mô phỏng (VHDL-2008)
        -- Nếu dùng VHDL cũ hơn thay bằng: wait;
    end process;
end sim;