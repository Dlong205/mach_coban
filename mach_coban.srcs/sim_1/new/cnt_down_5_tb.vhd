library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity cnt_down_5_tb is
end entity cnt_down_5_tb;

architecture Behavioral of cnt_down_5_tb is
  component cnt_down_5
    Port (
      clk : in  std_logic;
      cnt : out std_logic_vector(2 downto 0);
      Y   : out std_logic
    );
  end component;

  signal clk : std_logic := '0';
  signal cnt : std_logic_vector(2 downto 0);
  signal Y   : std_logic;
  
  -- Clock period definition
  constant clk_period : time := 10 ns;
  
begin
  -- Instantiate the Unit Under Test (UUT)
  uut: cnt_down_5 port map (
    clk => clk,
    cnt => cnt,
    Y   => Y
  );

  -- Clock process definitions
  clk_process: process
  begin
    clk <= '0';
    wait for clk_period/2;
    clk <= '1';
    wait for clk_period/2;
  end process;

  -- Stimulus process
  stim_proc: process
  begin
    -- Initialize and wait for global reset
    wait for 100 ns;
    
    -- Let the counter run through several cycles
    wait for 15 * clk_period;
    
    -- Check if the counter counts down correctly
    assert false report "Simulation completed" severity note;
    wait;
  end process;

  -- Monitoring process
  monitor_proc: process(clk)
    variable expected_cnt : integer;
  begin
    if rising_edge(clk) then
      report "Current count: " & integer'image(to_integer(unsigned(cnt))) & ", Y = " & std_logic'image(Y);
      if cnt = "001" then
        assert Y = '1' report "Y should be 1 when count is 001" severity error;
      else
        assert Y = '0' report "Y should be 0 when count is not 001" severity error;
      end if;
    end if;
  end process;

end architecture Behavioral;