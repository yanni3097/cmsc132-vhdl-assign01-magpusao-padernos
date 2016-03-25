-------------------------------------------------------------------------------
-- File Name: t-2l-magpusao-padernos.vhdl
-- Program Description: In and Out Buzzers Stimulator
-- Dana Jasmin A. Magpusao and Gianni Diorella E. Padernos
-------------------------------------------------------------------------------

-- Library Statements
library IEEE; use IEEE.std_logic_1164.all;

-- Entity Definition
entity buzzer is
	port (alarm: out std_logic; -- data output
     oo, uo, eo: in std_logic; -- exit input buzzers
	 oi, ui, ei: in std_logic); -- entrance input buzzers	  			
end entity buzzer;

architecture buzzer of buzzer is
	signal al: std_logic;

begin
	alarm <= al;
	process(oo, uo, eo, oi, ui, ei) is
	begin
		if((oo='1' or uo='1' or eo='1') and (oi='1' or ui='1' or ei='1')) then      
		 al <= '1';
		else
		 al <= '0';
		end if;
	end process;
end architecture buzzer;

