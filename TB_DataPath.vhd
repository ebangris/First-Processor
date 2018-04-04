--------------------------------------------------------------------------------
-- Engineer: Esteban Grisales
-- Universidad Tegnologicca de Pereira
-- Create Date:   20:47:20 03/04/2018
-- Module Name:   D:/Xilinix Proyects/DataPath/TB_DataPath.vhd
-- Project Name:  DataPath
-- VHDL Test Bench Created by ISE for module: DataPath

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY TB_DataPath IS
END TB_DataPath;
 
ARCHITECTURE behavior OF TB_DataPath IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DataPath
    PORT(
         rst : IN  std_logic;
         CLK : IN  std_logic;
         Addr : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal rst : std_logic := '0';
   signal CLK : std_logic := '0';

 	--Outputs
   signal Addr : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DataPath PORT MAP (
          rst => rst,
          CLK => CLK,
          Addr => Addr
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
      -- hold reset state for 100 ns.
      wait for CLK_period*2;
		
		wait for CLK_period*3;
		rst <= '1';
		
		wait for CLK_period*6;
		rst <= '1';
      -- insert stimulus here 

      wait;
   end process;

END;
