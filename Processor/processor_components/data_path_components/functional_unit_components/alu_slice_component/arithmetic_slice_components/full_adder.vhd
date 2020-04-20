library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder is
    port( in0, in1, carry_in : in std_logic;
          result, carry_out : out std_logic);
end full_adder;

architecture behaviour of full_adder is

    -- Intermediate Signals
    signal half_sum, half_sum_carry, result_carry : std_logic;
    
    -- Constants
    constant gate_delay : time := 1ns;

begin

    half_sum <= in0 xor in1 after gate_delay;
    half_sum_carry <= in0 and in1 after gate_delay;
    
    result <= half_sum xor carry_in after gate_delay;
    result_carry <= half_sum and carry_in after gate_delay;
    
    carry_out <= result_carry or half_sum_carry after gate_delay;

end behaviour;
