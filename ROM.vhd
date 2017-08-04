library ieee;
use ieee.std_logic_1164.all;

entity ROM is
  port ( address : in std_logic_vector(3 downto 0);
         data : out std_logic_vector(19 downto 0) );
end entity ROM;

architecture behavioral of ROM is
  type mem is array ( 0 to 2**4 - 1) of std_logic_vector(19 downto 0);
  constant my_Rom : mem := (
    0  => "01010100110111001100",--ALEC
    1  => "01010101011010101010",--ANNA
    2  => "01011010101100011001",--BART
    3  => "01011011101100110000",--BETH
    4  => "01001000001001011010",--GOKU
    5  => "10000110100100100000",--HUGO
    6  => "10001000001010110000",--JONH
    7  => "10001110101001100001",--JULI
    8  => "10011000010110100001",--LIDY
    9  => "10011000010010101010",--LISA
    10 => "10011110101001101010",--LULA
    11 => "10100010101100011100",--MARY
    12 => "11000000010110010010",--RICK
    13 => "11000000000010101110",--ROSE
    14 => "11000110100101111100",--RUBY
    15 => "00101110100001011100"--SUZY
    );
begin
   process (address)
   begin
     case address is
       when "0000" => data <= my_rom(0);
       when "0001" => data <= my_rom(1);
       when "0010" => data <= my_rom(2);
       when "0011" => data <= my_rom(3);
       when "0100" => data <= my_rom(4);
       when "0101" => data <= my_rom(5);
       when "0110" => data <= my_rom(6);
       when "0111" => data <= my_rom(7);
       when "1000" => data <= my_rom(8);
       when "1001" => data <= my_rom(9);
       when "1010" => data <= my_rom(10);
       when "1011" => data <= my_rom(11);
       when "1100" => data <= my_rom(12);
       when "1101" => data <= my_rom(13);
       when "1110" => data <= my_rom(14);
       when "1111" => data <= my_rom(15);       
       when others => data <= "00000000000000000000";
	 end case;
  end process;
end architecture behavioral;