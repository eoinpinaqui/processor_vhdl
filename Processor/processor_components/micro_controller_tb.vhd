library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity micro_controller_tb is
end micro_controller_tb;

architecture behaviour of micro_controller_tb is

    component micro_controller is
        port( clk, reset, c, v, n, z : in std_logic;
              data_from_memory : in std_logic_vector(15 downto 0);
              dp_control : out std_logic_vector(19 downto 0);
              address_sel, mem_load : out std_logic;
              pc_current : out std_logic_vector(15 downto 0));
    end component;

    -- Input Signals
    signal clk : std_logic := '0';
    signal reset : std_logic := '1';
    signal c, v, n, z : std_logic;
    signal data_from_memory : std_logic_vector(15 downto 0);
    
    -- Output Signals
    signal dp_control : std_logic_vector(19 downto 0);
    signal address_sel, mem_load : std_logic;
    signal pc_current : std_logic_vector(15 downto 0);
    
    -- Constants
    constant clock_cycle : time := 30ns;

begin

    uut : micro_controller port map( clk => clk,
                                     reset => reset,
                                     c => c,
                                     v => v,
                                     n => n,
                                     z => z,
                                     data_from_memory => data_from_memory,
                                     dp_control => dp_control,
                                     address_sel => address_sel,
                                     mem_load => mem_load,
                                     pc_current => pc_current);

    clock : process
    begin
        wait for clock_cycle / 2;
        clk <= not clk;
    end process;

    simulation : process
    begin
        wait for clock_cycle;
        reset <= '0';
        data_from_memory <= x"0000";
        c <= '0';
        v <= '1';
        n <= '1';
        z <= '0';
        wait for clock_cycle;
        data_from_memory <= x"0001";
        wait for clock_cycle;
        data_from_memory <= x"0002";
        wait for clock_cycle;
        data_from_memory <= x"0003";
        wait for clock_cycle;
        data_from_memory <= x"0004";
        wait for clock_cycle;
        std.env.stop;
    end process;
        

end behaviour;
