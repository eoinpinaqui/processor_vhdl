library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity b_logic_slice_tb is
end b_logic_slice_tb;

architecture behaviour of b_logic_slice_tb is

    component b_logic_slice is
        port( sel : in std_logic_vector(1 downto 0);
              b : in std_logic;
              z : out std_logic);
    end component;
    
    -- Input Signals
    signal sel : std_logic_vector(1 downto 0);
    signal b : std_logic;
    
    -- Output Signals
    signal z : std_logic;
    
    -- Constants
    constant clock_cycle : time := 20ns;

begin

    uut : b_logic_slice port map( sel => sel,
                                  b => b,
                                  z => z);

    simulation : process
    begin
        b <= '0';
        sel <= "00";
        wait for clock_cycle;
        sel <= "01";
        wait for clock_cycle;
        sel <= "10";
        wait for clock_cycle;
        sel <= "11";
        wait for clock_cycle;
        b <= '1';
        sel <= "00";
        wait for clock_cycle;
        sel <= "01";
        wait for clock_cycle;
        sel <= "10";
        wait for clock_cycle;
        sel <= "11";
        wait for clock_cycle;
    end process;
    
end behaviour;
