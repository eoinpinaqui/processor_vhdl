library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity control_memory_tb is

end control_memory_tb;

architecture behaviour of control_memory_tb is

    component control_memory is
        port( address : in std_logic_vector(7 downto 0);
              control : out std_logic_vector(27 downto 0));
    end component;

    -- Input Signals
    signal address : std_logic_vector(7 downto 0);
    
    -- Output Signals
    signal control : std_logic_vector(27 downto 0);
    
    -- Constants
    constant clock_cycle : time := 20ns;

begin

    uut : control_memory port map( address => address,
                                   control => control);

    simulation : process
    begin
        address <= "00000000";
        wait for clock_cycle;
        address <= "00000001";
        wait for clock_cycle;
        address <= "00000010";
        wait for clock_cycle;
        address <= "00000011";
        wait for clock_cycle;
        address <= "00000100";
        wait for clock_cycle;
        address <= "00000101";
        wait for clock_cycle;
        address <= "00000110";
        wait for clock_cycle;
        address <= "00000111";
        wait for clock_cycle;
        address <= "00001000";
        wait for clock_cycle;
        address <= "00001001";
        wait for clock_cycle;
        address <= "00001010";
        wait for clock_cycle;
        address <= "00001011";
        wait for clock_cycle;
        address <= "00001100";
        wait for clock_cycle;
        address <= "00001101";
        wait for clock_cycle;
        address <= "00001110";
        wait for clock_cycle;
        address <= "00001111";
        wait for clock_cycle;
        address <= "00010000";
        wait for clock_cycle;
        std.env.stop;
    end process;

end behaviour;
