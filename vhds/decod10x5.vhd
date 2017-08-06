library IEEE;
use IEEE.Std_Logic_1164.all;

entity decod10x5 is
port (C: in std_logic_vector(9 downto 0);		
		F: out std_logic_vector(4 downto 0)
		);
end decod10x5;

architecture decod10x5_estr of decod10x5 is
begin
	F <= "00000" when C = "0000000001" else--0
		  "00001" when C = "0000000010" else--1
		  "00010" when C = "0000000100" else--2
		  "00011" when C = "0000001000" else--3
		  "00100" when C = "0000010000" else--4
		  "00101" when C = "0000100000" else--5		  
		  "00110" when C = "0001000000" else--6		  
		  "00111" when C = "0010000000" else--7		  
		  "01000" when C = "0100000000" else--8		  
		  "01001" when C = "1000000000" else--9
		  "11111";
end decod10x5_estr;

