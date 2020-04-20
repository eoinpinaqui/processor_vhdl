library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity multiplexer_flags_tb is
end multiplexer_flags_tb;

architecture behaviour of multiplexer_flags_tb is

    component multiplexer_flags is
        port( c, v, n, z : std_logic;
              sel : in std_logic_vector(2 downto 0);
              flag : out std_logic);
    end component;

    -- Input Signals
    signal c, v, n, z : std_logic;
    signal sel : std_logic_vector(2 downto 0);
    
    -- Output Signals
    signal flag : std_logic;
    
    --Constants
    constant clock_cycle : time := 20ns;

begin

    uut : multiplexer_flags port map( c => c,
                                     v => v,
                                     n => n,
                                     z => z,
                                     sel => sel,
                                     flag => flag);

    simulation : process
    begin
        c <= '1';
        v <= '0';
        n <= '1';
        z <= '0';
        wait for clock_cycle;
        sel <= "000";
        wait for clock_cycle;
        sel <= "001";
        wait for clock_cycle;
        sel <= "010";
        wait for clock_cycle;
        sel <= "011";
        wait for clock_cycle;
        sel <= "100";
        wait for clock_cycle;
        sel <= "101";
        wait for clock_cycle;
        sel <= "110";
        wait for clock_cycle;
        sel <= "111";
        wait for clock_cycle;
        std.env.stop;
    end process;

end behaviour;
