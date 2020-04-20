library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity alu_tb is
end alu_tb;

architecture behaviour of alu_tb is

    component alu is
        port( sel : in std_logic_vector(2 downto 0);
              a, b : std_logic_vector(15 downto 0);
              carry_in : in std_logic;
              g : out std_logic_vector(15 downto 0);
              carry_out, v : out std_logic);
    end component;

    -- Input Signals
    signal sel : std_logic_vector(2 downto 0);
    signal a, b : std_logic_vector(15 downto 0);
    signal carry_in : std_logic;
    
    -- Output Signals
    signal g : std_logic_vector(15 downto 0);
    signal carry_out, v : std_logic;

    -- Constants
    constant clock_cycle : time := 50ns;

begin

    uut : alu port map( sel => sel,
                        a => a,
                        b => b,
                        carry_in => carry_in,
                        g => g,
                        carry_out => carry_out,
                        v => v);

    simulation : process
    begin
        a <= x"555F";
        b <= x"AAAF";
        carry_in <= '0';
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
        
        carry_in <= '1';
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
        wait;
    end process;

end behaviour;
