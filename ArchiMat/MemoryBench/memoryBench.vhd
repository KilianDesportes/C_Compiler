library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity memoryBench is
    Port ( adr : in  STD_LOGIC_VECTOR (7 downto 0);
           entree : in  STD_LOGIC_VECTOR (7 downto 0);
           rw : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           sortie : out  STD_LOGIC_VECTOR (7 downto 0));
end memoryBench;

architecture dataMemory of memoryBench is
	type regs is array (integer range 15 downto 0) of STD_LOGIC_VECTOR(7 downto 0);
	signal reg: regs;
begin

	process(CLK) is 
	
	begin
	
		if (CLK'event and CLK = '0') then --synchronisation sur l'horloge front descendant
		
			if (RST = '0') then
				reg <= (others => (others => '0'));
			end if;
			
			if (rw = '1') then 
	
				sortie <= reg(conv_integer(adr));
			
			elsif(rw = '0') then 
			
				reg(conv_integer(adr)) <= entree;
				
			end if;
		end if;
			
	end process;
	
	
	
end dataMemory;

