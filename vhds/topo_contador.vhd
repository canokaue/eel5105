library ieee;
use ieee.std_logic_1164.all;

entity topo_contador is
	port (BTN0, SEL_LED, CLOCK_50: in std_logic;
			SEL_DISP: in std_logic_vector(1 downto 0);
			CONTA_ASC: out std_logic_vector(19 downto 0);
			CONTA_DESC: out std_logic_vector(9 downto 0)
			);
end topo_contador;

architecture topo_contador_arch of topo_contador is

signal CLK1, CLK2: std_logic;
signal CONTA_ASC1: std_logic_vector(15 downto 0);
signal RST_CONT, RST_DESC: std_logic;
component FSM_clock
	port(	clock, reset: in std_logic;
			c1, c2: out std_logic			
		  );
	end component;
	
component Cont_desc
	port ( CLK1, rst, en: in std_logic;
			  S: out std_logic_vector(9 downto 0)
			);
end component;

component Cont_asc
	port ( clk, rst: in std_logic;
			 s: out std_logic_vector(15 downto 0)
			);
	end component;
	
begin
 
	RST_CONT <= '0' when BTN0 = '0' or SEL_DISP = "00" or SEL_DISP = "01" or SEL_DISP = "10" else 
					'1';--lógica de reset do contador ascendente, conforme a saída SEL_DISP que vem da FSM_control ou o acionamento do BTN0.

	RST_DESC <= '0' when BTN0 = '0' or SEL_DISP = "00" else
					'1';--lógica de reset do contador descendente do saldo.

	L0: FSM_clock port map(CLOCK_50, BTN0, CLK1, CLK2);
	L1: Cont_desc port map(CLK2, RST_DESC, SEL_LED, CONTA_DESC);
	L2: Cont_asc port map(CLK1, RST_CONT, CONTA_ASC1);

	CONTA_ASC <= '0' & CONTA_ASC1(15 downto 12) & '0' & CONTA_ASC1(11 downto 8) & '0' & CONTA_ASC1(7 downto 4) & '0' & CONTA_ASC1(3 downto 0);
   --concatenação de um zero aos sinais de 4 bits criados para contagem dos segundos e minutos do contador ascendente.
end topo_contador_arch;