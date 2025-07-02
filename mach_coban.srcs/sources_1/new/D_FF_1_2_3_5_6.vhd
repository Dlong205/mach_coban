library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity D_FF_1_2_3_5_6 is
    Port ( 
        CLK : in std_logic;
        cnt : out std_logic_vector(2 downto 0);
        Y   : out std_logic
    );
end D_FF_1_2_3_5_6;

architecture Behavioral of D_FF_1_2_3_5_6 is
    component D_FF
        Port(
            D   : in std_logic;
            CLK : in std_logic;
            Q   : out std_logic;
            Qn  : out std_logic  
        );
    end component;
    
    signal Q_sig : std_logic_vector(2 downto 0) := "001"; -- Khởi tạo tại 1 (001)
    signal D_in  : std_logic_vector(2 downto 0);
begin
    -- Logic điều khiển mới cho chuỗi 1-2-3-5-6
    D_in(0) <= (not Q_sig(2) and not Q_sig(1) and Q_sig(0)) -- 001 -> 010
         or (not Q_sig(2) and Q_sig(1) and not Q_sig(0)) -- 010 -> 011
         or (Q_sig(2) and not Q_sig(1) and Q_sig(0));    -- 101 -> 110

D_in(1) <= (not Q_sig(2) and not Q_sig(1) and Q_sig(0)) -- 001 -> 010
         or (not Q_sig(2) and Q_sig(1) and not Q_sig(0)) -- 010 -> 011
         or (Q_sig(2) and Q_sig(1) and not Q_sig(0));    -- 110 -> 001

D_in(2) <= (not Q_sig(2) and Q_sig(1) and Q_sig(0))     -- 011 -> 101
         or (Q_sig(2) and not Q_sig(1) and Q_sig(0));   -- 101 -> 110
          -- 6→1 (reset Q2=0)
    
    -- Instantiation các D Flip-Flop
    FF0: D_FF port map (D => D_in(0), CLK => CLK, Q => Q_sig(0), Qn => open);
    FF1: D_FF port map (D => D_in(1), CLK => CLK, Q => Q_sig(1), Qn => open);
    FF2: D_FF port map (D => D_in(2), CLK => CLK, Q => Q_sig(2), Qn => open);
    
    cnt <= Q_sig;
    -- Y báo hiệu khi ở trạng thái 6 (110)
    Y <= Q_sig(2) and Q_sig(1) and not Q_sig(0); 
end Behavioral;