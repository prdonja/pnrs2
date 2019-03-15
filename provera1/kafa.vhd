----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity kafa is
    Port ( clk                 : in  STD_LOGIC;
           reset_n             : in  STD_LOGIC;
           coin_avail          : in  STD_LOGIC;
           water_avail         : in  STD_LOGIC;
           coffee_powder_avail : in  STD_LOGIC;
           plastic_glass_avail : in  STD_LOGIC;
           plastic_glass       : out STD_LOGIC;
           coffee_powder       : out STD_LOGIC;
           hot_water           : out STD_LOGIC;
           unlock              : out STD_LOGIC;
           coin_return         : out STD_LOGIC
         );
end kafa;

architecture Behavioral of kafa is

signal cnt: STD_LOGIC_VECTOR(63 downto 0);
type state_t is (IDLE, GLASS, POWDER, COFFEE, UNLOC, RET);
signal state : state_t;
signal state_next : state_t;

begin
	process(clk, reset_n) begin
		if(reset_n = '0') then
			state_next <= IDLE;
		elsif (rising_edge(clk)) then
			case state is
				when IDLE =>
					if coin_avail = '1' then
						state_next <= GLASS;
					end if;
				when GLASS =>
					if plastic_glass_avail = '0' then
						state_next <= RET;
					else
						state_next <= POWDER;
					end if;
				when POWDER =>
					if coffee_powder_avail = '0' then
						state_next <= RET;
					else
						state_next <= COFFEE;
					end if;
				when COFFEE =>
					if water_avail = '0'  then
						state_next <= RET;
					else
						state_next <= UNLOC;
					end if;
				when others =>
					state_next <= IDLE;
			end case;
		end if;
	end process;

	process(clk, reset_n) begin
		if(reset_n = '0') then
			cnt <= (others => '0');
			state <= IDLE;
		elsif(rising_edge(clk)) then
			if (cnt = 199) then
				cnt <= (others => '0');
				state <= state_next;
			
			else
				cnt <= cnt + 1;
			end if;
		end if;
	end process;

	plastic_glass <= '1' when state = GLASS else '0';
	coffee_powder <= '1' when state = POWDER else '0';
	hot_water <= '1' when state = COFFEE else '0';
	unlock <= '1' when state = UNLOC else '0';
	coin_return <= '1' when state = RET else '0';
	



end Behavioral;

