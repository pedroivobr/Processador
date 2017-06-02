library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Controller is
	port(
		clock, key0, key3, RF_rp_zero : in std_logic;
		IR_in : in std_logic_vector(15 downto 0);
		
		selMUX_data, RF_W_wr, RF_rf_rd, RF_rq_rd,
				D_rd, D_wr, load_IR, MI_rd, inc_PC
				clr_PC, load_PC: out std_logic;
				
		RF_sel : out std_logic_vector(1 downto 0);
		
		RF_W_addr, RF_rp_addr, RF_rq_addr, seletor,
				disp1_out : out std_logic_vector(3 downto 0);
		
		D_addr, RF_W_data : out std_logic_vector(7 downto 0)
	);	

end Controller;

architecture mecanismo of Controller is

	constant Load : std_logic_vector(4 downto 0) := "00000";
	constant Store : std_logic_vector(4 downto 0) := "00001";
	constant Add : std_logic_vector(4 downto 0) := "00010";
	constant LoadConstant : std_logic_vector(4 downto 0) := "00011";
	constant Subtract : std_logic_vector(4 downto 0) := "00100";
	constant JumpIfZero : std_logic_vector(4 downto 0) := "00101";
	constant _And : std_logic_vector(4 downto 0) := "00110";
	constant _Or : std_logic_vector(4 downto 0) := "00111";
	constant _Xor : std_logic_vector(4 downto 0) := "01000";
	constant _Xnor : std_logic_vector(4 downto 0) := "01001";
	constant Shfl : std_logic_vector(4 downto 0) := "01010";
	constant Shfr : std_logic_vector(4 downto 0) := "01011";
	constant Jump : std_logic_vector(4 downto 0) := "01100";
	constant LoadFromRegister : std_logic_vector(4 downto 0) := "01101";
	constant Decode : std_logic_vector(4 downto 0) := "01110";
	constant Fetch : std_logic_vector(4 downto 0) := "01111";
	constant Inicio : std_logic_vector(4 downto 0) := "10000";
	
	signal y : std_logic_vector(4 downto 0) := Inicio;
	signal op : std_logic_vector(3 downto 0);
	
begin
	process(clock)
	begin
		if(clock = '1' and clock'event) then
			case y is
				when Inicio =>
					if(key3 = '1') then
						y <= Fetch;
					else 
						y <= Inicio;
					end if;
					
				when Fetch =>
					if(key0 = '1') then
						y <= Decode;
					end if;
				
				when Decode =>
					op <= unsigned (IR_in(15 downto 12);
					
					if(key0 = '1') then
						case op is
							when "0000" =>
								y <= Load;
							
							when "0001" =>
								y <= Store;
							
							when "0010" =>
								y <= Add;
								
							when "0011" =>
								y <= LoadConstant;
							
							when "0100" =>
								y <= Subtract;
							
							when "0101" =>
								y <= JumpIfZero;
								
							when "0110" =>
								y <= _And;
								
							when "0111" =>
								y <= _Or;
								
							when "1000" =>
								y <= _Xor;
	end process;

end mecanismo;