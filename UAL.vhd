library IEEE;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.all;

entity UAL is
    Port ( N : out  STD_LOGIC;
           O : out  STD_LOGIC;
           Z : out  STD_LOGIC;
           C : out  STD_LOGIC;
           A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           S : out  STD_LOGIC_VECTOR (7 downto 0);
           Ctrl_Alu : in  STD_LOGIC_VECTOR (2 downto 0));
end UAL;

architecture Behavioral of UAL is
    signal TMP : STD_LOGIC_VECTOR(15 downto 0);
begin

    begin
        if Ctrl_Alu = '1' then --Addition

            TMP <= A + B;
            C <= TMP(8); --Carry
            S <= TMP(7 downto 0); --Resultat
            if S = 0 then 
                Z <= '1'; --Valeur nulle            
            end if;

        elsif Ctrl_Alu = '2' then --Multiplication

            TMP <= A * B;
            if TMP(15 downto 8) > 0 then        
                O <= '1';
            end if
            S <= TMP(7 downto 0); --Resultat
            if S < 0 then 
                N <= '1'; --Valeur neg
            elsif S = 0 then 
                Z <= '1'; --Valeur nulle
            end if;

        elsif Ctrl_Alu = '3' then --Soustraction

            TMP <= A - B;
            C <= TMP(8);
            S <= TMP(7 downto 0); --Resultat
            if S = 0 then 
                Z <= '1'; --Valeur nulle
            end if;

        end if;

    end process;

end Behavioral;

