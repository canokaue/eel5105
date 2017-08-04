library ieee;
use ieee.std_logic_1164.all;

entity topo_selec is
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
end topo_selec;

architecture topo_selec_arch of topo_selec is

signal S: std_logic_vector(9 downto 0);
signal S0: std_logic_vector(19 downto 0);
signal S1: std_logic_vector(19 downto 0);
signal IN_PASS: std_logic_vector(4 downto 0);

component decod10x5
	port (C: in std_logic_vector(9 downto 0);		
			F: out std_logic_vector(4 downto 0)
			);
end component;

component mux2x1
	port (x: in std_logic_vector(9 downto 0);
		y: in std_logic_vector(9 downto 0);		
		s: in std_logic;
		m: out std_logic_vector(9 downto 0)
		);
end component;

component mux4x1
	port (w: in std_logic_vector(19 downto 0);
		x: in std_logic_vector(19 downto 0);
		y: in std_logic_vector(19 downto 0);
		z: in std_logic_vector(19 downto 0);
		s: in std_logic_vector(1 downto 0);
		m: out std_logic_vector(19 downto 0)
		);
end component;
	
begin

S <= TENTATIVAS&"00000000";
S0 <= "00000000000000000000";
S1 <= IN_PASS&IN_PASS&IN_PASS&IN_PASS;

L0: decod10x5 port map (SW, IN_PASS);
L1: mux2x1 port map (S, CONTA_DESC, SEL_LED, LED_OUT);
L2: mux4x1 port map (S0, S1, AGENDA, CONTA_ASC, SEL_DISP, REG);

end topo_selec_arch;

