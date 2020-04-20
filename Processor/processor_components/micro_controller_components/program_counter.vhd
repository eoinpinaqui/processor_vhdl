library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity program_counter is
    port( clk, reset, increment_now, load : in std_logic;
          jump : in std_logic_vector(15 downto 0);
          instruction_out : out std_logic_vector(15 downto 0) := x"0000"); -- Start at address x0000
end program_counter;

architecture behaviour of program_counter is

    -- Using the ALU to add the increments and decrements to the current instruction
    component alu is
        port( sel : in std_logic_vector(2 downto 0);
              a, b : std_logic_vector(15 downto 0);
              carry_in : in std_logic;
              g : out std_logic_vector(15 downto 0);
              carry_out, v : out std_logic);
    end component;
    
    -- Intermdeiate Signals
    signal alu_b_input : std_logic_vector(15 downto 0) := x"0000"; -- start with the jump being 0
    signal sel : std_logic_vector(2 downto 0) := "001"; -- always on add
    signal alu_output : std_logic_vector(15 downto 0);
    
    signal current : std_logic_vector(15 downto 0);
    
    -- Constants
    constant gate_delay : time := 1ns;

begin

    pc_alu : alu port map( a => current,
                           b => alu_b_input,
                           sel => sel,
                           carry_in => '0',
                           g => alu_output);   -- v and carry_out not needed here

    process(clk, reset)
    begin
        if(reset = '1') then
            current <= x"0000" after gate_delay;
        elsif(clk = '1' and (increment_now = '1' xor load = '1')) then
            current <= alu_output after gate_delay;
        else
            current <= current;
        end if;
    end process;

    alu_b_input <= x"0001" after gate_delay when increment_now = '1' and load = '0' else
                   jump after gate_delay when increment_now = '0' and load = '1' else
                   x"0000" after gate_delay;
                   
    instruction_out <= current after gate_delay;

end behaviour;
