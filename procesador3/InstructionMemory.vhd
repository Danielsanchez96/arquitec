library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;
use std.textio.all;

entity InstructionMemory is
    Port ( Address : in  STD_LOGIC_VECTOR (31 downto 0);
           rst : in  STD_LOGIC;
           Instruction : out  STD_LOGIC_VECTOR (31 downto 0));
end InstructionMemory;

architecture arq_InstructionMemory of InstructionMemory is

type rom_type is array (0 to 63) of std_logic_vector (31 downto 0);
		
	signal instructions : rom_type := (X"01000000",
	--instrucciones
												  "10100000000100000010000000000000",-- mov 0,%l0 mult
												  "10100010000100000010000000000000",-- mov 0,%l1
												  "10000000101001000100000000010011",-- cmp %l1,%l3
												  "00110110100000000000000000001000",-- bge a, exit
												  "10101000000001000000000000010010",-- add %l0,%l2,%l4 for
												  "10100000000100000000000000010100",-- mov %l4, %l0
												  "10101000000001000110000000000001",-- add %l1,1,%l4
												  "10101000000001000110000000000001",-- mov %l4,%l1
												  "10000000101001000100000000010011",-- cmp %l1, %l3
												  "00000110101111111111111111111011",-- bl a, for
												  "10010000000100000000000000010000",-- mov %l0, %o0 
												  "10000011110000111110000000000000",-- jmpl %o7,0,%g1
												  "00000001000000000000000000000000",-- nop
												  "10100100000100000010000000000101",-- mov 5,%l2
												  "10100110000100000010000000000011",-- mov 3,%l3
												  "01111111111111111111111111110001",-- call mult(15)
												  "00000001000000000000000000000000",-- nop
												  X"01000000", X"01000000", 
												  X"01000000", X"01000000", X"01000000", X"01000000", 
												  X"01000000", X"01000000", X"01000000", X"01000000", 
												  X"01000000", X"01000000", X"01000000", X"01000000", 
												  X"01000000", X"01000000", X"01000000", X"01000000", 
												  X"01000000", X"01000000", X"01000000", X"01000000", 
												  X"01000000", X"01000000", X"01000000", X"01000000", 
												  X"01000000", X"01000000", X"01000000", X"01000000", 
												  X"01000000", X"01000000", X"01000000", X"01000000", 
												  X"01000000", X"01000000", X"01000000", X"01000000", 
												  X"01000000", X"01000000", X"01000000", X"01000000", 
												  X"01000000", X"01000000", X"01000000", X"01000000");
	
	begin
		process (rst, Address)
			begin
				if (rst = '1') then
					Instruction <= (others => '0');
				else
					Instruction <= instructions(conv_integer(address(5 downto 0)));--retorna en entero la posicion de la matriz
				end if;
		end process;
end arq_InstructionMemory;

