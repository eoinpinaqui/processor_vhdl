library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity multiplexer_2to1bit is
    port( sel, in0, in1 : std_logic;
          z : out std_logic);
end multiplexer_2to1bit;

architecture behaviour of multiplexer_2to1bit is

    -- Constants
    constant gate_delay : time := 1ns;

begin

    z <= in0 after gate_delay when sel = '0' else
         in1 after gate_delay when sel = '1' else
         '0' after gate_delay;

end behaviour;
