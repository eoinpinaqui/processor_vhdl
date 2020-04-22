library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity multiplexer_3to1bit_tb is
end multiplexer_3to1bit_tb;

architecture behaviour of multiplexer_3to1bit_tb is

    component multiplexer_3to1bit is
        port( sel : in std_logic_vector(1 downto 0);
              in0, in1, in2 : in std_logic;
              z : out std_logic);
    end component;

    -- Input Signals
    signal sel : std_logic_vector(1 downto 0);
    signal in0, in1, in2 : std_logic;
    
    -- Output Signals
    signal z : std_logic;
    
    -- Constants
    constant clock_cycle : time := 20ns;

begin

    uut : multiplexer_3to1bit port map( sel => sel,
                                        in0 => in0,
                                        in1 => in1,
                                        in2 => in2,
                                        z => z);

    simulation : process
    begin
        in0 <= '1';
        in1 <= '0';
        in2 <= '1';
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
