LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY TB_ALU IS
END TB_ALU;
 
ARCHITECTURE behavior OF TB_ALU IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         A : IN  std_logic_vector(7 downto 0);
         B : IN  std_logic_vector(7 downto 0);
         C : IN  std_logic_vector(7 downto 0);
         Sc : IN  std_logic_vector(2 downto 0);
         S : OUT  std_logic_VECTOR (7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(7 downto 0) := (others => '0');
   signal B : std_logic_vector(7 downto 0) := (others => '0');
   signal C : std_logic_vector(7 downto 0) := (others => '0');
   signal Sc : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal S : std_logic_VECTOR (7 downto 0);
    
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          A => A,
          B => B,
          C => C,
          Sc => Sc,
          S => S
        );

   -- Stimulus process
   stim_proc: process
   begin		
		
		------------------------------ Prueba 1
		A <= "00000011";
		B <= "00000010";
		C <= "00000001";
		Sc <= "000";
      wait for 20 ns;
		
		Sc <= "001";
      wait for 20 ns;
		
		Sc <= "010";
      wait for 20 ns;
		
		Sc <= "011";
      wait for 20 ns;
		
		Sc <= "100";
      wait for 20 ns;
		
		Sc <= "101";
      wait for 20 ns;
		
		Sc <= "110";
      wait for 20 ns;
		
		Sc <= "111";
      wait for 20 ns;
		------------------------------- Prueba 2
		A <= "00001101";
		B <= "00010110";
		C <= "00001001";
		Sc <= "000";
      wait for 20 ns;
		
		Sc <= "001";
      wait for 20 ns;
		
		Sc <= "010";
      wait for 20 ns;
		
		Sc <= "011";
      wait for 20 ns;
		
		Sc <= "100";
      wait for 20 ns;
		
		Sc <= "101";
      wait for 20 ns;
		
		Sc <= "110";
      wait for 20 ns;
		
		Sc <= "111";
      wait for 20 ns;
		------------------------------- Prueba 3
		A <= "00000101";
		B <= "00000110";
		C <= "00011001";
		Sc <= "000";
      wait for 20 ns;
		
		Sc <= "001";
      wait for 20 ns;
		
		Sc <= "010";
      wait for 20 ns;
		
		Sc <= "011";
      wait for 20 ns;
		
		Sc <= "100";
      wait for 20 ns;
		
		Sc <= "101";
      wait for 20 ns;
		
		Sc <= "110";
      wait for 20 ns;
		
		Sc <= "111";
      wait for 20 ns;
		--------------------------------- Prueba 0
		A <= "00000000";
		B <= "00000000";
		C <= "00000000";
		Sc <= "000";
      wait for 20 ns;
		
		Sc <= "001";
      wait for 20 ns;
		
		Sc <= "010";
      wait for 20 ns;
		
		Sc <= "011";
      wait for 20 ns;
		
		Sc <= "100";
      wait for 20 ns;
		
		Sc <= "101";
      wait for 20 ns;
		
		Sc <= "110";
      wait for 20 ns;
		
		Sc <= "111";
      wait for 20 ns;
		--------------------------------- Prueba 1´s
		A <= "11111111";
		B <= "11111111";
		C <= "11111111";
		Sc <= "000";
      wait for 20 ns;
		
		Sc <= "001";
      wait for 20 ns;
		
		Sc <= "010";
      wait for 20 ns;
		
		Sc <= "011";
      wait for 20 ns;
		
		Sc <= "100";
      wait for 20 ns;
		
		Sc <= "101";
      wait for 20 ns;
		
		Sc <= "110";
      wait for 20 ns;
		
		Sc <= "111";
      wait for 20 ns;
		wait;
   end process;

END;
