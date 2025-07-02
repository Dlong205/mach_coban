library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity T_FF is
    Port (
        T   : in  STD_LOGIC;   -- Ngõ vào toggle
        CLK : in  STD_LOGIC;   -- Xung clock
        Q   : out STD_LOGIC;   -- Ngõ ra
        Qn  : out STD_LOGIC    -- Ngõ ra đảo (tùy chọn)
    );
end T_FF;

architecture Behavioral of T_FF is
    signal q_int : STD_LOGIC := '0';  -- Tín hiệu nội bộ
begin
    process(CLK)
    begin
        if rising_edge(CLK) then
            if T = '1' then
                q_int <= not q_int;  -- Đảo trạng thái khi T=1
            end if;
        end if;
    end process;
    
    Q  <= q_int;         -- Ngõ ra thuận
    Qn <= not q_int;     -- Ngõ ra đảo
end Behavioral;