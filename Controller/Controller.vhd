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
	constant Init : std_logic_vector(4 downto 0) := "10000";
	
	signal y : std_logic_vector(4 downto 0) := Init;
	signal op : std_logic_vector(3 downto 0);
	
begin
	process(clock)
	begin
		if(clock = '1' and clock'event) then
			case y is
				when Init =>
					if(key3 = '1') then
						y <= Fetch;
					else 
						y <= Init;
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
								
							when "1001" =>
								y <= _Xnor;
								
							when "1010" =>
								y <= Shfl;
								
							when "1011" =>
								y <= Shfr;
								
							when "1100" =>
								y <= Jump;
								
							when "1101" =>
								y <= LoadFromRegister;
							
							when others =>
						end case;
					end if;
				
				when Load =>
					if(key0 = '1') then
						y <= Fetch;
				
				when Store =>
					if(key0 = '1') then
						y <= Fetch;
					end if;
				
				when Add =>
					if(key0 = '1') then
						y <= Fetch;
					end if;
					
				when LoadConstant =>
					if(key0 = '1') then
						y <= Fetch;
					end if;
					
				when Subtract =>
					if(key0 = '1') then
						y <= Fetch;
					end if;
					
				when _And =>
					if(key0 = '1') then
						y <= Fetch;
					end if;
					
				when _Or =>
					if(key0 = '1') then
						y <= Fetch;
					end if;
					
				when _Xor =>
					if(key0 = '1') then
						y <= Fetch;
					end if;
					
				when _Xnor =>
					if(key0 = '1') then
						y <= Fetch;
					end if;
					
				when Shfl =>
					if(key0 = '1') then
						y <= Fetch;
					end if;
					
				when Shfr =>
					if(key0 = '1') then
						y <= Fetch;
					end if;
					
				when JumpIfZero =>
					if(key0 = '1' and RF_rp_zero = '1') then
						y <= Jump;
					elsif(key0 = '1' and RF_rp_zero = '0') then
						y <= Fetch;
					end if;
				
				when Jump =>
					if(key0 = '1') then
						y <= Fetch;
					end if;
					
				when LoadFromRegister =>
					if(key0 = '1') then
						y <= Fetch;
					end if;
			end if;
	end process;
	
	clr_PC <= '1' when y = Init else '0';
	load_PC <= '1' when y = Fetch else '0';
	load_IR <= '1' when y = Fetch else '0; 
	
	disp1_out <= "1110" when y = Decode else
					 "0000" when y = Load else
					 "0001" when y = Store else
					 "0010" when y = Add else
					 "0011" when y = LoadConstant else
					 "0100" when y = Subtract else
					 "0101" when y = JumpIfZero else
					 "0110" when y = _And else 
					 "0111" when y = _Or else
					 "1000" when y = _Xor else 
					 "1001" when y = _Xnor else 
					 "1010" when y = Shfl else 
					 "1011" when y = Shfr else 
					 "1100" when y = Jump else 
					 "1101" when y = LoadFromRegister;
end mecanismo;