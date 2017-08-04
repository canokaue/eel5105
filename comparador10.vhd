library IEEE;
use IEEE.Std_Logic_1164.all;

entity comparador10 is
	port (CONTA_DES: in std_logic_vector(9 downto 0);		
			SALDO: out std_logic
			);
	end comparador10;

architecture comparador10_estr of comparador10 is

signal SALDO_0: std_logic_vector(9 downto 0);

begin
SALDO_0 <= "0000000000";--signal criado para comparar a saída do contador decrescente com o valor "0".
SALDO <= '0' when SALDO_0=CONTA_DES else '1';

end comparador10_estr;