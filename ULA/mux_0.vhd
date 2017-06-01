-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- PROGRAM		"Quartus II 64-Bit"
-- VERSION		"Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Web Edition"
-- CREATED		"Mon May 22 14:35:32 2017"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY altera;
USE altera.maxplus2.all; 

LIBRARY work;

ENTITY mux_0 IS 
PORT 
( 
	e0	:	IN	 STD_LOGIC_VECTOR(15 DOWNTO 0);
	e1	:	IN	 STD_LOGIC_VECTOR(15 DOWNTO 0);
	e2	:	IN	 STD_LOGIC_VECTOR(15 DOWNTO 0);
	e3	:	IN	 STD_LOGIC_VECTOR(15 DOWNTO 0);
	e4	:	IN	 STD_LOGIC_VECTOR(15 DOWNTO 0);
	e5	:	IN	 STD_LOGIC_VECTOR(15 DOWNTO 0);
	e6	:	IN	 STD_LOGIC_VECTOR(15 DOWNTO 0);
	e7	:	IN	 STD_LOGIC_VECTOR(15 DOWNTO 0);
	op	:	IN	 STD_LOGIC_VECTOR(3 DOWNTO 0);
	saida	:	OUT	 STD_LOGIC_VECTOR(15 DOWNTO 0)
); 
END mux_0;

ARCHITECTURE bdf_type OF mux_0 IS 
BEGIN 

-- instantiate macrofunction 

b2v_inst9 : mux
GENERIC MAP(n => 16)
PORT MAP(e0 => e0,
		 e1 => e1,
		 e2 => e2,
		 e3 => e3,
		 e4 => e4,
		 e5 => e5,
		 e6 => e6,
		 e7 => e7,
		 op => op,
		 saida => saida);

END bdf_type; 