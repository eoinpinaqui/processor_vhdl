library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity b_logic_slice is
    port( sel : in std_logic_vector(1 downto 0);
          b : in std_logic;
          z : out std_logic);
end b_logic_slice;

architecture behaviour of b_logic_slice is

    component multiplexer_4to1bit is
        port( sel : in std_logic_vector(1 downto 0);
              in0, in1, in2, in3 : in std_logic;
              z : out std_logic);
    end component;

    -- Intermidiate Signals
    signal not_b : std_logic;

begin

    mux : multiplexer_4to1bit port map( sel => sel,
                                        in0 => '0',
                                        in1 => b,
                                        in2 => not_b,
                                        in3 => '1',
                                        z => z);
    
    not_b <= not b;

end behaviour;
