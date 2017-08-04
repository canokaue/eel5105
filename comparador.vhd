library IEEE;
use IEEE.Std_Logic_1164.all;

entity comparador is
	port (SEQ3_0: in std_logic_vector(19 downto 0);--os sinais de 5 bits que vem da saída dos registradores são concatenados em
			OK: out std_logic                        --um único sinal na entrada do comparador.
			);
	end comparador;

architecture comparador_estr of comparador is

signal PASSWORD: std_logic_vector(19 downto 0);

begin

PASSWORD <= "00001000010010000010";--Atribuído ao signal PASSWORD o valor de 20 bits correspondente a senha. Cada 5 
OK <= '1' when PASSWORD=SEQ3_0 else '0';--bits da senha corresponde aos decimais 1142.

end comparador_estr;