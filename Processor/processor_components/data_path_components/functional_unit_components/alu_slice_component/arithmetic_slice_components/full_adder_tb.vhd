library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder_tb is
end full_adder_tb;

architecture behaviour of full_adder_tb is

    component full_adder is
        port( in0, in1, carry_in : in std_logic;
              result, carry_out : out std_logic);
    end component;
    
    -- Input Signals
    signal in0, in1, carry_in : std_logic;
    
    -- Output Signals
    signal result, carry_out : std_logic;
    
    -- Constants
    constant clock_cycle : time := 20ns;

begin

    uut : full_adder port map( in0 => in0,
                               in1 => in1,
                               carry_in => carry_in,
                               result => result,
                               carry_out => carry_out);
    
    simulation : process
    begin
        in0 <= '0';
        in1 <= '0';
        carry_in <= '0';
        wait for clock_cycle;
        in0 <= '1';
        wait for clock_cycle;
        in0 <= '0';
        in1 <= '1';
        wait for clock_cycle;
        in0 <= '1';
        wait for clock_cycle;
        carry_in <= '1';
        in0 <= '0';
        in1 <= '0';
        wait for clock_cycle;
        in0 <= '1';
        wait for clock_cycle;
        in0 <= '0';
        in1 <= '1';
        wait for clock_cycle;
        in0 <= '1';
        wait for clock_cycle;
        std.env.stop;
    end process;

end behaviour;
