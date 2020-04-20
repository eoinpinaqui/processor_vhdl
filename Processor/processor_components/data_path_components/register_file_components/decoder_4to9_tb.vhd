library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decoder_4to9_tb is
end decoder_4to9_tb;

architecture behaviour of decoder_4to9_tb is

    component decoder_4to9 is
        port( sel : in std_logic_vector(3 downto 0);
              z : out std_logic_vector(8 downto 0));
    end component;

    -- Input Signals
    signal sel : std_logic_vector(3 downto 0);
    
    -- Output Signals
    signal z : std_logic_vector(8 downto 0);
    
    -- Constant
    constant clock_cycle : time := 20ns;

begin

    uut : decoder_4to9 port map( sel => sel,
                                 z => z);

    simulation : process
    begin
        sel <= "0000";
        wait for clock_cycle;
        sel <= "0001";
        wait for clock_cycle;
        sel <= "0010";
        wait for clock_cycle;
        sel <= "0011";
        wait for clock_cycle;
        sel <= "0100";
        wait for clock_cycle;
        sel <= "0101";
        wait for clock_cycle;
        sel <= "0110";
        wait for clock_cycle;
        sel <= "0111";
        wait for clock_cycle;
        sel <= "1000";
        wait for clock_cycle;
        sel <= "1001";
        wait for clock_cycle;
        sel <= "1010";
        wait for clock_cycle;
        sel <= "1011";
        wait for clock_cycle;
        sel <= "1100";
        wait for clock_cycle;
        sel <= "1101";
        wait for clock_cycle;
        sel <= "1110";
        wait for clock_cycle;
        sel <= "1111";
        wait for clock_cycle;
        std.env.stop;
    end process;


end behaviour;
