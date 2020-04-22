library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity alu_slice is
    port( sel : in std_logic_vector(2 downto 0);
          a, b, carry_in : in std_logic;
          z, carry_out : out std_logic);
end alu_slice;

architecture behaviour of alu_slice is

    component arithmetic_slice is
        port( sel : in std_logic_vector(1 downto 0);
              a, b, carry_in : in std_logic;
              z, carry_out : out std_logic);
    end component;

    component logic_slice is
        port( sel : in std_logic_vector(1 downto 0);
              a, b : in std_logic;
              z : out std_logic);
    end component;

    component multiplexer_2to1bit is
        port( sel, in0, in1 : std_logic;
              z : out std_logic);
    end component;

    -- Intermediate Signals
    signal logic_result, arithmetic_result : std_logic;

begin

    arithmetic : arithmetic_slice port map( sel => sel(1 downto 0),
                                            a => a,
                                            b => b,
                                            carry_in => carry_in,
                                            z => arithmetic_result,
                                            carry_out => carry_out);

    logic : logic_slice port map( sel => sel(1 downto 0),
                                  a => a,
                                  b => b,
                                  z => logic_result);

    alu_multiplexer : multiplexer_2to1bit port map( sel => sel(2),
                                                    in0 => arithmetic_result,
                                                    in1 => logic_result,
                                                    z => z);

end behaviour;
