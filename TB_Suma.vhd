LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TB_Suma IS
END TB_Suma;
 
ARCHITECTURE behavior OF TB_Suma IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Suma
    PORT(
         A : IN  std_logic_vector(31 downto 0);
         B : IN  std_logic_vector(31 downto 0);
         C : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(31 downto 0) := (others => '0');
   signal B : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal C : std_logic_vector(31 downto 0);

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Suma PORT MAP (
          A => A,
          B => B,
          C => C
        );

   -- Stimulus process
   stim_proc: process
   begin		
		A <= "00000000000000000000000000000000";
		B <= "00000000000000000000000000000000";
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		
		A <= "00000000000000000000000000000001";
		B <= "00000000000000000000000000000001";
		wait for 100 ns;
		A <= "00000000000000000000000000000010";
		B <= "00000000000000000000000000000010";
		wait for 100 ns;
		A <= "00000000000000000000000000000111";
		B <= "00000000000000000000000000000111";
   end process;

END;
