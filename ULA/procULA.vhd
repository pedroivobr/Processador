
LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY procULA IS 
	PORT
	(
		data0 :  IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
		data1 :  IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
		seletor :  IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		outULA :  OUT  STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END procULA;

ARCHITECTURE bdf_type OF procULA IS 

ATTRIBUTE black_box : BOOLEAN;
ATTRIBUTE noopt : BOOLEAN;

COMPONENT mux_0
	PORT(e0 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 e1 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 e2 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 e3 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 e4 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 e5 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 e6 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 e7 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 op : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 saida : OUT STD_LOGIC_VECTOR(15 DOWNTO 0));
END COMPONENT;
ATTRIBUTE black_box OF mux_0: COMPONENT IS true;
ATTRIBUTE noopt OF mux_0: COMPONENT IS true;

COMPONENT somador
GENERIC (n : INTEGER
			);
	PORT(a : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 b : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 soma : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END COMPONENT;

COMPONENT subtrator
GENERIC (n : INTEGER
			);
	PORT(a : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 b : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 resultado : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END COMPONENT;

COMPONENT shifter
GENERIC (n : INTEGER
			);
	PORT(op : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 valor : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 saida : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	s1 :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	s2 :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	s3 :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	s4 :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	s5 :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	s6 :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	s7 :  STD_LOGIC_VECTOR(15 DOWNTO 0);


BEGIN 



b2v_inst : somador
GENERIC MAP(n => 16
			)
PORT MAP(a => data1,
		 b => data0,
		 soma => s2);


b2v_inst2 : subtrator
GENERIC MAP(n => 16
			)
PORT MAP(a => data1,
		 b => data0,
		 resultado => s1);


b2v_inst4 : shifter
GENERIC MAP(n => 16
			)
PORT MAP(op => seletor,
		 valor => data1,
		 saida => s3);


s4 <= data1 AND data0;


s5 <= data0 OR data1;


s6 <= data1 XOR data0;


s7 <= NOT(s6);



b2v_inst9 : mux_0
PORT MAP(e0 => s5,
		 e1 => s4,
		 e2 => s7,
		 e3 => s6,
		 e4 => s1,
		 e5 => s2,
		 e6 => s3,
		 e7 => s3,
		 op => seletor,
		 saida => outULA);


END bdf_type;