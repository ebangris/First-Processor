LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY TB_SEU IS
END TB_SEU;
 
ARCHITECTURE behavior OF TB_SEU IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SEU
    PORT(
         imm13 : IN  std_logic_vector(12 downto 0);
         RES : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal imm13 : std_logic_vector(12 downto 0) := (others => '0');

 	--Outputs
   signal RES : std_logic_vector(31 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SEU PORT MAP (
          imm13 => imm13,
          RES => RES
        );

   -- Stimulus process
   stim_proc: process
   begin			
		imm13 <= "0000000000000";
      wait for 10 ns;
		imm13 <= "1010001000110";
      wait for 10 ns;
		imm13 <= "1000000000000";
      wait for 10 ns;
		imm13 <= "1001000100100";
      wait for 10 ns;
		imm13 <= "0111001100011";
      wait for 10 ns;


      wait;
   end process;

END;
