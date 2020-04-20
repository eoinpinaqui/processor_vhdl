library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity multiplexer_4to1bit_tb is
end multiplexer_4to1bit_tb;

architecture behaviour of multiplexer_4to1bit_tb is

    component multiplexer_4to1bit is
        port( sel : in std_logic_vector(1 downto 0);
              in0, in1, in2, in3 : in std_logic;
              z : out std_logic);
    end component;

    -- Input Signals
    signal sel : std_logic_vector(1 downto 0);
    signal in0, in1, in2, in3 : std_logic;
    
    -- Output Signals
    signal z : std_logic;
    
    -- Constants
    constant clock_cycle : time := 20ns;

begin

    uut : multiplexer_4to1bit port map( sel => sel,
                                        in0 => in0,
                                        in1 => in1,
                                        in2 => in2,
                                        in3 => in3,
                                        z => z);

    clock : process
    begin
        in0 <= '0';
        in1 <= '1';
        in2 <= '0';
        in3 <= '1';
        wait for clock_cycle;
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
