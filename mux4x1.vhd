library IEEE;
use IEEE.Std_Logic_1164.all;

entity mux4x1 is
port (w: in std_logic_vector(19 downto 0);--entrada do mux.
		x: in std_logic_vector(19 downto 0);--entrada do mux.
		y: in std_logic_vector(19 downto 0);--entrada do mux.
		z: in std_logic_vector(19 downto 0);--entrada do mux.
		s: in std_logic_vector(1 downto 0);--entrada de seleção.
		m: out std_logic_vector(19 downto 0)--saída do mux que será uma das entradas conforme o valor do bit de seleção.
		);
end mux4x1;

architecture mux4x1_estr of mux4x1 is
begin
	m <= w when s = "00" else-- abordagem comportamental.
		  x when s = "01" else
		  y when s = "10" else
		  z;
end mux4x1_estr;


		