library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity memory_tb is
end memory_tb;

architecture behaviour of memory_tb is

    component memory is
        port( address, data_in : in std_logic_vector(15 downto 0);
              load : in std_logic;
              data_out : out std_logic_vector(15 downto 0));
    end component;

    -- Input Signals
    signal address, data_in : std_logic_vector(15 downto 0);
    signal load : std_logic;
    
    -- Output Signals
    signal data_out : std_logic_vector(15 downto 0);
    
    -- Constants
    constant clock_cycle: time := 20ns;

begin

    uut : memory port map( address => address,
                           data_in => data_in,
                           load => load,
                           data_out => data_out);

    simulation : process
    begin
        data_in <= x"9999";
        address <= x"0000";
        load <= '0';
        wait for clock_cycle;
        address <= x"0001";
        wait for clock_cycle;
        address <= x"0002";
        wait for clock_cycle;
        address <= x"0001";
        load <= '1';
        wait for clock_cycle;
        std.env.stop;
    end process;


end behaviour;
