library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity register_file_tb is
end register_file_tb;

architecture behaviour of register_file_tb is

    component register_file is
        port( reset, load, clk : in std_logic;
              dest_sel, a_sel, b_sel : in std_logic_vector(3 downto 0);
              data : in std_logic_vector(15 downto 0);
              a, b : out std_logic_vector(15 downto 0));
    end component;

    -- Input Signals
    signal reset, load : std_logic;
    signal clk : std_logic := '0';
    signal dest_sel, a_sel, b_sel : std_logic_vector(3 downto 0);
    signal data : std_logic_vector(15 downto 0);
    
    -- Output Signals
    signal a, b : std_logic_vector(15 downto 0);
    
    -- Constants
    constant clock_cycle : time := 20ns;

begin

    uut : register_file port map( reset => reset,
                                  load => load,
                                  clk => clk,
                                  dest_sel => dest_sel,
                                  a_sel => a_sel,
                                  b_sel => b_sel,
                                  data => data,
                                  a => a,
                                  b => b);

    clock : process
    begin
        wait for clock_cycle /2;
        clk <= not clk;
    end process;

    simulation : process
    begin
        reset <= '1';
        load <= '0';
        wait for clock_cycle;
        reset <= '0';
        load <= '1';
        data <= x"0000";
        dest_sel <= "0000";
        wait for clock_cycle;
        data <= x"0001";
        dest_sel <= "0001";
        wait for clock_cycle;
        data <= x"0002";
        dest_sel <= "0010";
        wait for clock_cycle;
        data <= x"0003";
        dest_sel <= "0011";
        wait for clock_cycle;
        data <= x"0004";
        dest_sel <= "0100";
        wait for clock_cycle;
        data <= x"0005";
        dest_sel <= "0101";
        wait for clock_cycle;
        data <= x"0006";
        dest_sel <= "0110";
        wait for clock_cycle;
        data <= x"0007";
        dest_sel <= "0111";
        wait for clock_cycle;
        data <= x"0008";
        dest_sel <= "1000";
        wait for clock_cycle;
        a_sel <= "0000";
        b_sel <= "0001";
        wait for clock_cycle;
        a_sel <= "0010";
        b_sel <= "0011";
        wait for clock_cycle;
        a_sel <= "0100";
        b_sel <= "0101";
        wait for clock_cycle;
        a_sel <= "0110";
        b_sel <= "0111";
        wait for clock_cycle;
        a_sel <= "1000";
        b_sel <= "1001";
        wait for clock_cycle;
        std.env.stop;
    end process;

end behaviour;
