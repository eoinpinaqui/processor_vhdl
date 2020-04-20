library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decoder_4to9 is
    port( sel : in std_logic_vector(3 downto 0);
          z : out std_logic_vector(8 downto 0));
end decoder_4to9;

architecture behaviour of decoder_4to9 is

    -- Constants
    constant gate_delay : time := 1ns;

begin

    z(0) <= (not sel(3)) and (not sel(2)) and (not sel(1)) and (not sel(0)) after gate_delay;
    z(1) <= (not sel(3)) and (not sel(2)) and (not sel(1)) and sel(0) after gate_delay;
    z(2) <= (not sel(3)) and (not sel(2)) and sel(1) and (not sel(0)) after gate_delay;
    z(3) <= (not sel(3)) and (not sel(2)) and sel(1) and sel(0) after gate_delay;
    z(4) <= (not sel(3)) and sel(2) and (not sel(1)) and (not sel(0)) after gate_delay;
    z(5) <= (not sel(3)) and sel(2) and (not sel(1)) and sel(0) after gate_delay;
    z(6) <= (not sel(3)) and sel(2) and sel(1) and (not sel(0)) after gate_delay;
    z(7) <= (not sel(3)) and sel(2) and sel(1) and sel(0) after gate_delay;
    z(8) <= sel(3) after gate_delay;

end behaviour;
