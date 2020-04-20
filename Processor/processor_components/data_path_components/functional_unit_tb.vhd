library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity functional_unit_tb is
end functional_unit_tb;

architecture behaviour of functional_unit_tb is

    component functional_unit is
        port( a, b : in std_logic_vector(15 downto 0);
              FS : in std_logic_vector(4 downto 0);
              f : out std_logic_vector(15 downto 0);
              v, c, n, z : out std_logic);
    end component;

    -- Input Signals
    signal a, b : std_logic_vector(15 downto 0);
    signal FS : std_logic_vector(4 downto 0);
    
    -- Output Signals
    signal f : std_logic_vector(15 downto 0);
    signal v, c, n, z : std_logic;
    
    -- Constants
    constant clock_cycle : time := 20ns;
    
begin

    uut : functional_unit port map( a => a,
                                    b => b,
                                    FS => FS,
                                    f => f,
                                    v => v,
                                    c => c,
                                    n => n,
                                    z => z);

    simulation : process
    begin
        a <= x"F50F";
        b <= x"AAAA";
        FS <= "00000";
        wait for clock_cycle;
        FS <= "00001";
        wait for clock_cycle;
        FS <= "00010";
        wait for clock_cycle;
        FS <= "00011";
        wait for clock_cycle;
        FS <= "00100";
        wait for clock_cycle;
        FS <= "00101";
        wait for clock_cycle;
        FS <= "00110";
        wait for clock_cycle;
        FS <= "00111";
        wait for clock_cycle;
        FS <= "01000";
        wait for clock_cycle;
        FS <= "01010";
        wait for clock_cycle;
        FS <= "01100";
        wait for clock_cycle;
        FS <= "01110";
        wait for clock_cycle;
        FS <= "10000";
        wait for clock_cycle;
        FS <= "10100";
        wait for clock_cycle;
        FS <= "11000";
        wait for clock_cycle;
        std.env.stop;
    end process;

end behaviour;
