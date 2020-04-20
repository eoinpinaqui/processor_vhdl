library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity memory is
    port( address, data_in : in std_logic_vector(15 downto 0);
          load : in std_logic;
          data_out : out std_logic_vector(15 downto 0));
end memory;

architecture behaviour of memory is

    -- Constants
    constant gate_delay : time := 1ns;

    type mem is array(0 to 511) of std_logic_vector(15 downto 0);
    
    signal m : mem :=(
                        -- Arithmetic Instructions
                        0 => x"0007",   -- ADI r0, r0, 7
                        1 => x"0041",   -- ADI r1, r0, 1
                        2 => x"0281",   -- ADD r2, r0, r1
                        3 => x"04D4",   -- SUBI r3, r2, 4
                        4 => x"0703",   -- SUB r4, r0, r3
                        
                        -- Loading & Storing Instructions
                        5 => x"0970",   -- LD r5, [r6]      r6 = x"0000"
                        6 => x"0A31",   -- ST r1, [r6]      r6 = x"0000"
                        7 => x"09B8",   -- LD r6, [r7]      r7 = x"0000"
                        
                        -- Incrementing and Decrementing Instructions
                        8 => x"0C00",   -- INC r0, r0
                        9 => x"0E48",   -- DEC r1, r1
                        
                        -- Logical Instructions
                        10 => x"1081",  -- AND r2, r0, r1
                        11 => x"12C1",  -- OR r3, r0, r1
                        12 => x"1501",  -- XOR r4, r0, r1
                        13 => x"1740",  -- NOT r5, r0
                        
                        -- Shifting Instructions
                        14 => x"1A02",  -- SLI r0, r0, 2
                        15 => x"1E4A",  -- SRI r1, r1, 2
                        16 => x"18D9",  -- SL r3, r3, r1
                        17 => x"1D21",  -- SR r4, r4, r1
                        
                        -- Unconditional Branching
                        18 => x"2004",  -- B + 4
                        19 => x"0001",  -- will be skipped  
                        20 => x"0001",  -- will be skipped  
                        21 => x"0001",  -- will be skipped  
                        22 => x"0001",  -- will be skipped  
                        23 => x"01F9",  -- ADI r7, r7, 1
                        
                        -- Branch if 0
                        24 => x"223B",  -- BEQ r7, 3
                        25 => x"15FF",  -- XOR r7, r7, r7           r7 = 0
                        26 => x"223B",  -- BEQ r7, 3
                        27 => x"0001",  -- will be skipped
                        28 => x"0001",  -- will be skipped
                        29 => x"0001",  -- will be skipped
                        30 => x"01FF",  -- ADI r7, r7, 7
                       
                          
                            
                        others => x"F000");

begin

    mem_process : process(address, load) is
    begin
        if load = '1' then
            m(to_integer(unsigned(address(8 downto 0)))) <= data_in;
        end if;
        data_out <= m(to_integer(unsigned(address(8 downto 0)))) after gate_delay;
    end process;


end behaviour;
