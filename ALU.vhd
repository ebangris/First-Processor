library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity ALU is
    Port ( CRS1 : in  STD_LOGIC_VECTOR (31 downto 0);
           MUXout : in  STD_LOGIC_VECTOR (31 downto 0);
           ALUop : in  STD_LOGIC_VECTOR (5 downto 0);
           ALUout : out  STD_LOGIC_VECTOR (31 downto 0));
end ALU;

architecture arq_ALU of ALU is
begin
	process (ALUop,MUXout, CRS1)
			begin
			case (ALUop) is 
				when "000000" => -- equivale al op3 de la suma de enteros
					ALUout <= CRS1 + MUXout  ;
				when "000001" => -- equivale al op3 del and para los enteros
					ALUout <= CRS1 AND MUXout ;
				when "000101" =>-- equivale al and not para los enteros
					ALUout <= (CRS1 AND (NOT MUXout));
				when "000010" =>-- equivale al or para los enteros
					ALUout <= CRS1 OR MUXout ;
				when "000110" => --equivale al or not para los enteros
					ALUout <= NOT(CRS1 OR MUXout);
				when "000011" =>--equivale al xor  para los enteros
					ALUout <= CRS1 XOR MUXout ;
				when "000111" =>--equivale al Xnor para los enteros
					ALUout <= CRS1 XNOR MUXout ;
				when "000100" => -- equivale al op3 de la resta de enteros
					ALUout <= CRS1 - MUXout ;
				when others =>
					ALUout <= "00000000000000000000000000000000";
		end case;
	end process;
end arq_ALU;

