
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use std.textio.all;



entity InstructionMemory is
	Port ( 
			  address : in  STD_LOGIC_VECTOR (31 downto 0);
           reset : in  STD_LOGIC;
           outInstruction : out  STD_LOGIC_VECTOR (31 downto 0));
end InstructionMemory;

architecture Behavioral of InstructionMemory is

type rom_type is array (0 to 63) of std_logic_vector (31 downto 0);
		
	signal instructions : rom_type := (X"01000000",
	--instrucciones
												  "10000010000100000010000000000101",-- 
												  "10100000000100000011111111111000",-- 
												  "10100010000100000010000000000100",-- 
												  "10110001001011000100000000000010",-- 
												  "10000001111010000000000000000000",-- 
												  "10100000000000000100000000000011",-- 
												  "10000001111000000000000000000000",-- 
												  "10000000101000000000000000000100",--
												  "10000100010000000000000000000001",--
												  "10010000000100000000000000010000",--
												  X"01000000",
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
												  X"01000000", X"01000000", X"01000000", X"01000000", 
												  X"01000000", X"01000000", X"01000000", X"01000000", 
												  X"01000000", X"01000000", X"01000000", X"01000000");
	
	begin
		process (reset, address)
			begin
				if (reset = '1') then
					outInstruction <= (others => '0');
				else
					outInstruction <= instructions(conv_integer(address(5 downto 0)));--retorna en entero la posicion de la matriz
				end if;
		end process;

end Behavioral;

