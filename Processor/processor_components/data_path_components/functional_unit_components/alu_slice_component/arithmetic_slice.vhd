library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity arithmetic_slice is
    port( sel : in std_logic_vector(1 downto 0);
          a, b, carry_in : in std_logic;
          z, carry_out : out std_logic);
end arithmetic_slice;

architecture behaviour of arithmetic_slice is

    component b_logic_slice is
        port( sel : in std_logic_vector(1 downto 0);
              b : in std_logic;
              z : out std_logic);
    end component;

    component full_adder is
        port( in0, in1, carry_in : in std_logic;
              result, carry_out : out std_logic);
    end component;
    
    -- Intermediate Signals
    signal b_logic_result : std_logic;

begin

    b_logic : b_logic_slice port map( b => b,
                                      sel => sel,
                                      z => b_logic_result);

    arithmetic : full_adder port map( in0 => a,
                                      in1 => b_logic_result,
                                      carry_in => carry_in,
                                      carry_out => carry_out,
                                      result => z);
                                      
end behaviour;
