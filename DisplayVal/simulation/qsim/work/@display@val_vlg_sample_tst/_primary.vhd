library verilog;
use verilog.vl_types.all;
entity DisplayVal_vlg_sample_tst is
    port(
        entrada         : in     vl_logic_vector(15 downto 0);
        sampler_tx      : out    vl_logic
    );
end DisplayVal_vlg_sample_tst;
