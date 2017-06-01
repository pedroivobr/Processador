library verilog;
use verilog.vl_types.all;
entity procULA_vlg_check_tst is
    port(
        outULA          : in     vl_logic_vector(15 downto 0);
        sampler_rx      : in     vl_logic
    );
end procULA_vlg_check_tst;
