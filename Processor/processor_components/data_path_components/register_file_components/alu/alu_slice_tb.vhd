library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity alu_slice_tb is
end alu_slice_tb;

architecture behaviour of alu_slice_tb is

    component alu_slice is
        port( sel : in std_logic_vector(2 downto 0);
              a, b, carry_in : in std_logic;
              z, carry_out : out std_logic);
    end component;

    -- Input Signals
    signal sel : std_logic_vector(2 downto 0);
    signal a, b, carry_in : std_logic;
    
    -- Output Signals
    signal z, carry_out : std_logic;
    
    -- Constants
    constant clock_cycle : time := 20ns;

begin

    uut : alu_slice port map( sel => sel,
                              a => a,
                              b => b,
                              carry_in => carry_in,
                              z => z,
                              carry_out => carry_out);

    simulation : process
    begin
        a <= '0';
        b <= '0';
        carry_in <= '0';
        sel <= "000";
        wait for clock_cycle;
        sel <= "001";
        wait for clock_cycle;
        sel <= "010";
        wait for clock_cycle;
        sel <= "011";
        wait for clock_cycle;
        sel <= "100";
        wait for clock_cycle;
        sel <= "101";
        wait for clock_cycle;
        sel <= "110";
        wait for clock_cycle;
        sel <= "111";
        wait for clock_cycle;
        
        a <= '1';
        b <= '0';
        carry_in <= '0';
        sel <= "000";
        wait for clock_cycle;
        sel <= "001";
        wait for clock_cycle;
        sel <= "010";
        wait for clock_cycle;
        sel <= "011";
        wait for clock_cycle;
        sel <= "100";
        wait for clock_cycle;
        sel <= "101";
        wait for clock_cycle;
        sel <= "110";
        wait for clock_cycle;
        sel <= "111";
        wait for clock_cycle;
        
        a <= '0';
        b <= '1';
        carry_in <= '0';
        sel <= "000";
        wait for clock_cycle;
        sel <= "001";
        wait for clock_cycle;
        sel <= "010";
        wait for clock_cycle;
        sel <= "011";
        wait for clock_cycle;
        sel <= "100";
        wait for clock_cycle;
        sel <= "101";
        wait for clock_cycle;
        sel <= "110";
        wait for clock_cycle;
        sel <= "111";
        wait for clock_cycle;
        
        a <= '1';
        b <= '1';
        carry_in <= '0';
        sel <= "000";
        wait for clock_cycle;
        sel <= "001";
        wait for clock_cycle;
        sel <= "010";
        wait for clock_cycle;
        sel <= "011";
        wait for clock_cycle;
        sel <= "100";
        wait for clock_cycle;
        sel <= "101";
        wait for clock_cycle;
        sel <= "110";
        wait for clock_cycle;
        sel <= "111";
        wait for clock_cycle;
        
        a <= '0';
        b <= '0';
        carry_in <= '1';
        sel <= "000";
        wait for clock_cycle;
        sel <= "001";
        wait for clock_cycle;
        sel <= "010";
        wait for clock_cycle;
        sel <= "011";
        wait for clock_cycle;
        sel <= "100";
        wait for clock_cycle;
        sel <= "101";
        wait for clock_cycle;
        sel <= "110";
        wait for clock_cycle;
        sel <= "111";
        wait for clock_cycle;
        
        a <= '1';
        b <= '0';
        carry_in <= '1';
        sel <= "000";
        wait for clock_cycle;
        sel <= "001";
        wait for clock_cycle;
        sel <= "010";
        wait for clock_cycle;
        sel <= "011";
        wait for clock_cycle;
        sel <= "100";
        wait for clock_cycle;
        sel <= "101";
        wait for clock_cycle;
        sel <= "110";
        wait for clock_cycle;
        sel <= "111";
        wait for clock_cycle;
        
        a <= '0';
        b <= '1';
        carry_in <= '1';
        sel <= "000";
        wait for clock_cycle;
        sel <= "001";
        wait for clock_cycle;
        sel <= "010";
        wait for clock_cycle;
        sel <= "011";
        wait for clock_cycle;
        sel <= "100";
        wait for clock_cycle;
        sel <= "101";
        wait for clock_cycle;
        sel <= "110";
        wait for clock_cycle;
        sel <= "111";
        wait for clock_cycle;
        
        a <= '1';
        b <= '1';
        carry_in <= '1';
        sel <= "000";
        wait for clock_cycle;
        sel <= "001";
        wait for clock_cycle;
        sel <= "010";
        wait for clock_cycle;
        sel <= "011";
        wait for clock_cycle;
        sel <= "100";
        wait for clock_cycle;
        sel <= "101";
        wait for clock_cycle;
        sel <= "110";
        wait for clock_cycle;
        sel <= "111";
        wait;
    end process;

end behaviour;
