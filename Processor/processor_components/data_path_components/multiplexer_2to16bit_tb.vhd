library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity multiplexer_2to16bit_tb is
end multiplexer_2to16bit_tb;

architecture behaviour of multiplexer_2to16bit_tb is

    component multiplexer_2to16bit is 
        port( sel : in std_logic;
              in0, in1 : in std_logic_vector(15 downto 0);
              z : out std_logic_vector(15 downto 0));
    end component;

    -- Input Signals
    signal sel : std_logic;
    signal in0, in1 : std_logic_vector(15 downto 0);
    
    -- Output Signals
    signal z : std_logic_vector(15 downto 0);
    
    -- Constants
    constant clock_cycle : time := 20ns;

begin

    uut : multiplexer_2to16bit port map( sel => sel,
                                         in0 => in0,
                                         in1 => in1,
                                         z => z);

    simulation : process
    begin
        in0 <= x"BEEF";
        in1 <= x"AAAA";
        sel <= '0';
        wait for clock_cycle;
        sel <= '1';
        wait for clock_cycle;
        std.env.stop;
    end process;
    
end behaviour;
