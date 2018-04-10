library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux is
    Port ( RS2 : in  STD_LOGIC_VECTOR (31 downto 0);
           RES : in  STD_LOGIC_VECTOR (31 downto 0);
           i : in  STD_LOGIC;
           Cout : out  STD_LOGIC_VECTOR (31 downto 0));
end Mux;

architecture arq_mux of Mux is
begin
	Cout <= (RES and i ) or (not i and RS2);
end arq_mux;

