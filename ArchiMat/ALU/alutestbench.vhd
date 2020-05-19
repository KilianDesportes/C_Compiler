--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:26:19 04/22/2020
-- Design Name:   
-- Module Name:   C:/Xilinx/13.4/ISE_DS/ALUtest/alutestbench.vhd
-- Project Name:  ALUtest
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALU
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY alutestbench IS
END alutestbench;
 
ARCHITECTURE behavior OF alutestbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         N : OUT  std_logic;
         O : OUT  std_logic;
         Z : OUT  std_logic;
         C : OUT  std_logic;
         A : IN  std_logic_vector(7 downto 0);
         B : IN  std_logic_vector(7 downto 0);
         S : OUT  std_logic_vector(7 downto 0);
         Ctrl_Alu : IN  std_logic_vector(2 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(7 downto 0) := (others => '0');
   signal B : std_logic_vector(7 downto 0) := (others => '0');
   signal Ctrl_Alu : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal N : std_logic;
   signal O : std_logic;
   signal Z : std_logic;
   signal C : std_logic;
   signal S : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          N => N,
          O => O,
          Z => Z,
          C => C,
          A => A,
          B => B,
          S => S,
          Ctrl_Alu => Ctrl_Alu
        );

	CTRL_Alu <= "001", "011" after 40ns,"010" after 100ns;
	A <= "11001100", X"00" after 20ns,"11001100" after 40ns, X"00" after 60ns, "11001111" after 80ns,X"00" after 100ns,"11111111" after 120ns,X"01" after 140ns,"01111111" after 160ns;
	B <= "10101010", X"00" after 20ns,"11001101" after 40ns, X"00" after 60ns, "11001100" after 80ns,X"00" after 100ns,"00000001" after 120ns,X"10" after 140ns,"01111111" after 160ns;


END;
