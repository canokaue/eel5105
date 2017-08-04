library ieee;
use ieee.std_logic_1164.all;

entity topo_comparadores is
port (SEQ_3, SEQ_2, SEQ_1, SEQ_0 : IN STD_LOGIC_VECTOR(4 downto 0);
		CONTA_DES: IN STD_LOGIC_VECTOR(9 downto 0);
		TESTE_PASS: IN STD_LOGIC;
		PASS_CERTO, SALDO : OUT STD_LOGIC
		);
end topo_comparadores;

architecture topo_comparadores_arch of topo_comparadores is

signal SEQ3_0: std_logic_vector(19 downto 0);
signal OK: std_logic;

component comparador
	port (SEQ3_0: in std_logic_vector(19 downto 0);		
			OK: out std_logic
			);
	end component;

component comparador10
	port (CONTA_DES: in std_logic_vector(9 downto 0);		
			SALDO: out std_logic
			);
	end component;

begin

SEQ3_0 <= SEQ_3 & SEQ_2 & SEQ_1 & SEQ_0;--os sinais de 5 bits que vem da saída dos registradores são concatenados em um único sinal na entrada do comparador.
PASS_CERTO <= TESTE_PASS and OK;--sinal criado para receber a saída TESTE_PASS da máquina de controle e a saída do comparador da senha.    

L0: comparador port map (SEQ3_0, OK);
L1: comparador10 port map (CONTA_DES, SALDO);

end topo_comparadores_arch;