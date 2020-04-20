library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity shifter_tb is
end shifter_tb;

architecture behaviour of shifter_tb is

    component shifter is
        port( sel : in std_logic_vector(1 downto 0);
              right, left : in std_logic;
              b : in std_logic_vector(15 downto 0);
              z : out std_logic_vector(15 downto 0));
    end component;

    -- Input Signals
    signal sel : std_logic_vector(1 downto 0);
    signal right, left : std_logic;
    signal b : std_logic_vector(15 downto 0);
    
    -- Output Signals
    signal z : std_logic_vector(15 downto 0);
    
    -- Constants
    constant clock_cycle : time := 20ns;

begin

    uut : shifter port map( sel => sel,
                            right => right,
                            left => left,
                            b => b,
                            z => z);

    simulation : process
    begin
        b <= x"5555";
        sel <= "00";
        right <= '0';
        left <= '0';
        wait for clock_cycle;
        sel <= "01";
        wait for clock_cycle;
        sel <= "10";
        wait for clock_cycle;
        sel <= "11";
        wait for clock_cycle;
        sel <= "00";
        right <= '1';
        left <= '1';
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
