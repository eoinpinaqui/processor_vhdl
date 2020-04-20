library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity car_tb is
end car_tb;

architecture behaviour of car_tb is

    component car is
        port( opcode : in std_logic_vector(7 downto 0);
              clk, reset, sel : in std_logic;
              next_instruction : out std_logic_vector(7 downto 0));
    end component;

    -- Input Signals
    signal opcode : std_logic_vector(7 downto 0);
    signal clk : std_logic := '0';
    signal reset : std_logic := '1';
    signal sel : std_logic;

    -- Output Singals
    signal next_instruction : std_logic_vector(7 downto 0);
    
    -- Constants
    constant clock_cycle : time := 60ns;

begin

    uut : car port map( opcode => opcode,
                        clk => clk,
                        reset => reset,
                        sel => sel,
                        next_instruction => next_instruction);

    clock : process
    begin
        wait for clock_cycle;
        clk <= not clk;
    end process;
    
    simulation : process
    begin
        wait for clock_cycle;
        reset <= '0';
        opcode <= x"C4";
        sel <= '0';
        wait for clock_cycle * 8;
        sel <= '1';
    end process;

end behaviour;
