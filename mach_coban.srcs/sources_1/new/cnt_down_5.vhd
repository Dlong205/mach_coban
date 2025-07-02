library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity cnt_down_5 is
    Port(
            clk: in std_logic;
            cnt: out std_logic_vector(2 downto 0);
            Y: out std_logic
            );
end cnt_down_5;
architecture Structural of cnt_down_5 is
    component JK_FF
        Port ( 
            J     : in  STD_LOGIC;
            K     : in  STD_LOGIC;
            CLK   : in  STD_LOGIC;
            Q     : buffer STD_LOGIC;
            Q_inv : buffer STD_LOGIC
        );
    end component;
    signal Q_sig: std_logic_vector( 2 downto 0 );
    signal J,K: std_logic_vector( 2 downto 0 );
    signal Q_inv_sig: std_logic_vector( 2 downto 0 );
 
begin
    J(0) <= not Q_sig(0) or not Q_sig(1);
    K(0) <= Q_sig(0);
    J(1) <= not Q_sig(0);
    K(1) <= not Q_sig(0);
    J(2) <= not Q_sig(1);
    K(2) <= not Q_sig(0);
    
   FF0: JK_FF port map (J(0), K(0), CLK, Q_sig(0), Q_inv_sig(0));
    FF1: JK_FF port map (J(1), K(1), CLK, Q_sig(1), Q_inv_sig(1));
    FF2: JK_FF port map (J(2), K(2), CLK, Q_sig(2), Q_inv_sig(2));
    
    cnt <= Q_sig;
    Y <= not Q_sig(2) and not Q_sig(1) and Q_sig(0);
end Structural;