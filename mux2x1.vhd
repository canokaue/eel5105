library IEEE;
use IEEE.Std_Logic_1164.all;

entity mux2x1 is
port (x: in std_logic_vector(9 downto 0);--entrada do mux.
		y: in std_logic_vector(9 downto 0);--entrada do mux.		
		s: in std_logic;--entrada de seleção.
		m: out std_logic_vector(9 downto 0)--saída do mux que será uma das entradas conforme o valor do bit de seleção.
		);
end mux2x1;

architecture mux2x1_estr of mux2x1 is
begin
	m <= x when s = '0' else-- abordagem comportamental.
		  y;
end mux2x1_estr;


		