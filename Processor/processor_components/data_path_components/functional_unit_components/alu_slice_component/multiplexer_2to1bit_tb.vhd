library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity multiplexer_2to1bit_tb is
end multiplexer_2to1bit_tb;

architecture behaciour of multiplexer_2to1bit_tb is

    component multiplexer_2to1bit is
        port( sel, in0, in1 : std_logic;
              z : out std_logic);
    end component;
    
    -- Input Signals
    signal sel, in0, in1 : std_logic;
    
    -- Output Signals
    signal z : std_logic;
    
    -- Constants
    constant clock_cycle : time := 20ns;

begin

    uut : multiplexer_2to1bit port map( sel => sel,
                                        in0 => in0,
                                        in1 => in1,
                                        z => z);

    simulaiton : process
    begin
        in0 <= '0';
        in1 <= '1';
        wait for clock_cycle;
        sel <= '0';
        wait for clock_cycle; 
        sel <= '1';
        wait for clock_cycle;
        std.env.stop;
    end process;

end behaciour;
