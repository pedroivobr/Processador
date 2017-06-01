library verilog;
use verilog.vl_types.all;
entity DisplayVal_vlg_check_tst is
    port(
        saida1          : in     vl_logic_vector(6 downto 0);
        saida2          : in     vl_logic_vector(6 downto 0);
        saida3          : in     vl_logic_vector(6 downto 0);
        saida4          : in     vl_logic_vector(6 downto 0);
        sampler_rx      : in     vl_logic
    );
end DisplayVal_vlg_check_tst;
