library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tbv_cnt_dongbo_6 is
end tbv_cnt_dongbo_6;

architecture sim of tbv_cnt_dongbo_6 is
    signal CLK : std_logic := '0';
    signal cnt : std_logic_vector(2 downto 0);
    signal Y   : std_logic;

    constant CLK_period : time := 10 ns;
begin
    -- Kết nối với module cần test
    uut: entity work.cnt_dongbo_6
        port map (
            CLK => CLK,
            cnt => cnt,
            Y   => Y
        );

    -- Tạo xung clock liên tục
    CLK <= not CLK after CLK_period / 2;

    -- Process kiểm thử liên tục
    process
    begin
        wait until rising_edge(CLK);

        -- Khi đếm đến 5 (101), kiểm tra Y
        if cnt = "101" then
            if Y = '1' then
                report " yes cnt = 101" severity note;
            else
                report "y = 1 in cnt = 101" severity error;
            end if;
        end if;

        -- Khi reset về 000, thông báo (tuỳ chọn)
        if cnt = "000" then
            report "tro ve 000" severity note;
        end if;

        -- Vòng lặp vô hạn → mô phỏng liên tục
    end process;
end sim;
