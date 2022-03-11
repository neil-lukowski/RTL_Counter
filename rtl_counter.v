/* Filename:    rtl_counter.v
   Author:      Neil Lukowski
   Course:      EE 421 - Digital Systems Design
   Semester:    Fall 2021
   Assignment:  2
   Description: A counter that pulses high when a certain number of clock
		pulses has been reached.
*/

module rtl_counter(clk, rstn, enable, pulse, count);
output reg pulse;  	
input clk, rstn, enable;

output reg [25:0] count; 

parameter TC = 100;


always@(posedge clk or negedge rstn)
   begin
      if (rstn == 1'b0)
	  count <= 1'b0;
      else
	  begin
	     if (enable == 1)
	         count <= (count == TC) ? 26'b0: count + 1;
             else
                 count <= count;
          end

if (count == TC)
    pulse <= 1;
else
    pulse <= 0;

end

endmodule