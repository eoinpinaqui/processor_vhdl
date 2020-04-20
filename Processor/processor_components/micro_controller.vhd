library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity micro_controller is
    port( clk, reset, c, v, n, z : in std_logic;
          data_from_memory : in std_logic_vector(15 downto 0);
          dp_control : out std_logic_vector(19 downto 0);
          address_sel, mem_load : out std_logic;
          pc_current : out std_logic_vector(15 downto 0));
end micro_controller;

architecture behaviour of micro_controller is

    component reg_16bits is
        port( reset, load, clk : in std_logic;
              data : in std_logic_vector(15 downto 0);
              q : out std_logic_vector(15 downto 0));
    end component;

    component sign_extend is
        port( six_bits : in std_logic_vector(5 downto 0);
              extend : out std_logic_vector(15 downto 0));
    end component;
    
    component program_counter is
        port( clk, reset, increment_now, load : in std_logic;
              jump : in std_logic_vector(15 downto 0);
              instruction_out : out std_logic_vector(15 downto 0));
    end component;

    component multiplexer_flags is
        port( c, v, n, z : std_logic;
              sel : in std_logic_vector(2 downto 0);
              flag : out std_logic);
    end component;
    
    component car is
        port( opcode : in std_logic_vector(7 downto 0);
              clk, reset, sel : in std_logic;
              next_instruction : out std_logic_vector(7 downto 0));
    end component;
    
    component control_memory is
        port( address : in std_logic_vector(7 downto 0);
              control : out std_logic_vector(27 downto 0));
    end component;
    
    component multiplexer_2to8bit is
        port( sel : in std_logic;
              in0, in1 : in std_logic_vector(7 downto 0);
              z : out std_logic_vector(7 downto 0));
    end component;

    -- Intermediate Signal
    signal c_flag : std_logic;
    signal pc_jump : std_logic_vector(5 downto 0);
    signal ir_opcode_ext, car_mux_val, c_address : std_logic_vector(7 downto 0);
    signal ir_val, extended_pc : std_logic_vector(15 downto 0);
    signal memory_control : std_logic_vector(27 downto 0);

begin

    instruction_register : reg_16bits port map( reset => reset,
                                                load => memory_control(15),
                                                clk => clk,
                                                data => data_from_memory,
                                                q => ir_val);
   
   mux_flags : multiplexer_flags port map( c => c,
                                           v => v,
                                           n => n,
                                           z => z,
                                           sel => memory_control(19 downto 17),
                                           flag => c_flag);

    
    pc_extend : sign_extend port map( six_bits => pc_jump,
                                      extend => extended_pc);
    
    pc : program_counter port map( clk => clk,
                                   reset => reset,
                                   increment_now => memory_control(14),
                                   load => memory_control(13),
                                   jump => extended_pc,
                                   instruction_out => pc_current);
    
    car_mux : multiplexer_2to8bit port map( sel => memory_control(16),
                                            in0 => memory_control(27 downto 20),
                                            in1 => ir_opcode_ext,
                                            z => car_mux_val);
    
    control_address_register : car port map( reset => reset,
                                             clk => clk,
                                             sel => c_flag,
                                             opcode => car_mux_val,
                                             next_instruction => c_address);
                                             
    c_mem : control_memory port map( address => c_address,
                                     control => memory_control);
    
    ir_opcode_ext(7) <= '0';
    ir_opcode_ext(6 downto 0) <= ir_val(15 downto 9);
    dp_control(18 downto 16) <= ir_val(8 downto 6);  -- dest reg
    dp_control(14 downto 12) <= ir_val(5 downto 3);  -- a reg
    dp_control(10 downto 8) <= ir_val(2 downto 0);   -- b reg
   
    pc_jump(5 downto 3) <= ir_val(8 downto 6);
    pc_jump(2 downto 0) <= ir_val(2 downto 0);
    
    dp_control(19) <= memory_control(12);   -- temp reg
    dp_control(15) <= memory_control(11);
    dp_control(11) <= memory_control(10);
    dp_control(7) <= memory_control(9);
    dp_control(6 downto 2) <= memory_control(8 downto 4);
    dp_control(1) <= memory_control(3);
    dp_control(0) <= memory_control(2);
    
    address_sel <= memory_control(1);
    mem_load <= memory_control(0);
    
end behaviour;
