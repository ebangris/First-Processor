LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY TB_RF IS
END TB_RF;
 
ARCHITECTURE behavior OF TB_RF IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RF
    PORT(
         RS1 : IN  std_logic_vector(4 downto 0);
         RS2 : IN  std_logic_vector(4 downto 0);
         RD : IN  std_logic_vector(4 downto 0);
         DWR : IN  std_logic_vector(31 downto 0);
		   rst : in  STD_LOGIC;
			CRS1 : OUT  std_logic_vector(31 downto 0);
         CRS2 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    
   --Inputs
   signal RS1 : std_logic_vector(4 downto 0) := (others => '0');
   signal RS2 : std_logic_vector(4 downto 0) := (others => '0');
   signal RD : std_logic_vector(4 downto 0) := (others => '0');
   signal DWR : std_logic_vector(31 downto 0) := (others => '0');
	signal rst : STD_LOGIC := '0';


 	--Outputs
   signal CRS1 : std_logic_vector(31 downto 0);
   signal CRS2 : std_logic_vector(31 downto 0);
  
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RF PORT MAP (
          RS1 => RS1,
          RS2 => RS2,
          RD => RD,
          DWR => DWR,
          CRS1 => CRS1,
          CRS2 => CRS2,
			 rst => rst
        );

   -- Stimulus process
   stim_proc: process
   begin		
		rst <= '1';
		wait for 10 ns;
		rst <= '0';
      RS1 <= "00001";
		RS2 <= "00010"; 
		DWR <= "00000000000000000000000000000001";		
		RD <="00001";
		wait for 10 ns;
		RD <="00000";
		wait for 10 ns;
		rst <= '1';
		wait for 10 ns;
		rst <= '0';
		DWR <= "00000000000000000000000000000011";		
		RD <="00001";
      
      wait;
   end process;

END;
