library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity multiplexer_9to16bit is
    port( sel : in std_logic_vector(3 downto 0);
          in0, in1, in2, in3, in4, in5, in6, in7, in8 : in std_logic_vector(15 downto 0);
          z : out std_logic_vector(15 downto 0));
end multiplexer_9to16bit;

architecture behaviour of multiplexer_9to16bit is

    -- Constants
    constant gate_delay : time := 1ns;

begin

    z <= in0 after gate_delay when sel = "0000" else
         in1 after gate_delay when sel = "0001" else
         in2 after gate_delay when sel = "0010" else
         in3 after gate_delay when sel = "0011" else
         in4 after gate_delay when sel = "0100" else
         in5 after gate_delay when sel = "0101" else
         in6 after gate_delay when sel = "0110" else
         in7 after gate_delay when sel = "0111" else
         in8 after gate_delay when sel(3) = '1' else
         x"0000" after gate_delay;

end behaviour;
