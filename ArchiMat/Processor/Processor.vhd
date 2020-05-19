library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;


entity Processor is
	Port ( RST_Processor : in  STD_LOGIC;
			CLK_Processor : in  STD_LOGIC;
			IP : in STD_LOGIC_VECTOR (7 downto 0));
end Processor;

architecture Behavioral of Processor is

	component InstructionMemory is
   Port ( adr : in  STD_LOGIC_VECTOR (7 downto 0);
           clk : in  STD_LOGIC;
           sortie : out  STD_LOGIC_VECTOR (31 downto 0));
	end component;
	
	
	--on a changé la lecture asynchrone, a tester si ca marche pas
	component RegisterBench is
   Port ( adrA : in  STD_LOGIC_VECTOR (3 downto 0);
           adrB : in  STD_LOGIC_VECTOR (3 downto 0);
           adrW : in  STD_LOGIC_VECTOR (3 downto 0);
           W : in  STD_LOGIC;
           DATA : in  STD_LOGIC_VECTOR (7 downto 0);
           RST : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           QA : out  STD_LOGIC_VECTOR (7 downto 0);
           QB : out  STD_LOGIC_VECTOR (7 downto 0));
	end component;

	component ALU is
	Port ( N : out  STD_LOGIC;
				  O : out  STD_LOGIC;
				  Z : out  STD_LOGIC;
				  C : out  STD_LOGIC;
				  A : in  STD_LOGIC_VECTOR (7 downto 0);
				  B : in  STD_LOGIC_VECTOR (7 downto 0);
				  S : out  STD_LOGIC_VECTOR (7 downto 0);
				  Ctrl_Alu : in  STD_LOGIC_VECTOR (2 downto 0));
	end component;
	
	component memoryBench is
   Port ( adr : in  STD_LOGIC_VECTOR (7 downto 0);
           entree : in  STD_LOGIC_VECTOR (7 downto 0);
           rw : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           sortie : out  STD_LOGIC_VECTOR (7 downto 0));
	end component;

	signal LI_DI_A : STD_LOGIC_VECTOR (7 downto 0);
	signal LI_DI_OP : STD_LOGIC_VECTOR (7 downto 0);
	signal LI_DI_B : STD_LOGIC_VECTOR (7 downto 0);
	signal LI_DI_C : STD_LOGIC_VECTOR (7 downto 0);
	
	signal DI_EX_A : STD_LOGIC_VECTOR (7 downto 0);
	signal DI_EX_OP : STD_LOGIC_VECTOR (7 downto 0);
	signal DI_EX_B : STD_LOGIC_VECTOR (7 downto 0);
	signal DI_EX_C : STD_LOGIC_VECTOR (7 downto 0);
	
	signal EX_Mem_A : STD_LOGIC_VECTOR (7 downto 0);
	signal EX_Mem_OP : STD_LOGIC_VECTOR (7 downto 0);
	signal EX_Mem_B : STD_LOGIC_VECTOR (7 downto 0);
	
	signal Mem_RE_A : STD_LOGIC_VECTOR (7 downto 0);
	signal Mem_RE_OP : STD_LOGIC_VECTOR (7 downto 0);
	signal Mem_RE_B : STD_LOGIC_VECTOR (7 downto 0);

	-- signaux pour Instruction Memory
	signal INSTR : STD_LOGIC_VECTOR (31 downto 0);
	
	-- signaux pour Register Bench
	signal QA : STD_LOGIC_VECTOR (7 downto 0);
	signal W : STD_LOGIC;
	
	-- signaux pour UAL
	signal N : STD_LOGIC;
	signal O : STD_LOGIC;
	signal Z : STD_LOGIC;
	signal C : STD_LOGIC;
	signal S_ALU : STD_LOGIC_VECTOR (7 downto 0);
	signal LC_ALU : STD_LOGIC_VECTOR (2 downto 0);
	
	--signaux pour DATA MEMORY
	signal DATA_OUT : STD_LOGIC_VECTOR (7 downto 0);
	signal LC_RW_DATA : STD_LOGIC;
	signal DATA_adr : STD_LOGIC_VECTOR (7 downto 0);

	
	
	
begin

		INSTRUCTION_MEMORY: InstructionMemory port map(IP,CLK_Processor,INSTR);
		
		REGISTER_BENCH: RegisterBench port map(LI_DI_B(3 downto 0),LI_DI_C(3 downto 0),Mem_RE_A(3 downto 0),W,Mem_RE_B,RST_Processor,CLK_Processor,QA,DI_EX_C);

		UAL: ALU port map(N,O,Z,C,DI_EX_B,DI_EX_C,S_ALU,LC_ALU);
		
		DATA_MEMORY: memoryBench port map(DATA_adr,EX_Mem_B,LC_RW_DATA,RST_Processor,CLK_Processor,DATA_OUT);

		process (CLK_Processor) is 

		begin 
		
			if (CLK_Processor'event and CLK_Processor = '1') then --synchronisation sur l'horloge
			
					LI_DI_OP <= INSTR(31 downto 24);
					LI_DI_A <= INSTR(23 downto 16);
					LI_DI_B <= INSTR(15 downto 8);
					LI_DI_C <= INSTR(7 downto 0);
					
					DI_EX_A <= LI_DI_A;
					
					
					if LI_DI_OP = X"06" or
						LI_DI_OP = X"07" then -- afc or load
						
						DI_EX_B <= LI_DI_B;
						
					else 
					
						DI_EX_B <= QA;

					end if;
					
					DI_EX_OP <= LI_DI_OP;
					
					-- DI_EX_C deja affecté avec le port map au dessus
					
					EX_Mem_A <= DI_EX_A;
					
					
					if DI_EX_OP = X"01" then --ADD

						LC_ALU <= "001";
						EX_Mem_B <= S_ALU;
						
					elsif DI_EX_OP = X"02" then --MUL
					
						LC_ALU <= "010";
						EX_Mem_B <= S_ALU;
						
					elsif DI_EX_OP = X"03" then --SOU
					
						LC_ALU <= "011";
						EX_Mem_B <= S_ALU;
						
					else 
					
						EX_Mem_B <= DI_EX_B;
						
					end if;
					
					EX_Mem_OP <= DI_EX_OP;
					
					Mem_RE_A <= EX_Mem_A;
					
					
					if EX_Mem_OP = X"08" then --store
					
						LC_RW_DATA <= '0';
						DATA_adr <= EX_Mem_A;
						Mem_RE_B <= EX_Mem_B;
						
					elsif EX_Mem_OP = X"07" then --load 
					
						LC_RW_DATA <= '1';
						DATA_adr <= EX_Mem_B;
						Mem_RE_B <= DATA_OUT;
						
						
					else 
					
						Mem_RE_B <= EX_Mem_B;


					end if;
					
					if CONV_INTEGER(Mem_RE_OP) = 8 then --store
		
						W <= '0';
			
					else 
		
						W <= '1';
			
					end if;
					
					Mem_RE_OP <= EX_Mem_OP;
					
			end if;
	
		end process;

end Behavioral;

