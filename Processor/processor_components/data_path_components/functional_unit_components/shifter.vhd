library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity shifter is
    port( sel : in std_logic_vector(1 downto 0);
          right, left : in std_logic;
          b : in std_logic_vector(15 downto 0);
          z : out std_logic_vector(15 downto 0));
end shifter;

architecture behaviour of shifter is

    component multiplexer_3to1bit is
        port( sel : in std_logic_vector(1 downto 0);
              in0, in1, in2 : in std_logic;
              z : out std_logic);
    end component;

begin

    shift0 : multiplexer_3to1bit port map( sel => sel,
                                           in0 => b(0),
                                           in1 => b(1),
                                           in2 => left,
                                           z => z(0));

    shift1 : multiplexer_3to1bit port map( sel => sel,
                                           in0 => b(1),
                                           in1 => b(2),
                                           in2 => b(0),
                                           z => z(1));
    
    shift2 : multiplexer_3to1bit port map( sel => sel,
                                           in0 => b(2),
                                           in1 => b(3),
                                           in2 => b(1),
                                           z => z(2));

    shift3 : multiplexer_3to1bit port map( sel => sel,
                                           in0 => b(3),
                                           in1 => b(4),
                                           in2 => b(2),
                                           z => z(3));

    shift4 : multiplexer_3to1bit port map( sel => sel,
                                           in0 => b(4),
                                           in1 => b(5),
                                           in2 => b(3),
                                           z => z(4));

    shift5 : multiplexer_3to1bit port map( sel => sel,
                                           in0 => b(5),
                                           in1 => b(6),
                                           in2 => b(4),
                                           z => z(5));

    shift6 : multiplexer_3to1bit port map( sel => sel,
                                           in0 => b(6),
                                           in1 => b(7),
                                           in2 => b(5),
                                           z => z(6));

    shift7 : multiplexer_3to1bit port map( sel => sel,
                                           in0 => b(7),
                                           in1 => b(8),
                                           in2 => b(6),
                                           z => z(7));

    shift8 : multiplexer_3to1bit port map( sel => sel,
                                           in0 => b(8),
                                           in1 => b(9),
                                           in2 => b(7),
                                           z => z(8));

    shift9 : multiplexer_3to1bit port map( sel => sel,
                                           in0 => b(9),
                                           in1 => b(10),
                                           in2 => b(8),
                                           z => z(9));

    shift10 : multiplexer_3to1bit port map( sel => sel,
                                            in0 => b(10),
                                            in1 => b(11),
                                            in2 => b(9),
                                            z => z(10));

    shift11 : multiplexer_3to1bit port map( sel => sel,
                                            in0 => b(11),
                                            in1 => b(12),
                                            in2 => b(10),
                                            z => z(11));

    shift12 : multiplexer_3to1bit port map( sel => sel,
                                            in0 => b(12),
                                            in1 => b(13),
                                            in2 => b(11),
                                            z => z(12));

    shift13 : multiplexer_3to1bit port map( sel => sel,
                                            in0 => b(13),
                                            in1 => b(14),
                                            in2 => b(12),
                                            z => z(13));

    shift14 : multiplexer_3to1bit port map( sel => sel,
                                            in0 => b(14),
                                            in1 => b(15),
                                            in2 => b(13),
                                            z => z(14));

    shift15 : multiplexer_3to1bit port map( sel => sel,
                                            in0 => b(15),
                                            in1 => right,
                                            in2 => b(14),
                                            z => z(15));
    
end behaviour;
