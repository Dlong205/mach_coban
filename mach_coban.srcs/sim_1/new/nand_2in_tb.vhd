library IEEE;
use IEEE.Std_logic_1164.all;

entity nand_2in_tb is
end nand_2in_tb;

architecture testbench of nand_2in_tb is
    component nand_2in
        Port (
            a : in std_logic;
            b : in std_logic;
            c : in std_logic;
            f : out std_logic
        );
    end component;

    -- Input signals
    signal a, b, c : std_logic := '0';
    
    -- Output signal
    signal f : std_logic;
    
    -- Thời gian delay giữa các test case
    constant delay_time : time := 10 ns;

begin
    -- Khởi tạo Unit Under Test (UUT)
    uut: nand_2in port map (
        a => a,
        b => b,
        c => c,
        f => f
    );

    -- Quá trình kích thích
    stimulus: process
    begin
        -- Test case 1: A=0, B=0, C=0
        a <= '0'; b <= '0'; c <= '0';
        wait for delay_time;
        assert (f = ((not '0' and '0') or ('0' and '0')))
            report "Test case 1 (000) failed" severity error;
        
        -- Test case 2: A=0, B=0, C=1
        a <= '0'; b <= '0'; c <= '1';
        wait for delay_time;
        assert (f = ((not '0' and '0') or ('0' and '1')))
            report "Test case 2 (001) failed" severity error;
        
        -- Test case 3: A=0, B=1, C=0
        a <= '0'; b <= '1'; c <= '0';
        wait for delay_time;
        assert (f = ((not '0' and '1') or ('1' and '0')))
            report "Test case 3 (010) failed" severity error;
        
        -- Test case 4: A=0, B=1, C=1
        a <= '0'; b <= '1'; c <= '1';
        wait for delay_time;
        assert (f = ((not '0' and '1') or ('1' and '1')))
            report "Test case 4 (011) failed" severity error;
        
        -- Test case 5: A=1, B=0, C=0
        a <= '1'; b <= '0'; c <= '0';
        wait for delay_time;
        assert (f = ((not '1' and '0') or ('0' and '0')))
            report "Test case 5 (100) failed" severity error;
        
        -- Test case 6: A=1, B=0, C=1
        a <= '1'; b <= '0'; c <= '1';
        wait for delay_time;
        assert (f = ((not '1' and '0') or ('0' and '1')))
            report "Test case 6 (101) failed" severity error;
        
        -- Test case 7: A=1, B=1, C=0
        a <= '1'; b <= '1'; c <= '0';
        wait for delay_time;
        assert (f = ((not '1' and '1') or ('1' and '0')))
            report "Test case 7 (110) failed" severity error;
        
        -- Test case 8: A=1, B=1, C=1
        a <= '1'; b <= '1'; c <= '1';
        wait for delay_time;
        assert (f = ((not '1' and '1') or ('1' and '1')))
            report "Test case 8 (111) failed" severity error;
        
        -- Kết thúc mô phỏng
        report "Testbench complete";
        wait;
    end process;
end testbench;