library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity SEU is
    Port ( imm : in  STD_LOGIC_VECTOR (12 downto 0);
           RES : out  STD_LOGIC_VECTOR (31 downto 0));
end SEU;

architecture arq_SEU of SEU is
begin
process( imm13)
begin
	
	if(imm13(12) = '1') then
		
		seuout <= "1111111111111111111" & imm13;
	else
		seuout <= "0000000000000000000" & imm13;
	
	end if;
end process;

end arq_SEU;

