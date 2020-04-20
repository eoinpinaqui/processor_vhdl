library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity functional_unit is
    port( a, b : in std_logic_vector(15 downto 0);
          FS : in std_logic_vector(4 downto 0);
          f : out std_logic_vector(15 downto 0);
          v, c, n, z : out std_logic);
end functional_unit;

architecture behaviour of functional_unit is
    
    component alu is
        port( sel : in std_logic_vector(2 downto 0);
              a, b : std_logic_vector(15 downto 0);
              carry_in : in std_logic;
              g : out std_logic_vector(15 downto 0);
              carry_out, v : out std_logic);
    end component;
    
    component shifter is
        port( sel : in std_logic_vector(1 downto 0);
              right, left : in std_logic;
              b : in std_logic_vector(15 downto 0);
              z : out std_logic_vector(15 downto 0));
    end component;
    
    component multiplexer_2to16bit is
        port( sel : in std_logic;
              in0, in1 : in std_logic_vector(15 downto 0);
              z : out std_logic_vector(15 downto 0));
    end component;
    
    -- Intermeidate Signals
    signal alu_output, shifter_output, mux_output : std_logic_vector(15 downto 0);
    
begin

    alu0 : alu port map( sel => FS(3 downto 1),
                         a => a,
                         b => b,
                         g => alu_output,
                         carry_in => FS(0),
                         carry_out => c,
                         v => v);

    shifter0 : shifter port map( sel => FS(3 downto 2),
                                 right => '0',
                                 left => '0',
                                 b => b,
                                 z => shifter_output);

    mux : multiplexer_2to16bit port map( sel => FS(4),
                                         in0 => alu_output,
                                         in1 => shifter_output,
                                         z => mux_output);

    f <= mux_output;
    n <= mux_output(15);
    z <= (not mux_output(0)) and (not mux_output(1)) and (not mux_output(2)) and (not mux_output(3)) and
         (not mux_output(4)) and (not mux_output(5)) and (not mux_output(6)) and (not mux_output(7)) and
         (not mux_output(8)) and (not mux_output(9)) and (not mux_output(10)) and (not mux_output(11)) and
         (not mux_output(12)) and (not mux_output(13)) and (not mux_output(14)) and (not mux_output(15)); 

end behaviour;
