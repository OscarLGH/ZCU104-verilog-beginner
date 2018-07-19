`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Oscar
// 
// Create Date: 2018/07/18 10:30:38
// Design Name: 
// Module Name: led
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module led(
    input clk,
    input reset,
    input [4:0] fun,
    output [3:0] led_out
    );
    
    reg [31:0] counter;
    reg [3:0] led_reg;
    reg [5:0] shift;

    always @(posedge clk) begin
        if (reset) begin
            counter <= 32'hffffffff;
        end else begin
            counter <= counter + 1;
        end
        shift <= fun;
        led_reg <= (counter >> shift);
    end
    assign led_out = led_reg;
endmodule

module button_ctrl (
    input clk,
    input push_button_1,
    input push_button_2,
    input reset,
    output [4:0] fun
    );
    reg [4:0] shift;
    reg [1:0] in;
    
    reg [31:0] counter1_high;       //[15:0] will cause "push_button_1 signal disappear, why?"
    reg [31:0] counter2_high;       //[15:0] will cause "push_button_1 signal disappear, why?"
    
    parameter key_delay = 31250000;
   
    
    always @(posedge clk) begin
         if (push_button_1 == 1'b1) begin
             counter1_high <= counter1_high + 1;
               
             if (counter1_high == key_delay) begin
                 in[0] <= 1;
                 counter1_high <= 0;
             end else begin
                 in[0] <= 0;
             end
           
         end else begin
             counter1_high <= 0;
             in[0] <= 0;
         end
     end
        
     always @(posedge clk) begin
          if (push_button_2 == 1'b1) begin
               counter2_high <= counter2_high + 1;
                   
               if (counter2_high == key_delay) begin
                    in[1] <= 1;
                    counter2_high <= 0;
               end else begin
                    in[1] <= 0;
               end
               
          end else begin
              counter2_high <= 0;
              in[1] <= 0;
          end
     end
       
     always @(posedge clk) begin
        
         if (reset) begin
             shift <= 26;
         end else begin
             case (in)
                 2'b01 : shift <= shift + 1;
                 2'b10 : shift <= shift - 1;
                 default : shift <= shift;
             endcase
         end
     end
     assign fun = shift;
endmodule

module led_demo(
    input clk_p,
    input clk_n,
    input reset,
    input push_button_1,
    input push_button_2,
    output [3:0] led_out
);
    wire [4:0] btn_out;
    wire clk;
    IBUFGDS clkgen(.O(clk),.I(clk_p),.IB(clk_n));
    button_ctrl bt_ctrl(.clk(clk), .push_button_1(push_button_1), .push_button_2(push_button_2), .reset(reset), .fun(btn_out));
    led led0(.clk(clk), .reset(reset), .fun(btn_out), .led_out(led_out));
endmodule