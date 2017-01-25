library verilog;
use verilog.vl_types.all;
entity maq_refri is
    port(
        i_moeda_25      : in     vl_logic;
        i_moeda_50      : in     vl_logic;
        i_moeda_1       : in     vl_logic;
        i_clk           : in     vl_logic;
        i_rst           : in     vl_logic;
        o_led_S0        : out    vl_logic;
        o_led_S1        : out    vl_logic;
        o_led_S2        : out    vl_logic;
        o_led_S3        : out    vl_logic;
        o_led_S4        : out    vl_logic;
        o_led_S5        : out    vl_logic;
        o_led_S6        : out    vl_logic;
        o_led_S7        : out    vl_logic;
        o_led_S8        : out    vl_logic
    );
end maq_refri;
