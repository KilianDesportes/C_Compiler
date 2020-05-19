library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;



entity ALU is
Port ( N : out  STD_LOGIC;
           O : out  STD_LOGIC;
           Z : out  STD_LOGIC;
           C : out  STD_LOGIC;
           A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           S : out  STD_LOGIC_VECTOR (7 downto 0);
           Ctrl_Alu : in  STD_LOGIC_VECTOR (2 downto 0));
end ALU;


architecture Behavioral of ALU is
    signal TMP : STD_LOGIC_VECTOR(15 downto 0);
begin

	process(A,B,Ctrl_Alu,TMP) is 
	
	begin
	
        if Ctrl_Alu = "001" then --Addition
		  
				TMP(8 downto 0) <= (b"0" & A) + (b"0" & B);
				TMP(15 downto 9) <= (others => '0');
            C <= TMP(8); --Carry
            S <= TMP(7 downto 0); --Resultat
            if (TMP(7 downto 0) = b"0") then 
                Z <= '1'; --Valeur nulle  
				else
					 Z <= '0';
            end if;

        elsif CONV_INTEGER(Ctrl_Alu) = 2 then --Multiplication

            TMP <= A * B;
            if TMP(15 downto 8) > 0 then        
                O <= '1';
				else
					 O <= '0';
            end if;
            S <= TMP(7 downto 0); --Resultat
            N <= TMP(7);
            if TMP(7 downto 0) = 0 then 
                Z <= '1'; --Valeur nulle
				else
					 Z <= '0';
            end if;

        elsif CONV_INTEGER(Ctrl_Alu) = 3 then --Soustraction

            TMP(8 downto 0) <= (b"0" & A) - (b"0" & B);
				TMP(15 downto 9) <= (others => '0');
            C <= TMP(8);
				N <= TMP(8);
            S <= TMP(7 downto 0); --Resultat
            if TMP(7 downto 0) = 0 then 
                Z <= '1'; --Valeur nulle
				else
					 Z <= '0';
            end if;

        end if;

    end process;

end Behavioral;

