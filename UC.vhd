library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity UC is
    Port ( OP : in  STD_LOGIC_VECTOR (4 downto 0);
           OP3 : in  STD_LOGIC_VECTOR (4 downto 0);
           ALUOP : out  STD_LOGIC_VECTOR (4 downto 0));
end UC;

architecture arq_UC of UC is
begin
	ALUOP <= OP3;
end arq_UC;

