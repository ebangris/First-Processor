library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity RF is
    Port ( RS1 : in  STD_LOGIC_VECTOR (4 downto 0);
           RS2 : in  STD_LOGIC_VECTOR (4 downto 0);
           RD : in  STD_LOGIC_VECTOR (4 downto 0);
           DWR : in  STD_LOGIC_VECTOR (31 downto 0);
           rst : in  STD_LOGIC;
			  CRS1 : out  STD_LOGIC_VECTOR (31 downto 0);
           CRS2 : out  STD_LOGIC_VECTOR (31 downto 0)
			  );
end RF;

architecture arq_RF of RF is
	type ram_type is array (0 to 31) of std_logic_vector (31 downto 0);
	signal RAM: ram_type:= ( others => "00000000000000000000000000000000");
	begin
		RAM(0)<="00000000000000000000000000000000" ;
		process (RS1, RS2, RD, RD, rst, RAM)
			begin
				if  rst = '1'  then
					RAM <=( others => "00000000000000000000000000000000");
					CRS1 <= "00000000000000000000000000000000" ;
					CRS2 <= "00000000000000000000000000000000" ;
				else 
					CRS1 <= RAM(conv_integer(RS1)) ;
					CRS2 <= RAM(conv_integer(RS2))  ;
					if RD /= "00000" then
						RAM(conv_integer(RD)) <= DWR;
					end if;
				end if;
	end process;
end arq_RF;

