library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity registradorRF is
port( 
	clk, w_rd, rp_rd, rq_rd : in std_logic;
	w_data : in std_logic_vector(15 downto 0);
	w_addr, rp_addr, rq_addr : in std_logic_vector(3 downto 0);
	rp_data, rq_data : out std_logic_vector(15 downto 0)
);
end registradorRF;

architecture mecanismo of registradorRF is
	signal reg : std_logic_vector(255 downto 0);
	
begin
	process(clk)
	begin
		if(w_rd = '1') then
			reg(16*(to_integer(unsigned(w_addr)) + 1) - 1 downto 16*to_integer(unsigned(w_addr))) <= w_data;
		end if;
	end process;


end mecanismo;