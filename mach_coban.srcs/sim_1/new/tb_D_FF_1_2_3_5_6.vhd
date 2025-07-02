library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_D_FF_1_2_3_5_6 is
end tb_D_FF_1_2_3_5_6;

architecture Behavioral of tb_D_FF_1_2_3_5_6 is
    component D_FF_1_2_3_5_6
        Port ( 
            CLK : in std_logic;
            cnt : out std_logic_vector(2 downto 0);
            Y   : out std_logic
        );
    end component;

    signal CLK : std_logic := '0';
    signal cnt : std_logic_vector(2 downto 0);
    signal Y   : std_logic;
    
    constant CLK_period : time := 10 ns;
    
    -- Hàm chuyển std_logic_vector sang string để hiển thị
    function vec_to_str(vec : std_logic_vector) return string is
        variable result : string(1 to vec'length);
    begin
        for i in vec'range loop
            result(i+1) := std_logic'image(vec(i))(2);
        end loop;
        return result;
    end function;
    
begin
    uut: D_FF_1_2_3_5_6 port map (
        CLK => CLK,
        cnt => cnt,
        Y => Y
    );

    -- Tạo xung clock
    CLK_process: process
    begin
        CLK <= '0';
        wait for CLK_period/2;
        CLK <= '1';
        wait for CLK_period/2;
    end process;

    -- Kích thích và kiểm tra
    stim_proc: process
    begin
        wait for 10 ns; -- Đợi bộ đếm khởi động
        
        -- Kiểm tra chuỗi đếm (ít nhất 2 chu kỳ đầy đủ)
        for i in 0 to 15 loop
            wait until rising_edge(CLK);
            
            -- Hiển thị trạng thái hiện tại
            report "Clock Cycle: " & integer'image(i) & 
                   " | cnt = " & vec_to_str(cnt) & 
                   " | Y = " & std_logic'image(Y);
            
            -- Kiểm tra tín hiệu Y (chỉ báo khi cnt = "110" - 6)
            if cnt = "110" then
                assert Y = '1' 
                    report "ERROR: Y phai bang 1 khi cnt=110" 
                    severity error;
            else
                assert Y = '0' 
                    report "ERROR: Y phai bang 0 khi cnt khac 110" 
                    severity error;
            end if;
        end loop;
        
        report "Testbench ok" severity note;
        std.env.stop; -- Dừng simulation (VHDL 2008)
        wait;
    end process;
end Behavioral;