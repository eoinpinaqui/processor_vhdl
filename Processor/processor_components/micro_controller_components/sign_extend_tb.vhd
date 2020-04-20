library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sign_extend_tb is
end sign_extend_tb;

architecture behaviour of sign_extend_tb is

    component sign_extend is
        port( six_bits : in std_logic_vector(5 downto 0);
              extend : out std_logic_vector(15 downto 0));
    end component;

    -- Input Signals
    signal six_bits : std_logic_vector(5 downto 0);
    
    -- Output Signals
    signal extend : std_logic_vector(15 downto 0);
    
    -- Constants
    constant clock_cycle : time := 20ns;

begin

    uut : sign_extend port map( six_bits => six_bits,
                                extend => extend);

    simulation : process
    begin
        wait for clock_cycle;
        six_bits <= "011111";
        wait for clock_cycle;
        six_bits <= "100000";
        wait for clock_cycle;
        six_bits <= "011010";
        wait for clock_cycle;
        six_bits <= "110011";
        wait for clock_cycle;
        std.env.stop;
    end process;

end behaviour;
