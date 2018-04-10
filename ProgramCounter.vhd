library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ProgramCounter is
    Port ( PCaddress : in  STD_LOGIC_VECTOR (31 downto 0);
           rst : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           PCout : out  STD_LOGIC_VECTOR (31 downto 0));
end ProgramCounter;

architecture arq_PC of ProgramCounter is
signal res: std_logic_vector(31 downto 0):= x"00000000";
begin
res <= PCaddress;
	process (rst, CLK)
	begin
		if (clk'event and clk = '1' and rst = '0') then
				if PCaddress = "00000000000000000000000001000000" then
					PCout <= "00000000000000000000000000000000";
				else
					PCout <= res;
				end if;
			end if;
			if (rst = '1') then
		      PCout <= "00000000000000000000000000000000";
		   end if;
	end process;
end arq_PC;

