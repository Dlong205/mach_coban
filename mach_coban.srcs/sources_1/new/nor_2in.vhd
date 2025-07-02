----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/01/2025 06:43:51 PM
-- Design Name: 
-- Module Name: nor_2in - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity nor_2in is
     Port ( 
            a: in std_logic;
            b: in std_logic;
            c: in std_logic;
            f: out std_logic
            );
end nor_2in;

architecture Behavioral of nor_2in is
       signal nor_ab, nor_ac, nor_bc: std_logic;
begin
    nor_ab <= a nor (b nor b);
    nor_ac <= a nor (c nor c);
    nor_bc <= (b nor b) nor (c nor c);
    f <= (((nor_ab nor nor_ac) nor (nor_ab nor nor_ac)) nor nor_bc) nor (((nor_ab nor nor_ac) nor (nor_ab nor nor_ac)) nor nor_bc);
end Behavioral;
