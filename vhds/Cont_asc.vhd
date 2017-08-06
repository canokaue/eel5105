library IEEE;
use IEEE.Std_Logic_1164.all;
use IEEE.Std_Logic_unsigned.all;
use IEEE.Std_Logic_arith.all;


entity Cont_asc is
	port ( clk, rst: in std_logic;--a lógica de reset do contador ascendente está definida no topo contador.
			 s: out std_logic_vector(15 downto 0)
			);
	end Cont_asc;

architecture Cont_asc_estr of Cont_asc is
signal s0, s1, m0, m1: std_logic_vector(3 downto 0):="0000";--signals definidos para receber a contagem de segundos e minutos.
begin

	s <= m1 & m0 & s1 & s0;--signals concatenados atribuídos a saída "s" do contador.
				
	process (clk,rst)
		begin
			if rst = '0' then
				s0 <= "0000";
				s1 <= "0000";
				m0 <= "0000";
				m1 <= "0000";
			elsif (clk'event and clk = '1') then

				
				s0 <= s0+'1';
				
				if s0 = "1001" then
					s0 <= "0000";
					s1 <= s1+1;
				
					if s1 = "0101" then
						s1 <= "0000";
						m0 <= m0+1;
					
						if m0 = "1001" then
							m0 <= "0000";
							m1 <= m1+1;
		
							if m1 = "0101" then
								m1 <= "0000";
							end if;
						end if;
					end if;
				end if;
			end if;	
		end process;
end Cont_asc_estr;