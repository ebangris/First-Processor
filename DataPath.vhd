library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;

entity DataPath is
    Port ( rst : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           Addr : out  STD_LOGIC_VECTOR (31 downto 0));
end DataPath;

architecture arq_DP of DataPath is

component ProgramCounter
	port( 
		PCaddress : in  STD_LOGIC_VECTOR (31 downto 0);
		rst : in  STD_LOGIC;
		CLK : in  STD_LOGIC;
		PCout : out  STD_LOGIC_VECTOR (31 downto 0)
	);
	end component;

component Suma
	port(
		A : in  STD_LOGIC_VECTOR (31 downto 0);
		B : in  STD_LOGIC_VECTOR (31 downto 0);
		C : out  STD_LOGIC_VECTOR (31 downto 0)
	);
	end component;
		
signal init: STD_LOGIC_VECTOR (31 downto 0):= (others => '0');
signal nPC: STD_LOGIC_VECTOR (31 downto 0);
signal nnPC: STD_LOGIC_VECTOR (31 downto 0);

begin
inst_PC : ProgramCounter port map(
		PCaddress => init,
		rst => rst,
		CLK => CLK,
		PCout => nPC
		);

inst_Sum: Suma port map(
		A => nPC,
		B => "00000000000000000000000000000100",
		C => nnPC
		);
		
inst_nPC : ProgramCounter port map(
		PCaddress => nnPC,
		rst => rst,
		CLK => CLK,
		PCout => Addr
		);
		
end arq_DP;

