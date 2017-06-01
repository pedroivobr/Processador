LIBRARY ieee;
USE ieee.std_logic_1164.all;
--USE ieee.std_logic_arith.all;
--USE ieee.std_logic_unsigned.all;
use IEEE.numeric_std.all;

ENTITY DisplayOp IS
  PORT (
		disp_in : IN STD_LOGIC_VECTOR(3 DOWNTO 0); 
		pc_in : in std_LOGIC_VECTOR(15 downto 0);
      saida1, saida2, saida3, saida4 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)); 
END DisplayOp;

ARCHITECTURE behav OF DisplayOp IS
	signal y : unsigned (3 downto 0);
	signal pc : unsigned(15 downto 0);
	signal x : integer range 0 to 9999;
	signal display4 : integer range 0 to 15;
	signal display3 : integer range 0 to 15;
	signal display2 : integer range 0 to 15;
	signal display1 : integer range 0 to 15;
BEGIN
	
  PROCESS(disp_in)	
	BEGIN	
		y <= unsigned(disp_in);
		pc <= unsigned(pc_in);
		x <= to_integer(pc);
		
		display4 <= (x/1000);
		display3 <= (x/100 - (display4*10));
		display2 <= (x/10 - (display3*10) - (display4*100));
		display1 <= (x - (display2*10) - (display3*100) - (display4*1000));
		
		CASE y IS
			WHEN "0000" =>
				saida4 <= "1100001";
				saida3 <= "1000001";
				saida2 <= "0001000";
				saida1 <= "0001100";
				
			WHEN "0001" =>
				saida4 <= "0010010";
				saida3 <= "0000111";
				saida2 <= "0101111";
				saida1 <= "0000110";
				
			WHEN "0010" =>
				saida4 <= "1111111";
				saida3 <= "0001000";
				saida2 <= "0100001";
				saida1 <= "0100001";
				
			WHEN "0011" =>
				saida4 <= "1000111";
				saida3 <= "0100001";
				saida2 <= "1010011";
				saida1 <= "0000111";
				
			WHEN "0100" =>
				saida4 <= "1111111";
				saida3 <= "0010010";
				saida2 <= "1000001";
				saida1 <= "0000011";
			
			WHEN "0101" =>
				saida4 <= "1100001";
				saida3 <= "1001000";
				saida2 <= "0001100";
				saida1 <= "0100100";
			
			WHEN "0110" =>
				saida4 <= "1111111";
				saida3 <= "0001000";
				saida2 <= "0101011";
				saida1 <= "0100001";
				
			WHEN "0111" =>
				saida4 <= "1111111";
				saida3 <= "1111111";
				saida2 <= "1000000";
				saida1 <= "0101111";
				
			WHEN "1000" =>
				saida4 <= "1111111";
				saida3 <= "0001001";
				saida2 <= "0100011";
				saida1 <= "0101111";
				
			WHEN "1001" =>
				saida4 <= "0001001";
				saida3 <= "0101011";
				saida2 <= "0100011";
				saida1 <= "0101111";
			
			WHEN "1010" =>
				saida4 <= "0010010";
				saida3 <= "0001001";
				saida2 <= "0001110";
				saida1 <= "1000111";
				
			WHEN "1011" =>
				saida4 <= "0010010";
				saida3 <= "0001001";
				saida2 <= "0001110";
				saida1 <= "0101111";
				
			WHEN "1100" =>
				saida4 <= "1100001";
				saida3 <= "1000001";
				saida2 <= "1001000";
				saida1 <= "0001100";
			
			WHEN "1101" =>
				saida4 <= "1000111";
				saida3 <= "0100001";
				saida2 <= "0101111";
				saida1 <= "0000010";
				
			WHEN "1110" =>
				CASE display4 IS
					WHEN 1 =>
						saida4 <= "1111001";				
					WHEN 2 =>
						saida4 <= "0100100";				
					WHEN 3 =>
						saida4 <= "0110000";				
					WHEN 4 =>
						saida4 <= "0011001";				
					WHEN 5 =>
						saida4 <= "0010010";					
					WHEN 6 =>
						saida4 <= "0000010";					
					WHEN 7 =>
						saida4 <= "1111000";					
					WHEN 8 =>
						saida4 <= "0000000";				
					WHEN 9 =>
						saida4 <= "0010000";
					WHEN 0 =>
						saida4 <= "1000000";
					WHEN OTHERS =>
						saida4 <= "1111111";
				END CASE;
				
				CASE display3 IS
					WHEN 1 =>
						saida3 <= "1111001";				
					WHEN 2 =>
						saida3 <= "0100100";				
					WHEN 3 =>
						saida3 <= "0110000";				
					WHEN 4 =>
						saida3 <= "0011001";				
					WHEN 5 =>
						saida3 <= "0010010";					
					WHEN 6 =>
						saida3 <= "0000010";					
					WHEN 7 =>
						saida3 <= "1111000";					
					WHEN 8 =>
						saida3 <= "0000000";				
					WHEN 9 =>
						saida3 <= "0010000";
					WHEN 0 =>
						saida3 <= "1000000";
					WHEN OTHERS =>
						saida3 <= "1111111";
				END CASE;
				
				CASE display2 IS
					WHEN 1 =>
						saida2 <= "1111001";				
					WHEN 2 =>
						saida2 <= "0100100";				
					WHEN 3 =>
						saida2 <= "0110000";				
					WHEN 4 =>
						saida2 <= "0011001";				
					WHEN 5 =>
						saida2 <= "0010010";					
					WHEN 6 =>
						saida2 <= "0000010";					
					WHEN 7 =>
						saida2 <= "1111000";					
					WHEN 8 =>
						saida2 <= "0000000";				
					WHEN 9 =>
						saida2 <= "0010000";
					WHEN 0 =>
						saida2 <= "1000000";
					WHEN OTHERS =>
						saida2 <= "1111111";
				END CASE;
				
				CASE display1 IS
					WHEN 1 =>
						saida1 <= "1111001";				
					WHEN 2 =>
						saida1 <= "0100100";				
					WHEN 3 =>
						saida1 <= "0110000";				
					WHEN 4 =>
						saida1 <= "0011001";				
					WHEN 5 =>
						saida1 <= "0010010";					
					WHEN 6 =>
						saida1 <= "0000010";					
					WHEN 7 =>
						saida1 <= "1111000";					
					WHEN 8 =>
						saida1 <= "0000000";				
					WHEN 9 =>
						saida1 <= "0010000";
					WHEN 0 =>
						saida1 <= "1000000";
					WHEN OTHERS =>
						saida1 <= "1111111";
				END CASE;
				
			WHEN OTHERS =>
				saida4 <= "1111111";
				saida3 <= "1111111";
				saida2 <= "1111111";
				saida1 <= "1111111";				
		END CASE;						
	END PROCESS;
END behav; 