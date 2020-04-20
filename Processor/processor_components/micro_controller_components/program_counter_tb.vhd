library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity program_counter_tb is
end program_counter_tb;

architecture behaviour of program_counter_tb is

    component program_counter is
        port( clk, reset, increment_now, load : in std_logic;
              jump : in std_logic_vector(15 downto 0);
              instruction_out : out std_logic_vector(15 downto 0));
    end component;

    -- Input Signals
    signal clk : std_logic := '0';
    signal reset : std_logic := '1';
    signal increment_now, load : std_logic;
    signal jump : std_logic_vector(15 downto 0);
    
    -- Output Signals
    signal instruction_out : std_logic_vector(15 downto 0);
    
    -- Constants
    constant clock_cycle : time := 60ns;
    
begin

    uut : program_counter port map( clk => clk,
                                    reset => reset,
                                    increment_now => increment_now,
                                    load => load,
                                    jump => jump,
                                    instruction_out => instruction_out);

    clock : process
    begin
        wait for clock_cycle;
        clk <= not clk;
    end process;
    
    simuation : process
    begin 
        wait for clock_cycle;
        reset <= '0';
        jump <= x"1110";
        increment_now <= '1';
        load <= '0';
        wait for clock_cycle * 4;
        load <= '1';
        increment_now <= '0';
        wait for clock_cycle * 8;
        load <= '1';
        increment_now <= '1';
        wait for clock_cycle;
        load <= '0';
        increment_now <= '0';
        wait for clock_cycle;
        std.env.stop;
    end process;

end behaviour;
