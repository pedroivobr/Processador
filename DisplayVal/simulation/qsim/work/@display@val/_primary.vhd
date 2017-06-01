library verilog;
use verilog.vl_types.all;
entity DisplayVal is
    port(
        entrada         : in     vl_logic_vector(15 downto 0);
        saida1          : out    vl_logic_vector(6 downto 0);
        saida2          : out    vl_logic_vector(6 downto 0);
        saida3          : out    vl_logic_vector(6 downto 0);
        saida4          : out    vl_logic_vector(6 downto 0)
    );
end DisplayVal;
