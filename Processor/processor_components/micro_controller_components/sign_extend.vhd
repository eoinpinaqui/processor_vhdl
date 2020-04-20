library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sign_extend is
    port( six_bits : in std_logic_vector(5 downto 0);
          extend : out std_logic_vector(15 downto 0));
end sign_extend;

architecture behaviour of sign_extend is

    -- Constants
    constant gate_delay : time := 1ns;

begin

    extend(5 downto 0) <= six_bits after gate_delay;
    
    extend(6) <= six_bits(5) after gate_delay;
    extend(7) <= six_bits(5) after gate_delay;
    extend(8) <= six_bits(5) after gate_delay;
    extend(9) <= six_bits(5) after gate_delay;
    extend(10) <= six_bits(5) after gate_delay;
    extend(11) <= six_bits(5) after gate_delay;
    extend(12) <= six_bits(5) after gate_delay;
    extend(13) <= six_bits(5) after gate_delay;
    extend(14) <= six_bits(5) after gate_delay;
    extend(15) <= six_bits(5) after gate_delay;

end behaviour;
