library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity data_path_tb is
end data_path_tb;

architecture behaviour of data_path_tb is

    component data_path is
        port( clk, reset : in std_logic;
              dp_control : in std_logic_vector(19 downto 0);
              const_in, data_in : in std_logic_vector(15 downto 0);
              address_out, data_out : out std_logic_vector(15 downto 0);
              v, c, n, z : out std_logic);
    end component;

    -- Input Signals
    signal clk : std_logic := '0';
    signal reset: std_logic := '1';
    signal dp_control : std_logic_vector(19 downto 0);
    signal const_in, data_in : std_logic_vector(15 downto 0);
    
    -- Output Signals
    signal address_out, data_out : std_logic_vector(15 downto 0);
    signal v, c, n, z : std_logic;
    
    -- Constants 
    constant clock_cycle : time := 60ns;

begin

    uut : data_path port map( clk => clk,
                              reset => reset,
                              dp_control => dp_control,
                              const_in => const_in,
                              data_in => data_in,
                              address_out => address_out,
                              data_out => data_out,
                              v => v,
                              c => c,
                              n => n,
                              z => z);

    clock : process
    begin
        wait for clock_cycle / 2;
        clk <= not clk;
    end process;
    
    simulation : process
    begin
        wait for clock_cycle;
        reset <= '0';
        wait for clock_cycle;
        
        -- LOAD 0x0073 into R1
        data_in <= x"0073";
        dp_control <= "00010000000000000011";
        wait for clock_cycle;
        
        -- LOAD 0x0011 into R2
        data_in <= x"0011";
        dp_control <= "00100000000000000011";
        wait for clock_cycle;
        
        -- R0 = R1 + R2
        dp_control <= "00000001001000001001";
        wait for clock_cycle;
        
        -- R3 = R2 << 1
        dp_control <= "00110000001001100001";
        wait for clock_cycle;
        
        -- R4 = R1 AND R2
        dp_control <= "01000001001000100001";
        wait for clock_cycle;
        std.env.stop;
    
    end process;

end behaviour;




















