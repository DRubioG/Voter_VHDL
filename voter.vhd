library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity voter is
    generic (
        N : integer := 3
    );
    Port ( 
        a : in std_logic_vector(N-1 downto 0);
        b : in std_logic_vector(N-1 downto 0);
        c : in std_logic_vector(N-1 downto 0);
        Y : out std_logic_vector(N-1 downto 0);
        error : out std_logic
    );
end voter;

architecture arch_voter of voter is
component voter_bit is
    port(
        a_bit : in std_logic;
        b_bit : in std_logic;
        c_bit : in std_logic;
        Y_bit : out std_logic
    );
end component;

signal Y_aux : std_logic_vector(N-1 downto 0);

begin

impl_voter : for i in 0 to N-1 generate
impl_voter_bit : voter_bit
        port map(
            a_bit => a(i),
            b_bit => b(i),
            c_bit => c(i),
            Y_bit => Y_aux(i)
        );
    end generate;
    
    Y <= Y_aux;
    
    -- in case of no use, delete the following part
    process(a, b, c, Y_aux)
    begin
        error <= '0';
        if a /= b and b /= c and c/= a then
            error <= '1';
        end if;
    end process;

end arch_voter;
