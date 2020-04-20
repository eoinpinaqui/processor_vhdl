library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity data_path is
    port( clk, reset : in std_logic;
          dp_control : in std_logic_vector(19 downto 0);
          const_in, data_in : in std_logic_vector(15 downto 0);
          address_out, data_out : out std_logic_vector(15 downto 0);
          v, c, n, z : out std_logic);
end data_path;

architecture behaviour of data_path is

    component register_file is
        port( reset, load, clk : in std_logic;
              dest_sel, a_sel, b_sel : in std_logic_vector(3 downto 0);
              data : in std_logic_vector(15 downto 0);
              a, b : out std_logic_vector(15 downto 0));
    end component;

    component functional_unit is
        port( a, b : in std_logic_vector(15 downto 0);
              FS : in std_logic_vector(4 downto 0);
              f : out std_logic_vector(15 downto 0);
              v, c, n, z : out std_logic);
    end component;

    component multiplexer_2to16bit is
        port( sel : in std_logic;
              in0, in1 : in std_logic_vector(15 downto 0);
              z : out std_logic_vector(15 downto 0));
    end component;

    -- Intermediate Signals
    signal mux_md_out, mux_mb_out, b_in_reg, a_in_reg, func_f : std_logic_vector(15 downto 0);

begin

    registers : register_file port map( clk => clk,
                                        reset => reset,
                                        load => dp_control(0),
                                        dest_sel => dp_control(19 downto 16),
                                        a_sel => dp_control(15 downto 12),
                                        b_sel => dp_control(11 downto 8),
                                        data => mux_md_out,
                                        a => a_in_reg,
                                        b => b_in_reg);

    function_unit : functional_unit port map( a => a_in_reg,
                                              b => mux_mb_out,
                                              FS => dp_control(6 downto 2),
                                              f => func_f,
                                              v => v,
                                              c => c,
                                              n => n,
                                              z => z);

    mux_mb : multiplexer_2to16bit port map( sel => dp_control(7),
                                            in0 => b_in_reg,
                                            in1 => const_in,
                                            z => mux_mb_out);
    
    mux_md : multiplexer_2to16bit port map( sel => dp_control(1),
                                            in0 => func_f,
                                            in1 => data_in,
                                            z => mux_md_out);

    address_out <= a_in_reg;
    data_out <= mux_mb_out;

end behaviour;
