library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity GppdALU is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           C : in  STD_LOGIC_VECTOR (7 downto 0);
           Sc : in  STD_LOGIC_VECTOR (2 downto 0);
           S : out  STD_LOGIC_VECTOR (7 downto 0));
end GppdALU;

architecture Behavioral of GppdALU is

COMPONENT MiniALU_2
	PORT(
		A : IN std_logic_vector(7 downto 0);
		B : IN std_logic_vector(7 downto 0);
		C : IN std_logic_vector(7 downto 0);
		Sc : IN std_logic_vector(1 downto 0);          
		S : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;
	
COMPONENT MiniALU_1
	PORT(
		A : IN std_logic_vector(7 downto 0);
		B : IN std_logic_vector(7 downto 0);
		C : IN std_logic_vector(7 downto 0);
		Sc : IN std_logic_vector(1 downto 0);          
		S : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;

component Multiplex8bit is
	 Port ( A : in  STD_LOGIC_VECTOR(7 DOWNTO 0);
			  B : in  STD_LOGIC_VECTOR(7 DOWNTO 0);
			  Sel : in  STD_LOGIC;
			  Cout : out  STD_LOGIC_VECTOR(7 DOWNTO 0));
end component;

signal TempA : STD_LOGIC_VECTOR(7 downto 0);
signal TempB : STD_LOGIC_VECTOR(7 downto 0);

begin

Inst_MiniALU_1: MiniALU_2 PORT MAP(
	A => A,
	B => B,
	C => C,
	Sc => Sc(1 downto 0),
	S => TempA
);

Inst_MiniALU_2: MiniALU_1 PORT MAP(
	A => A,
	B => B,
	C => C,
	Sc => Sc(1 downto 0),
	S => TempB
);

ins_mpx_1: Multiplex8bit PORT MAP(
	A => TempA,
	B => TempB,
	Sel => Sc(2),
	Cout => S
);

end Behavioral;

