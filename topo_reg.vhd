library ieee;
use ieee.std_logic_1164.all;

entity topo_reg is
port ( 	BTN0, C3, C2, C1, C0, CLOCK_50: IN STD_LOGIC;
			REG: IN STD_LOGIC_VECTOR(19 downto 0);
			SEQ_3, SEQ_2, SEQ_1, SEQ_0 : OUT STD_LOGIC_VECTOR(4 downto 0)
);
end topo_reg;

architecture topo_reg_arch of topo_reg is

component reg_5bits
port (
		EN, CLK, RST: in std_logic;
		D: in std_logic_vector(4 downto 0);
		Q: out std_logic_vector(4 downto 0)		
		);
end component;

begin
L0: reg_5bits port map (C3, CLOCK_50, BTN0, REG(19 downto 15), SEQ_3);--todos os registradores recebem o sinal de clock e reset
L1: reg_5bits port map (C2, CLOCK_50, BTN0, REG(14 downto 10), SEQ_2);--ao mesmo tempo, mas o sinal de enable é único para cada
L2: reg_5bits port map (C1, CLOCK_50, BTN0, REG(9 downto 5), SEQ_1);--  um deles.
L3: reg_5bits port map (C0, CLOCK_50, BTN0, REG(4 downto 0), SEQ_0);

end topo_reg_arch;
