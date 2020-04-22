library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity logic_slice is
    port( sel : in std_logic_vector(1 downto 0);
          a, b : in std_logic;
          z : out std_logic);
end logic_slice;

architecture behaviour of logic_slice is
    
    component multiplexer_4to1bit is
        port( sel : in std_logic_vector(1 downto 0);
              in0, in1, in2, in3 : in std_logic;
              z : out std_logic);
    end component;    
    
    -- Intermediate Signals
    signal and_result, or_result, xor_result, not_result : std_logic;
    
    -- Constants
    constant gate_delay : time := 1ns;
    
begin

    mux : multiplexer_4to1bit port map( sel => sel,
                                        in0 => and_result,
                                        in1 => or_result,
                                        in2 => xor_result,
                                        in3 => not_result,
                                        z => z);
    
    and_result <= a and b after gate_delay;
    or_result <= a or b after gate_delay;
    xor_result <= a xor b after gate_delay;
    not_result <= not a after gate_delay;
    
end behaviour;
