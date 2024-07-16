library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;

entity voter_bit is
    port(
        a_bit : in std_logic;
        b_bit : in std_logic;
        c_bit : in std_logic;
        Y_bit : out std_logic
    );
end entity;

architecture arch_voter_bit of voter_bit is

signal out1, out2, out3 : std_logic;
signal out_array : std_logic_vector(2 downto 0);

begin

    out1 <= a_bit nand b_bit;
    out2 <= b_bit nand c_bit;
    out3 <= c_bit nand a_bit;

    out_array <= out1 & out2 & out3;

    Y_bit <= nand_reduce( out_array );

end architecture;