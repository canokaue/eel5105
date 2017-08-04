library ieee;
use ieee.std_logic_1164.all;

entity reg_5bits is
port (EN, CLK, RST: in std_logic;
		D: in std_logic_vector(4 downto 0);
		Q: out std_logic_vector(4 downto 0)		
		);
end reg_5bits;

architecture bhv of reg_5bits is
begin
	process(CLK, D)
	begin
		if RST = '0' then--reset assíncrono do registrador.
			Q <= "00000";
			elsif
				(CLK' event and CLK ='1') then--clock na borda de subida.
				if EN = '1' then
					Q <= D;
				end if;			
		end if;
	end process;
end bhv;

