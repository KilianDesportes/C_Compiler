LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

 
ENTITY RegisterBenchTest IS
END RegisterBenchTest;
 
ARCHITECTURE behavior OF RegisterBenchTest IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RegisterBench
    PORT(
         adrA : IN  std_logic_vector(3 downto 0);
         adrB : IN  std_logic_vector(3 downto 0);
         adrW : IN  std_logic_vector(3 downto 0);
         W : IN  std_logic;
         DATA : IN  std_logic_vector(7 downto 0);
         RST : IN  std_logic;
         CLK : IN  std_logic;
         QA : OUT  std_logic_vector(7 downto 0);
         QB : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal adrA : std_logic_vector(3 downto 0) := (others => '0');
   signal adrB : std_logic_vector(3 downto 0) := (others => '0');
   signal adrW : std_logic_vector(3 downto 0) := (others => '0');
   signal W : std_logic := '0';
   signal DATA : std_logic_vector(7 downto 0) := (others => '0');
   signal RST : std_logic := '0';
   signal CLK : std_logic := '0';

 	--Outputs
   signal QA : std_logic_vector(7 downto 0);
   signal QB : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RegisterBench PORT MAP (
          adrA => adrA,
          adrB => adrB,
          adrW => adrW,
          W => W,
          DATA => DATA,
          RST => RST,
          CLK => CLK,
          QA => QA,
          QB => QB
        );
		  
   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		
		RST <= '1';

      wait for CLK_period*10;
		
			 adrW <= "0001";
			 W <= '1';
			 DATA <= "10101010";
			 
		wait for CLK_period*10;
		
			 adrW <= "0010";
			 W <= '1';
			 DATA <= "11110000";
			 
		wait for CLK_period*10;
		
			 adrA <= "0001";			 
			 adrB <= "0010";
			 W <= '0';

      wait;
   end process;

END;
