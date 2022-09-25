`timescale 1ns/1ns

`include "tlc.v"
module tb_tlc;
parameter SIZE = 8;

reg clk,rst;
wire TRed,TYel,TGrn;


tlc dut(clk,rst,TRed,TYel,TGrn);


initial begin
	clk = 1'b0;
	forever #5 clk = ~clk;
end

initial begin
	rst = 1'b1;
	#10
	rst = 1'b0;
	#10;
	$monitor ("%0t",$time);
	#2000;
	$finish;
	
end

endmodule
