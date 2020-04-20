library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity control_memory is
    port( address : in std_logic_vector(7 downto 0);
          control : out std_logic_vector(27 downto 0));
end control_memory;

architecture behaviour of control_memory is

    -- Constants
    constant gate_delay : time := 1ns;

    type memory is array(0 to 255) of std_logic_vector(27 downto 0);
    signal mem : memory := ( 
                             -- MAIN OPCODE TABLE
                             
                             -- Arithmetic
                             0 => x"FE20224",       -- ADI - add immediate
                             1 => x"FE20024",       -- ADD - add registers
                             2 => x"FE20254",       -- SUBI - subtract immediate
                             3 => x"FE20054",       -- SUB - subtract registers
                             
                             -- Loading & Storing
                             4 => x"FE2000C",       -- LD - load from memory
                             5 => x"FE20001",       -- ST - store to memory
                             
                             -- Incrementing & Decrementing
                             6 => x"FE20014",       -- INC - increment register
                             7 => x"FE20064",       -- DEC - decrement register
                             
                             -- Logical Operators
                             8 => x"FE20084",       -- AND - logical and
                             9 => x"FE200A4",       -- OR - logical or
                             10 => x"FE200C4",      -- XOR - logic xor 
                             11 => x"FE200E4",      -- NOT - logical not 
                             
                             -- Shift Left & Right
                             12 => x"A021004",      -- SL - shift left by register          dest == a
                             13 => x"A121004",      -- SLI - shift left by immediate        dest == a
                             14 => x"B021004",      -- SR - shift right by register         dest == a
                             15 => x"B121004",      -- SRI - shift right by immediate       dest == a
                             
                             -- Branching
                             16 => x"FE22000",      -- B - unconcditional branch
                             17 => x"C020000",      -- BEQ - branch if reg = 0
                             
                             -- Shifting left
                             160 => x"A220104",     -- put amount to shift in the result destination
                             161 => x"0000304",     -- put amount to shift in the result destination
                             162 => x"A680000",     -- is the shift amount equal to 0
                             163 => x"0001584",     -- shift left by one
                             164 => x"0000064",     -- decrement amount to shift
                             165 => x"A220000",     -- loop back and check if zero
                             166 => x"FE20804",     -- load the result into dest
                             
                             -- Shifting Right
                             176 => x"B220104",     -- put amount to shift in the result destination
                             177 => x"0000304",     -- put amount to shift in the result destination
                             178 => x"B680000",     -- is the shift amount equal to 0
                             179 => x"0001544",     -- shift right by one
                             180 => x"0000064",     -- decrement amount to shift
                             181 => x"B220000",     -- loop back and check if zero
                             182 => x"FE20804",     -- load the result into dest            
                             
                             -- BEQ
                             192 => x"1080000",     -- go to unconcditional branch if zero
                             193 => x"FE20000",     -- fetch as normal
                             
                             -- Fetch & Execute
                             254 => x"000C002",     -- Fetch Instruction
                             255 => x"0030000",     -- Execute Instruction
                             others => x"0020000");

begin

    control <= mem(to_integer(unsigned(address))) after gate_delay;

end behaviour;
