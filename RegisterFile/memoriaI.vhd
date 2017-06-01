library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity memoriaI is
	port(
		addr : in std_logic_vector(7 downto 0);
		rd : in std_logic;
		data : out std_logic_vector(15 downto 0)
	);
end memoriaI;

architecture mecanismo of memoriaI is
	signal inst : std_logic_vector(4095 downto 0);
	
begin
	inst(15 downto 0) <= "0000000100000001";
	inst(31 downto 16) <= "0000001000000001";
	inst(47 downto 31) <= "0010001100010010";
	data <= inst(16*(to_integer(unsigned(addr)) + 1) - 1 downto 16*to_integer(unsigned(addr)))
		when rd = '1';
end mecanismo;