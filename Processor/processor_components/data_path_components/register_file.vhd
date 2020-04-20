library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity register_file is
    port( reset, load, clk : in std_logic;
          dest_sel, a_sel, b_sel : in std_logic_vector(3 downto 0);
          data : in std_logic_vector(15 downto 0);
          a, b : out std_logic_vector(15 downto 0));
end register_file;

architecture behaviour of register_file is

    component decoder_4to9 is
        port( sel : in std_logic_vector(3 downto 0);
              z : out std_logic_vector(8 downto 0));
    end component;
    
    component multiplexer_9to16bit is
        port( sel : in std_logic_vector(3 downto 0);
              in0, in1, in2, in3, in4, in5, in6, in7, in8 : in std_logic_vector(15 downto 0);
              z : out std_logic_vector(15 downto 0));
    end component;

    component reg_16bits is
        port( reset, load, clk : in std_logic;
              data : in std_logic_vector(15 downto 0);
              q : out std_logic_vector(15 downto 0));
    end component;
    
    -- Intermediate Signals
    signal decoder_load : std_logic_vector(8 downto 0);
    signal load0, load1, load2, load3, load4, load5, load6, load7, load8 : std_logic;
    signal reg0_q, reg1_q, reg2_q, reg3_q, reg4_q, reg5_q, reg6_q, reg7_q, reg8_q : std_logic_vector(15 downto 0);
    
begin

    dest_decoder : decoder_4to9 port map( sel => dest_sel,
                                          z => decoder_load);

    load0 <= load and decoder_load(0);
    load1 <= load and decoder_load(1);
    load2 <= load and decoder_load(2);
    load3 <= load and decoder_load(3);
    load4 <= load and decoder_load(4);
    load5 <= load and decoder_load(5);
    load6 <= load and decoder_load(6);
    load7 <= load and decoder_load(7);
    load8 <= load and decoder_load(8);
    
    a_mux : multiplexer_9to16bit port map( sel => a_sel,
                                           in0 => reg0_q,
                                           in1 => reg1_q,
                                           in2 => reg2_q,
                                           in3 => reg3_q,
                                           in4 => reg4_q,
                                           in5 => reg5_q,
                                           in6 => reg6_q,
                                           in7 => reg7_q,
                                           in8 => reg8_q,
                                           z => a);

    b_mux : multiplexer_9to16bit port map( sel => b_sel,
                                           in0 => reg0_q,
                                           in1 => reg1_q,
                                           in2 => reg2_q,
                                           in3 => reg3_q,
                                           in4 => reg4_q,
                                           in5 => reg5_q,
                                           in6 => reg6_q,
                                           in7 => reg7_q,
                                           in8 => reg8_q,
                                           z => b);

    reg0 : reg_16bits port map( reset => reset,
                                load => load0,
                                clk => clk,
                                data => data,
                                q => reg0_q);

    reg1 : reg_16bits port map( reset => reset,
                                load => load1,
                                clk => clk,
                                data => data,
                                q => reg1_q);

    reg2 : reg_16bits port map( reset => reset,
                                load => load2,
                                clk => clk,
                                data => data,
                                q => reg2_q);

    reg3 : reg_16bits port map( reset => reset,
                                load => load3,
                                clk => clk,
                                data => data,
                                q => reg3_q);

    reg4 : reg_16bits port map( reset => reset,
                                load => load4,
                                clk => clk,
                                data => data,
                                q => reg4_q);

    reg5 : reg_16bits port map( reset => reset,
                                load => load5,
                                clk => clk,
                                data => data,
                                q => reg5_q);

    reg6 : reg_16bits port map( reset => reset,
                                load => load6,
                                clk => clk,
                                data => data,
                                q => reg6_q);

    reg7 : reg_16bits port map( reset => reset,
                                load => load7,
                                clk => clk,
                                data => data,
                                q => reg7_q);

    reg8 : reg_16bits port map( reset => reset,
                                load => load8,
                                clk => clk,
                                data => data,
                                q => reg8_q);

end behaviour;
