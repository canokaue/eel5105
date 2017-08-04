library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity FSM_control is
	port (PASS_CERTO, BTN3, BTN0, SALDO, CLOCK_50: in std_logic;
			C3, C2, C1, C0, SEL_LED, TESTE_PASS: out std_logic;
			SEL_DISP, TENTATIVAS: out std_logic_vector(1 downto 0);
			ESTADOS: out std_logic_vector(4 downto 0)
			);
end FSM_control;

architecture bhv of FSM_control is
type STATES is (E0, E1, E2, E3, E4, E5, E6, E7, E8);
signal EA, PE: STATES;
signal TENT_A, TENT_P: std_logic_vector(1 downto 0);

begin	


TENTATIVAS <= TENT_A;--signal criado para que se pudesse incrementar a saída TENTATIVAS.
			
P1: process(CLOCK_50, BTN0)
		begin
			if BTN0= '0' then--reset assíncrono do controlador.	
				EA <= E0;
			elsif CLOCK_50'event and CLOCK_50= '1' then--clock na borda de subida.
				EA <= PE;
				TENT_A<=TENT_P;
				
			end if;
	 end process;

P2: process(EA, BTN3, TENT_A, PASS_CERTO, SALDO)
begin
	TENT_P<=TENT_A;
	C3 <= '0';--definido todos os enables dos registradores em '0' e atualizado em cada estado apenas o enable necessário.
	C2 <= '0';
	C1 <= '0';
	C0 <= '0';
	TESTE_PASS <= '0';
	SEL_DISP <= "01";
	SEL_LED <= '0';
	case EA is
		when E0 =>			
			if BTN3 = '0' then--botão enter em cada estado habilitando para o estado seguinte.
				PE <= E1;
			else
				PE <= E0;
			end if;
			ESTADOS <= "00000";
			SEL_LED <= '0';
			SEL_DISP <= "00";
			TENT_P<="00";
		when E1 =>			
			if BTN3 = '0' then
				PE <= E2;
			else
				PE <= E1;
			end if;
			ESTADOS <= "00001";
			SEL_DISP <= "01";
			TESTE_PASS <= '0';			
		when E2 =>			
			if BTN3 = '0' then
				PE <= E3;
			else
				PE <= E2;
			end if;
			ESTADOS <= "00010";
			C3 <= '1';		
		when E3 =>			
			if BTN3 = '0' then
				PE <= E4;
			else
				PE <= E3;
			end if;
			ESTADOS <= "00011";
			C2 <= '1';		
		when E4 =>			
			if BTN3 = '0' then
				PE <= E5;
			else
				PE <= E4;
			end if;
			ESTADOS <= "00100";
			C1 <= '1';	
		when E5 =>			
			if BTN3 = '0' then
				PE <= E6;
			else
				PE <= E5;
			end if;
			ESTADOS <= "00101";
			C0 <= '1';			
		when E6 =>							
			TENT_P <= TENT_A + '1';--incremento das tentativas de senha.
			if (TENT_A="11") and (PASS_CERTO='0') then
				PE <= E0;	
			
			else	if ((TENT_A = "01") or (TENT_A = "10") or (TENT_A = "00")) and (PASS_CERTO = '0') then
					PE <= E1;--logica para voltar ao E1 enquanto não se esgotam todas as 4 tentativas.
			
			else
				PE <= E7;
			end if;
				end if;
			ESTADOS <= "00110";
			TESTE_PASS <= '1';
			C0 <= '0';						
		when E7 =>			
			if BTN3 = '0' then
				PE <= E8;
			else
				PE <= E7;
			end if;
			ESTADOS <= "00111";
			SEL_DISP <= "10";
			C3 <= '1';--todos os enables dos registradores habilitados e SEL_DISP selecionando a AGENDA no mux 4x1.
			C2 <= '1';
			C1 <= '1';
			C0 <= '1';	
		when E8 =>			
			if SALDO = '0' then
				PE <= E0;
			elsif (BTN3 = '0') then
				PE <= E7;
			else
				PE <= E8;
			end if;
			ESTADOS <= "01000";
			SEL_DISP <= "11";
			SEL_LED <= '1';
			C3 <= '1';--todos os enables dos registradores habilitados e SEL_DISP selecionando a contagem ascendente do tempo de ligação.
			C2 <= '1';
			C1 <= '1';
			C0 <= '1';	
		end case;
end process;
end bhv;