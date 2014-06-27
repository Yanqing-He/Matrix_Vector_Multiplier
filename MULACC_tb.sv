`timescale 1 ps/ 1 ps
module MULACC_tb();
  logic clk, reset;
  logic signed [7: 0] a, b;
  
  wire signed [15: 0] f;
  MULACC mulacc1(
  .clk(clk),
  .reset(reset),
  .a(a),
  .b(b),
  .f(f)
  );
  
  initial
  begin
    clk = 0;
    reset = 1;
    a = 8'b00000000;
    b = 8'b00000000;
    $display("running testbench");
  end
  initial
  begin
    #5 reset = 0;
  end
  always
  begin
    #2 clk = !clk;
  end
  always
  begin
    #4 a = {$random} % 256;
  end
  always
  begin
    #4 b = {$random} % 256;
  end
  //always
  //begin
    //#10 reset = 1;
    //#1 reset = 0;
  //end
endmodule
