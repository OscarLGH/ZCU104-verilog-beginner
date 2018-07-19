set_property PACKAGE_PIN D5 [get_ports {led_out[0]}]
set_property PACKAGE_PIN D6 [get_ports {led_out[1]}]
set_property PACKAGE_PIN A5 [get_ports {led_out[2]}]
set_property PACKAGE_PIN B5 [get_ports {led_out[3]}]
set_property IOSTANDARD LVCMOS12 [get_ports {led_out[3]}]
set_property IOSTANDARD LVCMOS12 [get_ports {led_out[2]}]
set_property IOSTANDARD LVCMOS12 [get_ports {led_out[1]}]
set_property IOSTANDARD LVCMOS12 [get_ports {led_out[0]}]

set_property PACKAGE_PIN M11 [get_ports reset]
set_property PACKAGE_PIN F23 [get_ports clk_p]
set_property IOSTANDARD LVDS [get_ports clk_p]

set_property PACKAGE_PIN C3 [get_ports push_button_1]
set_property IOSTANDARD LVCMOS12 [get_ports push_button_1]

set_property IOSTANDARD LVCMOS18 [get_ports reset]

set_property PACKAGE_PIN B3 [get_ports push_button_2]
set_property IOSTANDARD LVCMOS12 [get_ports push_button_2]
