LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY TB_PC IS
END TB_PC;
 
ARCHITECTURE behavior OF TB_PC IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ProgramCounter
    PORT(
         PCaddress : IN  std_logic_vector(31 downto 0);
         rst : IN  std_logic;
         CLK : IN  std_logic;
         PCout : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    
   --Inputs
   signal PCaddress : std_logic_vector(31 downto 0) := (others => '0');
   signal rst : std_logic := '0';
   signal CLK : std_logic := '0';

 	--Outputs
   signal PCout : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ProgramCounter PORT MAP (
          PCaddress => PCaddress,
          rst => rst,
          CLK => CLK,
          PCout => PCout
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 
   -- Stimulus process
   stim_proc: process
   begin		
		PCaddress <= "00000000000000000000000000001111";	
      wait for 10 ns;
		rst <= '1';
		wait for 10 ns;
		PCaddress <= "00000000000000000000000001001111";
		wait for 10 ns;
		
   end process;

END;
