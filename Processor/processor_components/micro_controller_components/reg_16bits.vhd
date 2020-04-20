library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity reg_16bits is
    port( reset, load, clk : in std_logic;
           data : in std_logic_vector(15 downto 0);
           q : out std_logic_vector(15 downto 0));
end reg_16bits;

architecture behaviour of reg_16bits is

    -- Constants
    constant gate_delay : time := 1ns;

begin

    process(reset, clk)
    begin
        if reset = '1' then
            q <= x"0000" after gate_delay;
        elsif(rising_edge(clk)) then
            if load = '1' then
                q <= data after gate_delay;
            end if;
        end if;
    end process;

end behaviour;
