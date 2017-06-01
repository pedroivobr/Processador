library verilog;
use verilog.vl_types.all;
entity procULA is
    port(
        outULA          : out    vl_logic_vector(15 downto 0);
        data0           : in     vl_logic_vector(15 downto 0);
        data1           : in     vl_logic_vector(15 downto 0);
        seletor         : in     vl_logic_vector(3 downto 0)
    );
end procULA;
