===================================================
This is a FPGA demo for verilog beginners just like me ^_^

FPGA board: Xilinx ZCU104
Software: Vivado 2018.2
===================================================

Run your 1st FPGA program on ZCU104:

(1) Create a RTL project using FPGA board ZCU104.

(2) Import gpio_demo.v (Add or create design sources) and gpio_demo.xdc (Add or create constrains) to your project.

(3) Just click "Generate Bitstream" on the left window, and wait until it's done.

(4) Connect you ZCU104 to PC by USB-JTAG, when ready, click "Open Hardware Manager" 

(5)Click "Program Device", when done, you can see the LEDs flashing, and you can adjust the flashing frequency by long-pressing SW17 and SW18.


Enjoy!

###########################################################################################
A warm note:

The PIN of CLK_125_P should be F23. I think the writer of Board User Guide made some mistakes.
It took me long to get this demo work correctly. I hope this can help you save some time.

###########################################################################################