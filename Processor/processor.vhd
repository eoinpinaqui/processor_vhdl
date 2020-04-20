library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity processor is
    port( clk, reset : in std_logic);
end processor;

architecture behaviour of processor is

    component memory is
        port( address, data_in : in std_logic_vector(15 downto 0);
              load : in std_logic;
              data_out : out std_logic_vector(15 downto 0));
    end component;
    
    component micro_controller is
        port( clk, reset, c, v, n, z : in std_logic;
              data_from_memory : in std_logic_vector(15 downto 0);
              dp_control : out std_logic_vector(19 downto 0);
              address_sel, mem_load : out std_logic;
              pc_current : out std_logic_vector(15 downto 0));
    end component;
    
    component data_path is
        port( clk, reset : in std_logic;
              dp_control : in std_logic_vector(19 downto 0);
              const_in, data_in : in std_logic_vector(15 downto 0);
              address_out, data_out : out std_logic_vector(15 downto 0);
              v, c, n, z : out std_logic);
    end component;
    
    component multiplexer_2to16bit is
        port( sel : in std_logic;
              in0, in1 : in std_logic_vector(15 downto 0);
              z : out std_logic_vector(15 downto 0));
    end component;

    -- Intermediate Signals
    signal address_sel, mem_load, c, v, n, z : std_logic;
    signal z_filled, mem_data, reg_address, mem_in, pc_address, mux_out : std_logic_vector(15 downto 0);
    signal memory_control : std_logic_vector(19 downto 0);

begin

    dp : data_path port map( reset => reset,
                             clk => clk,
                             dp_control => memory_control,
                             const_in => z_filled,
                             data_in => mem_data,
                             address_out => reg_address,
                             data_out => mem_in,
                             c => c,
                             v => v,
                             n => n,
                             z => z);

    control : micro_controller port map( reset => reset,
                                         clk => clk,
                                         data_from_memory => mem_data,
                                         c => c,
                                         v => v,
                                         n => n,
                                         z => z,
                                         dp_control => memory_control,
                                         address_sel => address_sel,
                                         mem_load => mem_load,
                                         pc_current => pc_address);

    mux : multiplexer_2to16bit port map( sel => address_sel,
                                         in0 => reg_address,
                                         in1 => pc_address,
                                         z => mux_out);

    mem : memory port map( address => mux_out,
                           data_in => mem_in,
                           load => mem_load,
                           data_out => mem_data);
    
    z_filled(15 downto 3) <= (others => '0');
    z_filled(2 downto 0) <= memory_control(10 downto 8);

end behaviour;
