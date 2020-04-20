library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity multiplexer_9to16bit_tb is
end multiplexer_9to16bit_tb;

architecture behaviour of multiplexer_9to16bit_tb is

    component multiplexer_9to16bit is
        port( sel : in std_logic_vector(3 downto 0);
              in0, in1, in2, in3, in4, in5, in6, in7, in8 : in std_logic_vector(15 downto 0);
              z : out std_logic_vector(15 downto 0));
    end component;

    -- Input Signals
    signal sel : std_logic_vector(3 downto 0);
    signal in0, in1, in2, in3, in4, in5, in6, in7, in8 : std_logic_vector(15 downto 0);
    
    -- Output Signals
    signal z : std_logic_vector(15 downto 0);
    
    -- Constants
    constant clock_cycle : time := 20ns;

begin

    uut : multiplexer_9to16bit port map( sel => sel,
                                         in0 => in0,
                                         in1 => in1,
                                         in2 => in2,
                                         in3 => in3,
                                         in4 => in4,
                                         in5 => in5,
                                         in6 => in6,
                                         in7 => in7,
                                         in8 => in8,
                                         z => z);
    
    simulation : process
    begin
        in0 <= x"0000";
        in1 <= x"0001";
        in2 <= x"0002";
        in3 <= x"0003";
        in4 <= x"0004";
        in5 <= x"0005";
        in6 <= x"0006";
        in7 <= x"0007";
        in8 <= x"0008";
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
