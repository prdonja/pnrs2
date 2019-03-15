----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity semafor is
    Port ( clk : in  STD_LOGIC;
           reset_n : in  STD_LOGIC;
           Sel_in : in  STD_LOGIC_VECTOR (1 downto 0);
           RGB_A : out  STD_LOGIC_VECTOR (2 downto 0);
           RGB_B : out  STD_LOGIC_VECTOR (2 downto 0));
end semafor;

architecture Behavioral of semafor is
	type state_t is (sR, sY1, sG, sY2);
	signal state, next_state, last_state : state_t;
	signal cnt : std_logic_vector (7 downto 0);
	signal ttc : std_logic_vector (7 downto 0);
begin
	process(reset_n, clk)
	begin
		if(rst = '0')then
			state <= sY1;
			cnt <= (others => '0');
			ttc <= "00000111";
		elsif(clk = '1') then
			cnt <= cnt + 1;
		end if;
	end if;
	end process;

	process(state, Sel_in)
	begin
		case state is
			when sR =>
				next_state <= sY1;
				ttc <= "00000111";
			when sY1 =>
				next_state <= sG;
			when sG =>
				next_state <= sY2;
				ttc <= "00000111";
			when sY2 =>
				next_state <= sR;
		
	end process;

end Behavioral;

