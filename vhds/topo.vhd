library ieee;
use ieee.std_logic_1164.all;

entity topo is
port (SW: in std_logic_vector(9 downto 0);
		KEY: in std_logic_vector(3 downto 0);
		CLOCK_50: in std_logic;
		HEX5: out std_logic_vector(6 downto 0);
		HEX4: out std_logic_vector(6 downto 0);
		HEX3: out std_logic_vector(6 downto 0);
		HEX2: out std_logic_vector(6 downto 0);
		HEX1: out std_logic_vector(6 downto 0);
		HEX0: out std_logic_vector(6 downto 0);
		LEDR: out std_logic_vector(9 downto 0)		
		);
end topo;

architecture topo_arch of topo is
 signal CONTA_ASC:  std_logic_vector(19 DOWNTO 0);
 signal AGENDA, PASSWORD, REG: std_logic_vector(19 downto 0);
 signal LED_OUT, CONTA_DESC: std_logic_vector(9 downto 0);
 signal ESTADOS, SEQ_3, SEQ_2, SEQ_1, SEQ_0: std_logic_vector(4 downto 0);
 signal TENTATIVAS, SEL_DISP: std_logic_vector(1 downto 0);
 signal C3, C2, C1, C0, CLK1, CLK2: std_logic;
 signal BTN3, BTN2, BTN1, BTN0: std_logic; 
 signal SEL_LED, TESTE_PASS, PASS_CERTO, SALDO: std_logic;

component FSM_control
	port (PASS_CERTO, BTN3, BTN0, SALDO, CLOCK_50: in std_logic;
			C3, C2, C1, C0, SEL_LED, TESTE_PASS: out std_logic;
			SEL_DISP, TENTATIVAS: out std_logic_vector(1 downto 0);
			ESTADOS: out std_logic_vector(4 downto 0)
			);
end component;

 
component topo_reg
	port (BTN0, C3, C2, C1, C0, CLOCK_50: IN STD_LOGIC;
			REG: IN STD_LOGIC_VECTOR(19 downto 0);
			SEQ_3, SEQ_2, SEQ_1, SEQ_0 : OUT STD_LOGIC_VECTOR(4 downto 0)
			);
end component;

component topo_selec
	 port (SW: in std_logic_vector(9 downto 0);
			AGENDA: in std_logic_vector(19 downto 0);
			CONTA_ASC: in std_logic_vector(19 downto 0);
			CONTA_DESC: in std_logic_vector(9 downto 0);
			SEL_DISP: in std_logic_vector(1 downto 0);
			TENTATIVAS: in std_logic_vector(1 downto 0);
			SEL_LED: in std_logic;
			REG: out std_logic_vector(19 downto 0);
			LED_OUT: out std_logic_vector(9 downto 0)
			);
end component;

component topo_comparadores
	port (SEQ_3, SEQ_2, SEQ_1, SEQ_0 : IN STD_LOGIC_VECTOR(4 downto 0);
			CONTA_DES: IN STD_LOGIC_VECTOR(9 downto 0);
			TESTE_PASS: IN STD_LOGIC;
			PASS_CERTO, SALDO : OUT STD_LOGIC
			);
end component;
 
component ROM
	port ( address: in std_logic_vector(3 downto 0);
         data: out std_logic_vector(19 downto 0) );
end component;

component ButtonSync
	port(
		-- Input ports
		key0	: in  std_logic;
		key1	: in  std_logic;
		key2	: in  std_logic;
		key3	: in  std_logic;	
		clk : in std_logic;
		-- Output ports
		btn0	: out std_logic;
		btn1	: out std_logic;
		btn2	: out std_logic;
		btn3	: out std_logic
		);
end component;

component decod7seg
	port (C: in std_logic_vector(4 downto 0);
			F: out std_logic_vector(6 downto 0)
			);
end component;

component topo_contador
	port (BTN0, SEL_LED, CLOCK_50: in std_logic;
			SEL_DISP: in std_logic_vector(1 downto 0);
			CONTA_ASC: out std_logic_vector(19 downto 0);
			CONTA_DESC: out std_logic_vector(9 downto 0)
			);
end component;

begin
HEX5 <= "0000110";
LEDR <= LED_OUT;
L00: FSM_control port map (PASS_CERTO, BTN3, BTN0, SALDO, CLOCK_50, C3, C2, C1, C0, SEL_LED, TESTE_PASS, SEL_DISP, TENTATIVAS, ESTADOS);
L01: topo_reg port map (BTN0, C3, C2, C1, C0, CLOCK_50, REG, SEQ_3, SEQ_2, SEQ_1, SEQ_0);
L02: topo_selec port map (SW, AGENDA, CONTA_ASC, CONTA_DESC, SEL_DISP, TENTATIVAS, SEL_LED, REG, LED_OUT);
L03: topo_comparadores port map (SEQ_3, SEQ_2, SEQ_1, SEQ_0, CONTA_DESC, TESTE_PASS, PASS_CERTO, SALDO);
L04: ROM port map (SW(3 downto 0), AGENDA); 
L05: ButtonSync port map (KEY(0), KEY(1), KEY(2), KEY(3), CLOCK_50, BTN0, BTN1, BTN2, BTN3);
L06: decod7seg port map (ESTADOS, HEX4);
L07: decod7seg port map (SEQ_3, HEX3);
L08: decod7seg port map (SEQ_2, HEX2);
L09: decod7seg port map (SEQ_1, HEX1);
L10: decod7seg port map (SEQ_0, HEX0);
L11: topo_contador port map (BTN0, SEL_LED, CLOCK_50, SEL_DISP, CONTA_ASC, CONTA_DESC);

end topo_arch;