library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity RegisterBench is
    Port ( adrA : in  STD_LOGIC_VECTOR (3 downto 0);
           adrB : in  STD_LOGIC_VECTOR (3 downto 0);
           adrW : in  STD_LOGIC_VECTOR (3 downto 0);
           W : in  STD_LOGIC;
           DATA : in  STD_LOGIC_VECTOR (7 downto 0);
           RST : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           QA : out  STD_LOGIC_VECTOR (7 downto 0);
           QB : out  STD_LOGIC_VECTOR (7 downto 0));
end RegisterBench;

architecture Behavioral of RegisterBench is
	type regs is array (integer range 15 downto 0) of STD_LOGIC_VECTOR(7 downto 0);
	signal reg: regs;
begin



	process(CLK) is 
	
	begin
	
		QA <= reg(conv_integer(adrA));
		QB <= reg(conv_integer(adrB));

		if (CLK'event and CLK = '1') then
		
			if (RST = '0') then
				reg <= (others => (others => '0'));
			end if;
			
			if (W = '1') then 
				reg(conv_integer(adrW)) <= DATA;
				if adrA = adrW then 
					QA <= DATA;
				end if;
				if adrB = adrW then 
					QB <= DATA;
				end if;
				
			end if;
			
		end if;
			
	end process;
	

	
end Behavioral;