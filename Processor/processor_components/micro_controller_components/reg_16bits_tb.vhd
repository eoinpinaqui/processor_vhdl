library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity reg_16bits_tb is
end reg_16bits_tb;

architecture behaviour of reg_16bits_tb is

    component reg_16bits is
        port( reset, load, clk : in std_logic;
              data : in std_logic_vector(15 downto 0);
              q : out std_logic_vector(15 downto 0));
    end component;

    -- Input Signals
    signal reset, load : std_logic;
    signal clk : std_logic := '0';
    signal data : std_logic_vector(15 downto 0);
    
    -- Output Signals
    signal q : std_logic_vector(15 downto 0);
    
    -- Constants 
    constant clock_cycle : time := 20ns;

begin

    uut : reg_16bits port map( reset => reset,
                               load => load,
                               clk => clk,
                               data => data,
                               q => q);

    clock : process
    begin
        wait for clock_cycle / 2;
        clk <= not clk;
    end process;

    simulation : process
    begin
        reset <= '1';
        load <= '0';
        data <= x"BEEF";
        wait for clock_cycle;
        reset <= '0';
        load <= '1';
        wait for clock_cycle;
        data <= x"1234";
        load <= '0';
        wait for clock_cycle;
        load <= '1';
        wait for clock_cycle;
        load <= '0';
        wait for clock_cycle;
        std.env.stop;
    end process;

end behaviour;
