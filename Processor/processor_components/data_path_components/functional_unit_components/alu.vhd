library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity alu is
    port( sel : in std_logic_vector(2 downto 0);
          a, b : std_logic_vector(15 downto 0);
          carry_in : in std_logic;
          g : out std_logic_vector(15 downto 0);
          carry_out, v : out std_logic);
end alu;

architecture behaviour of alu is

    component alu_slice is
        port( sel : in std_logic_vector(2 downto 0);
              a, b, carry_in : in std_logic;
              z, carry_out : out std_logic);
    end component;

    -- Intermdeiate Signals
    signal carries : std_logic_vector(15 downto 0);

begin

    slice0 : alu_slice port map( sel => sel,
                                 a => a(0),
                                 b => b(0),
                                 carry_in => carry_in,
                                 z => g(0),
                                 carry_out => carries(0));

    slice1 : alu_slice port map( sel => sel,
                                 a => a(1),
                                 b => b(1),
                                 carry_in => carries(0),
                                 z => g(1),
                                 carry_out => carries(1));

    slice2 : alu_slice port map( sel => sel,
                                 a => a(2),
                                 b => b(2),
                                 carry_in => carries(1),
                                 z => g(2),
                                 carry_out => carries(2));

    slice3 : alu_slice port map( sel => sel,
                                 a => a(3),
                                 b => b(3),
                                 carry_in => carries(2),
                                 z => g(3),
                                 carry_out => carries(3));

    slice4 : alu_slice port map( sel => sel,
                                 a => a(4),
                                 b => b(4),
                                 carry_in => carries(3),
                                 z => g(4),
                                 carry_out => carries(4));

    slice5 : alu_slice port map( sel => sel,
                                 a => a(5),
                                 b => b(5),
                                 carry_in => carries(4),
                                 z => g(5),
                                 carry_out => carries(5));

    slice6 : alu_slice port map( sel => sel,
                                 a => a(6),
                                 b => b(6),
                                 carry_in => carries(5),
                                 z => g(6),
                                 carry_out => carries(6));

    slice7 : alu_slice port map( sel => sel,
                                 a => a(7),
                                 b => b(7),
                                 carry_in => carries(6),
                                 z => g(7),
                                 carry_out => carries(7));

    slice8 : alu_slice port map( sel => sel,
                                 a => a(8),
                                 b => b(8),
                                 carry_in => carries(7),
                                 z => g(8),
                                 carry_out => carries(8));

    slice9 : alu_slice port map( sel => sel,
                                 a => a(9),
                                 b => b(9),
                                 carry_in => carries(8),
                                 z => g(9),
                                 carry_out => carries(9));

    slice10 : alu_slice port map( sel => sel,
                                  a => a(10),
                                  b => b(10),
                                  carry_in => carries(9),
                                  z => g(10),
                                  carry_out => carries(10));

    slice11 : alu_slice port map( sel => sel,
                                  a => a(11),
                                  b => b(11),
                                  carry_in => carries(10),
                                  z => g(11),
                                  carry_out => carries(11));

    slice12 : alu_slice port map( sel => sel,
                                  a => a(12),
                                  b => b(12),
                                  carry_in => carries(11),
                                  z => g(12),
                                  carry_out => carries(12));
                                  
    slice13 : alu_slice port map( sel => sel,
                                  a => a(13),
                                  b => b(13),
                                  carry_in => carries(12),
                                  z => g(13),
                                  carry_out => carries(13));

    slice14 : alu_slice port map( sel => sel,
                                  a => a(14),
                                  b => b(14),
                                  carry_in => carries(13),
                                  z => g(14),
                                  carry_out => carries(14));

    slice15 : alu_slice port map( sel => sel,
                                  a => a(15),
                                  b => b(15),
                                  carry_in => carries(14),
                                  z => g(15),
                                  carry_out => carries(15));
                                  
    carry_out <= carries(15);
    v <= carries(15) xor carries(14);
    
end behaviour;
