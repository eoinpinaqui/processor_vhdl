library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity logic_slice_tb is
end logic_slice_tb;

architecture behaviour of logic_slice_tb is

    component logic_slice is
        port( sel : in std_logic_vector(1 downto 0);
              a, b : in std_logic;
              z : out std_logic);
    end component;

    -- Input Signals
    signal sel : std_logic_vector(1 downto 0);
    signal a, b : std_logic;
    
    -- Output Signals
    signal z : std_logic;
    
    -- Constants
    constant clock_cycle : time := 20ns;

begin

    uut : logic_slice port map( sel => sel,
                                a => a,
                                b => b,
                                z => z);

    simulation : process
    begin
        a <= '0';
        b <= '0';
        sel <= "00";
        wait for clock_cycle;
        sel <= "01";
        wait for clock_cycle;
        sel <= "10";
        wait for clock_cycle;
        sel <= "11";
        wait for clock_cycle;
        a <= '0';
        b <= '1';
        sel <= "00";
        wait for clock_cycle;
        sel <= "01";
        wait for clock_cycle;
        sel <= "10";
        wait for clock_cycle;
        sel <= "11";
        wait for clock_cycle;
        a <= '1';
        b <= '0';
        sel <= "00";
        wait for clock_cycle;
        sel <= "01";
        wait for clock_cycle;
        sel <= "10";
        wait for clock_cycle;
        sel <= "11";
        wait for clock_cycle;
        a <= '1';
        b <= '1';
        sel <= "00";
        wait for clock_cycle;
        sel <= "01";
        wait for clock_cycle;
        sel <= "10";
        wait for clock_cycle;
        sel <= "11";
        wait for clock_cycle;
        std.env.stop;
    end process;

end behaviour;
