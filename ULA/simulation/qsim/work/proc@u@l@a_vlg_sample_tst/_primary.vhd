library verilog;
use verilog.vl_types.all;
entity procULA_vlg_sample_tst is
    port(
        data0           : in     vl_logic_vector(15 downto 0);
        data1           : in     vl_logic_vector(15 downto 0);
        seletor         : in     vl_logic_vector(3 downto 0);
        sampler_tx      : out    vl_logic
    );
end procULA_vlg_sample_tst;
