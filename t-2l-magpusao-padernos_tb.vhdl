-------------------------------------------------------------------------------
-- File Name: t-2l-magpusao-padernos.vhdl
-- Program Description: In and Out Buzzers Stimulator
-- Dana Jasmin A. Magpusao and Gianni Diorella E. Padernos
-------------------------------------------------------------------------------

-- Library Statements
library IEEE; use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- Entity Definition
entity buzzer_tb is
	constant PERIOD1: time := 100 ns; 				-- clock period
end entity buzzer_tb;

architecture buzzer_tb of buzzer_tb is
	signal alarm_t: std_logic;
	signal oo_t: std_logic;
	signal uo_t: std_logic;
	signal eo_t: std_logic;
	signal oi_t: std_logic;
	signal ui_t: std_logic;
	signal ei_t: std_logic;
	constant DELAY: time := 100 ns; -- delay value in testing
	
	-- Component declaration
	component buzzer is
		port (alarm: out std_logic; -- data output
			oo, uo, eo: in std_logic; -- e-it input buzzers
			oi, ui, ei: in std_logic); -- entrance input buzzers	  	  				
	end component buzzer;

begin	-- begin main body of the buzzer architecture
	-- instantiate the unit under test
	buzz: component buzzer port map(alarm_t, oo_t, uo_t, eo_t, oi_t, ui_t, ei_t);

	-- main process: generate test vectors and check results
	main: process is
		variable error_count: integer := 0; -- number of simulation errors
    
	begin   
		report "Start simulation.";
		---------------------------------------------- 
		--case 1: all inputs are 0
		oo_t<='0';
		uo_t<='0';
		eo_t<='0';
		oi_t<='0';
		ui_t<='0';
		ei_t<='0';	
		wait for DELAY;
		
		assert(alarm_t='0')
			report "Error!" severity error;
				if(alarm_t/='0') then
					error_count := error_count + 1; --increment error_count
				end if;
        ---------------------------------------------- 
       --case 2: all inputs are 1
		oo_t<='1';
		uo_t<='1';
		eo_t<='1';
		oi_t<='1';
		ui_t<='1';
		ei_t<='1';	
		wait for DELAY;
		
		assert(alarm_t='1')
			report "Error!" severity error;
				if(alarm_t/='1') then
					error_count := error_count + 1; --increment error_count
				end if;
        ---------------------------------------------- 
        --case 3: Bunce IN and Bunce OUT are 1
	    oo_t<='-';
		uo_t<='1';
		eo_t<='-';
		oi_t<='-';
		ui_t<='1';
		ei_t<='-';
        
		wait for DELAY;
		
		assert(alarm_t='1')
			report "Error!" severity error;
				if(alarm_t/='1') then
					error_count := error_count + 1; --increment error_count
				end if;
        ---------------------------------------------- 
        --case 4: Bean IN and Bean OUT are 1
		oo_t<='-';
		uo_t<='-';
		eo_t<='1';
		oi_t<='-';
		ui_t<='-';
		ei_t<='1';	
		wait for DELAY;
		
		assert(alarm_t='1')
			report "Error!" severity error;
				if(alarm_t/='1') then
					error_count := error_count + 1; --increment error_count
				end if;
        ---------------------------------------------- 
        --case 5: Boggis IN, Boggis OUT
		oo_t<='1';
		uo_t<='-';
		eo_t<='-';
		oi_t<='1';
		ui_t<='-';
		ei_t<='-';	
		wait for DELAY;
		
		assert(alarm_t='1')
			report "Error!" severity error;
				if(alarm_t/='1') then
					error_count := error_count + 1; --increment error_count
				end if;
        ---------------------------------------------- 
        --case 6: Boggis OUT, Bunce IN  are 1
		oo_t<='1';
		uo_t<='-';
		eo_t<='-';
		oi_t<='-';
		ui_t<='1';
		ei_t<='-';	
		wait for DELAY;
		
		assert(alarm_t='1')
			report "Error!" severity error;
				if(alarm_t/='1') then
					error_count := error_count + 1; --increment error_count
				end if;
        ---------------------------------------------- 
        --case 7: Boggis OUT and Bean IN are 1
		oo_t<='1';
		uo_t<='-';
		eo_t<='-';
		oi_t<='-';
		ui_t<='-';
		ei_t<='1';	
		wait for DELAY;
		
		assert(alarm_t='1')
			report "Error!" severity error;
				if(alarm_t/='1') then
					error_count := error_count + 1; --increment error_count
				end if;
        ---------------------------------------------- 
        --case 8: Bunce OUT, Boggis IN are 1
		oo_t<='-';
		uo_t<='1';
		eo_t<='-';
		oi_t<='1';
		ui_t<='-';
		ei_t<='-';	
		wait for DELAY;
		
		assert(alarm_t='1')
			report "Error!" severity error;
				if(alarm_t/='1') then
					error_count := error_count + 1; --increment error_count
				end if;
        ---------------------------------------------- 
         --case 9: Bunce OUT, Bean IN are 1
		oo_t<='-';
		uo_t<='1';
		eo_t<='-';
		oi_t<='-';
		ui_t<='-';
		ei_t<='1';	
		wait for DELAY;
		
		assert(alarm_t='1')
			report "Error!" severity error;
				if(alarm_t/='1') then
					error_count := error_count + 1; --increment error_count
				end if;
        ---------------------------------------------- 
         --case 8: Bean OUT, Boggis IN are 1
		oo_t<='-';
		uo_t<='-';
		eo_t<='1';
		oi_t<='1';
		ui_t<='-';
		ei_t<='-';	
		wait for DELAY;
		
		assert(alarm_t='1')
			report "Error!" severity error;
				if(alarm_t/='1') then
					error_count := error_count + 1; --increment error_count
				end if;
        ---------------------------------------------- 
         --case 9: Bean OUT, Bunce IN are 1
		oo_t<='-';
		uo_t<='-';
		eo_t<='1';
		oi_t<='-';
		ui_t<='1';
		ei_t<='-';	
		wait for DELAY;
		
		assert(alarm_t='1')
			report "Error!" severity error;
				if(alarm_t/='1') then
					error_count := error_count + 1; --increment error_count
				end if;
        ----------------------------------------------  
        --case 10: Boggis OUT, Bunce OUT are 1
		oo_t<='1';
		uo_t<='1';
		eo_t<='-';
		oi_t<='0';
		ui_t<='0';
		ei_t<='0';	
		wait for DELAY;
		
		assert(alarm_t='0')
			report "Error!" severity error;
				if(alarm_t/='0') then
					error_count := error_count + 1; --increment error_count
				end if;
        ---------------------------------------------- 
        --case 11: Boggis OUT, Bean OUT are 1
		oo_t<='1';
		uo_t<='-';
		eo_t<='1';
		oi_t<='0';
		ui_t<='0';
		ei_t<='0';	
		wait for DELAY;
		
		assert(alarm_t='0')
			report "Error!" severity error;
				if(alarm_t/='0') then
					error_count := error_count + 1; --increment error_count
				end if;
        ----------------------------------------------  
        --case 12: Bunce OUT, Bean OUT are 1
		oo_t<='-';
		uo_t<='1';
		eo_t<='1';
		oi_t<='0';
		ui_t<='0';
		ei_t<='0';	
		wait for DELAY;
		
		assert(alarm_t='0')
			report "Error!" severity error;
				if(alarm_t/='0') then
					error_count := error_count + 1; --increment error_count
				end if;
        ----------------------------------------------   
        --case 13: Boggis IN, Bunce IN are 1
		oo_t<='0';
		uo_t<='0';
		eo_t<='0';
		oi_t<='1';
		ui_t<='1';
		ei_t<='-';	
		wait for DELAY;
		
		assert(alarm_t='0')
			report "Error!" severity error;
				if(alarm_t/='0') then
					error_count := error_count + 1; --increment error_count
				end if;
        ---------------------------------------------- 
        --case 14: Boggis IN, Bean IN are 1
		oo_t<='0';
		uo_t<='0';
		eo_t<='0';
		oi_t<='1';
		ui_t<='-';
		ei_t<='1';	
		wait for DELAY;
		
		assert(alarm_t='0')
			report "Error!" severity error;
				if(alarm_t/='0') then
					error_count := error_count + 1; --increment error_count
				end if;
        ----------------------------------------------  
        --case 15: Bunce OUT, Bean OUT are 1
		oo_t<='0';
		uo_t<='0';
		eo_t<='0';
		oi_t<='-';
		ui_t<='1';
		ei_t<='1';	
		wait for DELAY;
		
		assert(alarm_t='0')
			report "Error!" severity error;
				if(alarm_t/='0') then
					error_count := error_count + 1; --increment error_count
				end if;
        ----------------------------------------------   
        
	   -- check if there are errors
        
		if(error_count=0) then
			report "Simulation completed with NO errors.";
		else
			report "ERROR: There were " & integer'image(error_count) & " errors.";
		end if;

		wait;			-- halt this process (note: simulation
	end process main;		-- continues due to clk assignment statement)
end architecture buzzer_tb;

