library IEEE;
use IEEE.std_logic_1164.all;

entity nand_2in is
    Port(
            a: in std_logic;
            b: in std_logic;
            c: in std_logic;
            f: out std_logic
            );
 end nand_2in;
 
 architecture Behavioral of nand_2in is
    signal nand_a, nand_bc, nand_notbnotc, nand_abc: std_logic;
 begin
    nand_a <= a nand a;
    nand_bc <= b nand c;
    nand_notbnotc <= (b nand b) nand  (c nand c);
    nand_abc <= nand_a nand nand_notbnotc;
    f <= nand_abc nand nand_bc;
end Behavioral;
