// Filename:    tb_rtl_counter.v
// Author:      Neil Lukowski
// Course:      EE 421 - Digital Systems Design
// Semester:    Fall 2021
// Assignment:  2
// Description: A testbench for rtl_counter.v

`timescale 1ns / 1ns
 module tb_rtl_counter;

reg clk, rstn;

wire[3:0] count;
wire [4:0] count2;
wire enable = 1;
wire pulse_5m, pulse_250k;

rtl_counter#(.TC(10)) rtl_counter(.rstn(rstn), .clk(clk), .enable(enable), .pulse(pulse_5m), .count(count));

rtl_counter#(.TC(20)) dut(.rstn(rstn), .clk(clk), .enable(pulse_5m), .pulse(pulse_250k), .count(count2));

// Clk generator
always
  #10 clk = ~clk;

initial  //Test stimulus
  begin
	clk = 0;
	rstn = 0;
	#10 rstn = 1;  	//Resetting the counter 
	#20000;	        //Running for 500ns
	$stop;
  end
endmodule
