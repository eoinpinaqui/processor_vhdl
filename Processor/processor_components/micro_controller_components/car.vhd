library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity car is
    port( opcode : in std_logic_vector(7 downto 0);
          clk, reset, sel : in std_logic;
          next_instruction : out std_logic_vector(7 downto 0));
end car;

architecture behaviour of car is

    -- Using the ALU to add the increment by 1
    component alu is
        port( sel : in std_logic_vector(2 downto 0);
              a, b : std_logic_vector(15 downto 0);
              carry_in : in std_logic;
              g : out std_logic_vector(15 downto 0);
              carry_out, v : out std_logic);
    end component;

    -- Intermdeiate Signals
    signal alu_b_input : std_logic_vector(15 downto 0) := x"0001";
    signal alu_sel : std_logic_vector(2 downto 0) := "001"; -- always on add
    signal alu_output : std_logic_vector(15 downto 0);
    
    signal current : std_logic_vector(7 downto 0);

    -- Constants
    constant gate_delay : time := 1ns;

begin

    car_alu : alu port map( a(7 downto 0) => current,
                            a(15 downto 8) => x"00",
                            b => alu_b_input,
                            sel => alu_sel,
                            carry_in => '0',
                            g => alu_output);

    process(clk, reset)
    begin
        if(reset = '1') then
            current <= x"00";
        elsif(clk = '1' and sel = '0') then
            current <= alu_output(7 downto 0);
        elsif(clk = '1' and sel = '1') then
            current <= opcode;
        end if;
    end process;

    next_instruction <= current after gate_delay;

end behaviour;
