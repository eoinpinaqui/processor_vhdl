library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity multiplexer_3to1bit is
    port( sel : in std_logic_vector(1 downto 0);
          in0, in1, in2 : in std_logic;
          z : out std_logic);
end multiplexer_3to1bit;

architecture behaviour of multiplexer_3to1bit is

    -- Constants
    constant gate_delay : time := 1ns;

begin

    z <= in0 after gate_delay when sel = "00" else
         in1 after gate_delay when sel = "01" else
         in2 after gate_delay when sel = "10" else
         '0' after gate_delay;

end behaviour;
