`timescale 1ns/1ps

module tb_up_down_counter;

reg clk, rst, up;
wire [3:0] count;

up_down_counter uut (
  .clk(clk),
  .rst(rst),
  .up(up),
  .count(count)
);

initial begin
  $dumpfile("tb_up_down_counter.vcd");
  $dumpvars(0, tb_up_down_counter);

  clk = 0;
  rst = 1;
  up = 1;

  #10 rst = 0; // Release reset after 10 time units

  // Clock generation
  forever #5 clk = ~clk;

  // Toggle direction every 20 time units
  forever #20 up = ~up;

  // Simulation duration
  #100 $finish;
end

endmodule
