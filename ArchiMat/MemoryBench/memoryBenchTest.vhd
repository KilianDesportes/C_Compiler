--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:12:01 05/07/2020
-- Design Name:   
-- Module Name:   C:/Xilinx/13.4/ISE_DS/ArchiMat/MemoryBench/memoryBenchTest.vhd
-- Project Name:  MemoryBench
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: memoryBench
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY memoryBenchTest IS
END memoryBenchTest;
 
ARCHITECTURE behavior OF memoryBenchTest IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT memoryBench
    PORT(
         adr : IN  std_logic_vector(7 downto 0);
         entree : IN  std_logic_vector(7 downto 0);
         rw : IN  std_logic;
         rst : IN  std_logic;
         clk : IN  std_logic;
         sortie : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal adr : std_logic_vector(7 downto 0) := (others => '0');
   signal entree : std_logic_vector(7 downto 0) := (others => '0');
   signal rw : std_logic := '0';
   signal rst : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal sortie : std_logic_vector(7 downto 0);
	

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: memoryBench PORT MAP (
          adr => adr,
          entree => entree,
          rw => rw,
          rst => rst,
          clk => clk,
          sortie => sortie
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
	
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		
		rst <= '1';
		
		wait for clk_period*10;

		 adr <= x"00";
		 entree <= "10100010";
		 rw <= '0';

      wait for clk_period*10;

		 adr <= x"01";
		 entree <= "11111111";
		 rw <= '0';
		 
		wait for clk_period*10;

		 adr <= x"00";
		 rw <= '1';
		 
		wait for clk_period*10;

		 adr <= x"01";
		 rw <= '1';

      wait;
   end process;

END;
