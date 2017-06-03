library ieee;
use ieee.std_logic_1164.all;

entity MS is
	port (
		clk,key0,key3,RF_rp_zero: in std_logic;
		IR: in std_logic_vector(15 downto 0);
		ld_PC,clr_PC,inc_PC,rd_I,ld_IR,D_rw,SelMUX_mem,RF_W_wr,RF_rp_rd,RF_rq_rd: out std_logic;
		RF_sel: out std_logic_vector(1 downto 0);
		RF_W_addr, RF_rp_addr, RF_rq_addr, sel_ula: out std_logic_vector(3 downto 0);
		disp1: out std_logic_vector(3 downto 0);
		D_addr,RF_W_data : out std_logic_vector(7 downto 0)		
	);
end MS ;
architecture arq of MS is
	CONSTANT init : STD_LOGIC_VECTOR(4 DOWNTO 0) := "00000";
	CONSTANT fetch : STD_LOGIC_VECTOR(4 DOWNTO 0) := "00001";
	CONSTANT decode : STD_LOGIC_VECTOR(4 DOWNTO 0) := "00010";
	CONSTANT load : STD_LOGIC_VECTOR(4 DOWNTO 0) := "00011";
	CONSTANT store: STD_LOGIC_VECTOR(4 DOWNTO 0) := "00100";
	CONSTANT add : STD_LOGIC_VECTOR(4 DOWNTO 0) := "00101";
	CONSTANT load_constant: STD_LOGIC_VECTOR(4 DOWNTO 0) := "00110";
	CONSTANT sub: STD_LOGIC_VECTOR(4 DOWNTO 0) := "00111";
	CONSTANT jump_if_zero: STD_LOGIC_VECTOR(4 DOWNTO 0) := "01000";
	CONSTANT s_and : STD_LOGIC_VECTOR(4 DOWNTO 0) := "01001";
	CONSTANT s_or: STD_LOGIC_VECTOR(4 DOWNTO 0) := "01010";
	CONSTANT s_xor: STD_LOGIC_VECTOR(4 DOWNTO 0) := "01011";
	CONSTANT s_xnor: STD_LOGIC_VECTOR(4 DOWNTO 0) := "01100";
	CONSTANT s_shift_left: STD_LOGIC_VECTOR(4 DOWNTO 0) := "01101";
	CONSTANT s_shift_right: STD_LOGIC_VECTOR(4 DOWNTO 0) := "01110";
	CONSTANT jump: STD_LOGIC_VECTOR(4 DOWNTO 0) := "01111";
	CONSTANT load_from_register: STD_LOGIC_VECTOR(4 DOWNTO 0) := "10000";
	
	SIGNAL y : STD_LOGIC_VECTOR(4 DOWNTO 0) := init;

