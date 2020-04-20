library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity multiplexer_flags is
    port( c, v, n, z : std_logic;
          sel : in std_logic_vector(2 downto 0);
          flag : out std_logic);
end multiplexer_flags;

architecture behaviour of multiplexer_flags is

    -- Intermediate signals
    signal flags : std_logic_vector(7 downto 0);

    -- Constants
    constant gate_delay : time := 1ns;

begin

    flag <= '0' after gate_delay when sel = "000" else
            '1' after gate_delay when sel = "001" else
            c after gate_delay when sel = "010" else
            v after gate_delay when sel = "011" else
            z after gate_delay when sel = "100" else
            n after gate_delay when sel = "101" else
            not c after gate_delay when sel = "110" else
            not z after gate_delay when sel = "111";

end behaviour;
