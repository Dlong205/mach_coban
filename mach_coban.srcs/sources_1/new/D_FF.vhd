library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity D_FF is
    Port (
        D   : in  STD_LOGIC;   -- Ngõ vào dữ liệu
        CLK : in  STD_LOGIC;   -- Xung clock
        Q   : out STD_LOGIC;    -- Ngõ ra
        Qn  : out STD_LOGIC     -- Ngõ ra đảo (tùy chọn)
    );
end D_FF;

architecture Behavioral of D_FF is
    signal q_int : STD_LOGIC := '0';  -- Tín hiệu nội bộ
begin
    process(CLK)
    begin
        if rising_edge(CLK) then
            q_int <= D;  -- Lấy mẫu ngõ vào D tại cạnh lên của clock
        end if;
    end process;
    
    Q  <= q_int;         -- Ngõ ra thuận
    Qn <= not q_int;     -- Ngõ ra đảo
end Behavioral;