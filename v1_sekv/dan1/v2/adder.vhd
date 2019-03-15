
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_signed.all;


entity adder is
    Port ( A_in : in  STD_LOGIC_VECTOR (7 downto 0);
           B_in : in  STD_LOGIC_VECTOR (7 downto 0);
           Sel_in : in  STD_LOGIC;
           Rez_out : out  STD_LOGIC_VECTOR (8 downto 0));
end adder;

architecture Behavioral of adder is

signal B_2k: STD_LOGIC_VECTOR (7 downto 0);
signal rez: STD_LOGIC_VECTOR (8 downto 0);
begin
	process(A_in, B_in, Sel_in)
	begin
		if(B_in(7) = '1') then
			B_2k <= (B_in(7) & (NOT B_in(6 downto 0))) + 1;
		else 
			B_2k <= B_in;
		end if;
		if(Sel_in = '0') then
			rez <= (A_in(7) & A_in) + (B_2k(7) & B_2k);
		else 
			rez <= (A_in(7) & A_in) - (B_2k(7) & B_2k);
		end if;
	end process;


Rez_out <= rez;


end Behavioral;

