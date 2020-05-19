LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

 
ENTITY TestProc IS
END TestProc;
 
ARCHITECTURE behavior OF TestProc IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Processor
    PORT(
         RST_Processor : IN  std_logic;
         CLK_Processor : IN  std_logic;
         IP : IN  std_logic_vector(7 downto 0)
        );
    END COMPONENT;

   --Inputs
   signal RST_Processor : std_logic := '0';
   signal CLK_Processor : std_logic := '0';
   signal IP : std_logic_vector(7 downto 0);


   -- Clock period definitions
   constant CLK_Processor_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Processor PORT MAP (
          RST_Processor => RST_Processor,
          CLK_Processor => CLK_Processor,
          IP => IP
        );

   -- Clock process definitions
   CLK_Processor_process :process
   begin
		CLK_Processor <= '0';
		wait for CLK_Processor_period/2;
		CLK_Processor <= '1';
		wait for CLK_Processor_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin	
  
		RST_Processor <= '0';
		
      wait for 100 ns;	

		RST_Processor <= '1';		
		
		IP <= x"00";

      wait for CLK_Processor_period;
		
		IP <= x"01";
		
		wait for CLK_Processor_period;
		
		IP <= x"02";
		
		wait for CLK_Processor_period;
		
		IP <= x"03";
		
		wait for CLK_Processor_period;
		
		IP <= x"04";
		
		wait for CLK_Processor_period;
		
		--IP <= x"05";
		
      wait;
   end process;

END;
