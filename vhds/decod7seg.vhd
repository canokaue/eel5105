library IEEE;
use IEEE.Std_Logic_1164.all;

entity decod7seg is
port (C: in std_logic_vector(4 downto 0);
		F: out std_logic_vector(6 downto 0)
		);
end decod7seg;

architecture decod7seg_estr of decod7seg is
begin
	F <= "1000000" when C = "00000" else--0--O
		  "1111001" when C = "00001" else--1--I
		  "0100100" when C = "00010" else--2--Z
		  "0110000" when C = "00011" else--3
		  "0011001" when C = "00100" else--4
		  "0010010" when C = "00101" else--5--S		  
		  "0000010" when C = "00110" else--6		  
		  "1111000" when C = "00111" else--7		  
		  "0000000" when C = "01000" else--8		  
		  "0010000" when C = "01001" else--9--g		  
		  "0001000" when C = "01010" else--A
		  "0000011" when C = "01011" else--b		  
		  "1000110" when C = "01100" else--C		  
		  "0100001" when C = "01101" else--d		  
		  "0000110" when C = "01110" else--E		  
		  "0001110" when C = "01111" else--F		  
		  "0001001" when C = "10000" else--H--X		  
		  "1100001" when C = "10001" else--J		  
		  "0000101" when C =	"10010" else--K		  
		  "1000111"	when C =	"10011" else--L		  
		  "0100011"	when C =	"10100" else--m		  
		  "1001000" when C =	"10101" else--n		  
		  "0001100" when C =	"10110" else--P		  
		  "0011000" when C =	"10111" else--q		  
		  "0101111" when C =	"11000" else--r		  
		  "0000111" when C =	"11001" else--t
		  "1000001"	when C =	"11010" else--U--V		  
		  "0101011"	when C =	"11011" else--W
		  "0010001"	when C =	"11100" else--Y
		  "1111111";--espaço
end decod7seg_estr;