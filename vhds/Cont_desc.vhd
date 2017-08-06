library IEEE;
use IEEE.Std_Logic_1164.all;
use IEEE.Std_Logic_unsigned.all;
use IEEE.Std_Logic_arith.all;

entity Cont_desc is
	port ( CLK1, rst, en: in std_logic;
			 S: out std_logic_vector(9 downto 0)
	);
end Cont_desc;

architecture Cont_desc_estr of Cont_desc is

	signal cont: std_logic_vector(9 downto 0):="1111101100";--valor inicial dos créditos 1004.

begin

	S <= cont;
	
	process ( CLK1, rst)
		begin
			if rst = '0' then
				cont <= "1111101100";
			elsif (CLK1'event and CLK1 = '1') then
				if en = '1' then
					cont <= cont - '1';
				end if;
			end if;
	end process;
end Cont_desc_estr;
