library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity processor_tb is
end processor_tb;

architecture behaviour of processor_tb is

    component processor is
        port( clk, reset : in std_logic);
    end component;
    
    -- Input Signals
    signal clk : std_logic := '0';
    signal reset : std_logic := '1';
    
    -- Constants
    constant clock_cycle : time := 64ns;
    
begin

    uut : processor port map( clk => clk,
                            reset => reset);

    clock : process
    begin
        wait for clock_cycle / 2;
        clk <= not clk;
    end process;
    
    simulation : process
    begin
        wait for clock_cycle / 3;
        reset <= '0';
        wait for 10000ns;
        std.env.stop;
        wait;
    end process;

end behaviour;
