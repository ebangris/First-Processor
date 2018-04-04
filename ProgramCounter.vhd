library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ProgramCounter is
    Port ( PCaddress : in  STD_LOGIC_VECTOR (31 downto 0);
           rst : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           PCout : out  STD_LOGIC_VECTOR (31 downto 0));
end ProgramCounter;

architecture arq_PC of ProgramCounter is
signal A : STD_LOGIC_VECTOR (31 downto 0) := (others => '0');

begin
	process (CLK)
begin
	if rst = '1' then 
		PCout <= "00000000000000000000000000000000";
	else
		if CLK = '1' then
			PCout <= PCaddress;
		else
			PCout <= "00000000000000000000000000000000";
		end if;
	end if;
end process;
end arq_PC;

