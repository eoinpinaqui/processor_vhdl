library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity arithmetic_slice_tb is
end arithmetic_slice_tb;

architecture behaviour of arithmetic_slice_tb is

    component arithmetic_slice is
        port( sel : in std_logic_vector(1 downto 0);
              a, b, carry_in : in std_logic;
              z, carry_out : out std_logic);
    end component;

    -- Input Signals
    signal sel : std_logic_vector(1 downto 0);
    signal a, b, carry_in : std_logic;
    
    -- Output Signals
    signal z, carry_out : std_logic;
    
    -- Constants
    constant clock_cycle : time := 20ns;

begin

    uut : arithmetic_slice port map( sel => sel,
                                     a => a,
                                     b => b,
                                     carry_in => carry_in,
                                     z => z,
                                     carry_out => carry_out);

    simulation : process
    begin
        a <= '0';
        b <= '0';
        carry_in <= '0';
        sel <= "00";
        wait for clock_cycle;
        sel <= "01";
        wait for clock_cycle;
        sel <= "10";
        wait for clock_cycle;
        sel <= "11";
        wait for clock_cycle;
        
        a <= '1';
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
        b <= '1';
        sel <= "00";
        wait for clock_cycle;
        sel <= "01";
        wait for clock_cycle;
        sel <= "10";
        wait for clock_cycle;
        sel <= "11";
        wait for clock_cycle;
        
        a <= '0';
        b <= '0';
        carry_in <= '1';
        sel <= "00";
        wait for clock_cycle;
        sel <= "01";
        wait for clock_cycle;
        sel <= "10";
        wait for clock_cycle;
        sel <= "11";
        wait for clock_cycle;
        
        a <= '1';
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
        b <= '1';
        sel <= "00";
        wait for clock_cycle;
        sel <= "01";
        wait for clock_cycle;
        sel <= "10";
        wait for clock_cycle;
        sel <= "11";
        wait;
    end process;

end behaviour;
