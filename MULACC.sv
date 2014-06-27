// multiplier and accumulator
module MULACC(clk, reset, a, b, f);
  input clk, reset;
  input signed [7: 0] a, b;
  output logic signed [15: 0] f;
  logic signed [15: 0] fr;
  logic signed [7: 0] ar, br;
  
  always @(posedge clk or posedge reset)
  begin
    if(reset == 1)
    begin
      fr <= 0;
      f <= 0;
      ar <= 0;
      br <= 0;
    end
    else
    begin
      ar <= a;
      br <= b;
      fr <= ar * br + fr;
      f <= fr;
    end
  end
endmodule