library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity FSM_clock is
port(	clock, reset: in std_logic;
		c1, c2: out std_logic		
	  );
	  
end FSM_clock;

architecture bhv of FSM_clock is

signal contador_1, contador_2 : integer := 0;--definido signal como inteiro para os valores da frequência de entrada e 1/4 dela.

begin

P1: process(clock, reset)--process que vai definir o clock de 1hz para o contador ascendente do tempo.
begin
	if reset= '0' then
	   contador_1 <= 0;
	elsif clock'event and clock= '1' then
	   contador_1 <= contador_1 + 1;
		if contador_1 >= 50000000 then
         contador_1 <= 0;
         c1 <= '1';
      else
         c1 <= '0';
		end if;
	end if;
end process;

P2: process(clock, reset)--vai definir o clock de 4hz para a contagem decrescente dos créditos.
begin
	if reset= '0' then
	   contador_2 <= 0;
	elsif clock'event and clock= '1' then
	   contador_2 <= contador_2 + 1;
		if contador_2 >= 12500000 then
         contador_2 <= 0;
         c2 <= '1';
      else
         c2 <= '0';
		end if;
	end if;
end process;


end bhv;


