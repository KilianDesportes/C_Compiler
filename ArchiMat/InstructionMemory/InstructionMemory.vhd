library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity InstructionMemory is
    Port ( adr : in  STD_LOGIC_VECTOR (7 downto 0);
           clk : in  STD_LOGIC;
           sortie : out  STD_LOGIC_VECTOR (31 downto 0));
end InstructionMemory;

architecture Behavioral of InstructionMemory is
	type memory is array (integer range 255 downto 0) of STD_LOGIC_VECTOR(31 downto 0);
	signal mem_instruction: memory;
begin

	process(CLK) is 
	
	begin
	
		mem_instruction <=
		(	0 => x"06000500", --AFC @0 0x05 // WORKING
			1 => x"06010200", --AFC @1 0x02 // WORKING
			2 => x"05020000", --COPY @2 @0 // WORKING
			3 => x"01030102", --add @3 @1 @2 // WORKING
			
			-- a ce stade là, on a 
			-- @0 = 5 = 101
			-- @1 = 2 = 10
			-- @2 = 5 = 101
			-- @3 = 7 = 111
			
			4 => x"08000300", --STORE dans la mémoire @0 le registre @3
			--5 => x"07040000", --LOAD adr0 en memoire dans @4 Registre
				
            others => (others=>'0')
        );

	
		if (CLK'event and CLK = '1') then

				sortie <= mem_instruction(conv_integer(adr));
				
		end if;
			
	end process;

end Behavioral;

