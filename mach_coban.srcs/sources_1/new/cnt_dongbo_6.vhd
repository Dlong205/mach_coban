library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity cnt_dongbo_6 is
    Port ( 
        CLK : in  STD_LOGIC;
        cnt : out STD_LOGIC_VECTOR(2 downto 0);  -- Đầu ra counter (000 → 101)
        Y   : out STD_LOGIC                      -- Báo tràn khi cnt = "101" (5)
    );
end cnt_dongbo_6;

architecture Structural of cnt_dongbo_6 is
    component JK_FF
        Port ( 
            J     : in  STD_LOGIC;
            K     : in  STD_LOGIC;
            CLK   : in  STD_LOGIC;
            Q     : buffer STD_LOGIC;
            Q_inv : buffer STD_LOGIC
        );
    end component;
    
    signal Q_sig : STD_LOGIC_VECTOR(2 downto 0) := "000";
    signal J, K  : STD_LOGIC_VECTOR(2 downto 0);
    signal Q_inv_sig : STD_LOGIC_VECTOR(2 downto 0);
    
begin
    -- Bit 0 (LSB): Toggle mỗi chu kỳ clock
    J(0) <= '1';
    K(0) <= '1';
    
    -- Bit 1: Bật khi Q0=1 và Q2=0, tắt khi Q0=1
    J(1) <= Q_sig(0) and not Q_sig(2);
    K(1) <= Q_sig(0);
    
    -- Bit 2 (MSB): Bật khi Q1=Q0=1, tắt khi Q1=Q0=1
    J(2) <= Q_sig(1) and Q_sig(0);
    K(2) <= Q_sig(0);
       
    FF0: JK_FF port map (J(0), K(0), CLK, Q_sig(0), Q_inv_sig(0));
    FF1: JK_FF port map (J(1), K(1), CLK, Q_sig(1), Q_inv_sig(1));
    FF2: JK_FF port map (J(2), K(2), CLK, Q_sig(2), Q_inv_sig(2));

    cnt <= Q_sig;
    Y <= Q_sig(2) and not Q_sig(1) and Q_sig(0); -- Phát hiện "101"
end Structural;