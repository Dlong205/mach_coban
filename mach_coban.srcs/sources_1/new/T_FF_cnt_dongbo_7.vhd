library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity T_FF_cnt_dongbo_7 is
    Port (
        CLK: in std_logic;
        cnt: out std_logic_vector(2 downto 0);
        Y: out std_logic
    );
end T_FF_cnt_dongbo_7;

architecture Behavioral of T_FF_cnt_dongbo_7 is
    component T_FF
        Port (
            T   : in std_logic;
            CLK : in std_logic;
            Q   : out std_logic;
            Qn  : out std_logic
        );
    end component;

    signal Q_sig : std_logic_vector(2 downto 0) := "001";
    signal T_in  : std_logic_vector(2 downto 0);

begin
    T_in(0) <= not (not Q_sig(1) or not Q_sig(2));
    T_in(1) <= Q_sig(0) xor (Q_sig(2) or Q_sig(0));
    T_in(2) <= Q_sig(1) xor (Q_sig(1) and Q_sig(0));

    FF0: T_FF port map (T => T_in(0), CLK => CLK, Q => Q_sig(0), Qn => open);
    FF1: T_FF port map (T => T_in(1), CLK => CLK, Q => Q_sig(1), Qn => open);
    FF2: T_FF port map (T => T_in(2), CLK => CLK, Q => Q_sig(2), Qn => open);

    cnt <= Q_sig;
    Y <= Q_sig(2) and Q_sig(1) and not Q_sig(0);
end Behavioral;