begin
process(clk) begin
		IF (clk'EVENT AND clk = '1') THEN
			case y is
				when init =>
					if(key3 = '0') then
						y <= fetch;
					end if;
				when fetch =>
					if(key0 = '0') then
						y <= decode;
					end if;
				when decode =>
					if(key0 = '0' AND IR(15 downto 12)="0000") then
						y <= load;
					elsif(key0 ='0' AND IR(15 downto 12)="0001") then
						y <= store;
					elsif(key0 ='0' AND IR(15 downto 12)="0010") then
						y <= add;
					elsif(key0 ='0' AND IR(15 downto 12)="0011") then
						y <= load_constant;
					elsif(key0 ='0' AND IR(15 downto 12)="0100") then
						y <= sub;
					elsif(key0 ='0' AND IR(15 downto 12)="0101") then
						y <= jump_if_zero;
					elsif(key0 ='0' AND IR(15 downto 12)="0110") then
						y <= s_and;
					elsif(key0 ='0' AND IR(15 downto 12)="0111") then
						y <= s_or;
					elsif(key0 ='0' AND IR(15 downto 12)="1000") then
						y <= s_xor;
					elsif(key0 ='0' AND IR(15 downto 12)="1001") then
						y <= s_xnor;
					elsif(key0 ='0' AND IR(15 downto 12)="1010") then
						y <= s_shift_left;
					elsif(key0 ='0' AND IR(15 downto 12)="1011") then
						y <= s_shift_right;
					elsif(key0 ='0' AND IR(15 downto 12)="1100") then
						y <= jump;
					elsif(key0 ='0' AND IR(15 downto 12)="1101") then
						y <= load_from_register;
					end if;
				when load =>
					if(key0 = '0') then
						y <= fetch;
					end if;
				when store =>
					if(key0 = '0') then
						y <= fetch;
					end if;
				when add =>
					if(key0 = '0') then
						y <= fetch;
					end if;
				when load_constant =>
					if(key0 = '0') then
						y <= fetch;
					end if;
				when sub =>
					if(key0 = '0') then
						y <= fetch;
					end if;
				when jump_if_zero =>
					if(key0 = '0' and RF_rp_zero='0') then
						y <= fetch;
					elsif(key0 ='0' and RF_rp_zero='1') then
						y <= jump;
					end if;
				when s_and =>
					if(key0 = '0') then
						y <= fetch;
					end if;
				when s_or =>
					if(key0 = '0') then
						y <= fetch;
					end if;
				when s_xor =>
					if(key0 = '0') then
						y <= fetch;
					end if;
				when s_xnor =>
					if(key0 = '0') then
						y <= fetch;
					end if;
				when s_shift_left =>
					if(key0 = '0') then
						y <= fetch;
					end if;
				when s_shift_right =>
					if(key0 = '0') then
						y <= fetch;
					end if;
				when jump =>
					if(key0 = '0') then
						y <= fetch;
					end if;
				when load_from_register =>
					if(key0 = '0') then
						y <= fetch;
					end if;
				when others =>
			end case;
		end if;
end process;
		--1110 decode
		clr_PC <= '1' when y = init;
		rd_I <= '1' when y=fetch else '0';
		inc_PC <= '1' when y=fetch else '0';
		ld_IR <= '1' when y=fetch else '0';
		RF_rp_addr <= IR(7 downto 4) when y= load or y = store or y= add or y = sub or y = jump_if_zero or y = s_and or y= s_or or y= s_xor or y= s_xnor else "0000";
		RF_rp_rd <= '1' when y= load or y = store or y= add or y = sub or y = jump_if_zero or y = s_and or y= s_or or y= s_xor or y= s_xnor else '0';
		
		RF_rq_addr <= IR(3 downto 0) when y= add or y = sub or y = s_and or y= s_or or y= s_xor or y= s_xnor or y = s_shift_left or y = s_shift_right or y=load_from_register else "0000";
		RF_rq_rd <= '1' when y= add or y = sub or y = s_and or y= s_or or y= s_xor or y= s_xnor or y = s_shift_left or y = s_shift_right or y=load_from_register else '0';
		
		RF_W_addr <= IR(11 downto 8) when y =load_constant or y= add or y = sub or y = s_and or y= s_or or y= s_xor or y= s_xnor or y = s_shift_left or y = s_shift_right or y=load_from_register else "0000";
		RF_W_wr <= '1' when y =load_constant or y= add or y = sub or y = s_and or y= s_or or y= s_xor or y= s_xnor or y = s_shift_left or y = s_shift_right or y=load_from_register else '0';
		
		D_addr <= IR(7 downto 0) when y= load or y=store or y= jump_if_zero or y=jump else "00000000";
		D_rw <= '1' when y=store else '0';
		RF_W_data <= IR(7 downto 0) when y = load_constant else "00000000";
		sel_ula <= IR(15 downto 12) when y= add or y = sub or y = s_and or y= s_or or y= s_xor or y= s_xnor or y = s_shift_left or y = s_shift_right else "0000";
		seLMUX_mem <= '1' when y = load_from_register else '0';
		RF_sel <= "00" when y =load_constant or y= add or y = sub or y = s_and or y= s_or or y= s_xor or y= s_xnor or y = s_shift_left or y = s_shift_right or y=load_from_register else
					 "01" when y = load or y = load_from_register  else
					 "10" when y = load_constant else "11";
		disp1 <= IR(15 downto 12) when y= load or y = store or y= add or y= 	load_constant or y= sub or y= jump_if_zero or y= s_and or y= s_or or y= s_xor or y= s_xnor or y=s_shift_left or y= s_shift_right or y=jump or y=load_from_register else
			      "1101" when y=decode else "0000";		
end arq;