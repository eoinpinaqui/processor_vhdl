library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity multiplexer_2to8bit is
    port( sel : in std_logic;
          in0, in1 : in std_logic_vector(7 downto 0);
          z : out std_logic_vector(7 downto 0));
end multiplexer_2to8bit;

architecture behaviour of multiplexer_2to8bit is

    -- Constants
    constant gate_delay : time := 1ns;

begin

    z <= in0 after gate_delay when sel = '0' else
         in1 after gate_delay when sel = '1' else
         x"00" after gate_delay;

end behaviour;
