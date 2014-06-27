`timescale 1 ps/ 1 ps
module mem_tb();
    logic clk, wr_en;
    logic signed [7: 0] data_in;
    logic [1: 0] addr;
    wire signed[7: 0] data_out;
    
    Memory #(8, 4, 2) inst1(
    .clk(clk),
    .data_in(data_in),
    .data_out(data_out),
    .addr(addr),
    .wr_en(wr_en)
    );
    
    initial
    begin
      clk = 0;
      wr_en = 0;
      data_in = 8'b00000000;
      addr = 2'b00;
    end
    always
    begin
      #2 data_in = {$random} % 16;
    end
    always
    begin
      #1 clk = !clk;
    end
    initial
    begin
      #2 wr_en = 1;
      #8 wr_en = 0;
    end
    initial
    begin
      #2 addr = 0;
      #2 addr = 1;
      #2 addr = 2;
      #2 addr = 3;
      #2 addr = 0;
      #2 addr = 1;
      #2 addr = 2;
      #2 addr = 3;
      #2 addr = 0;
      #2 addr = 1;
      #2 addr = 2;
      #2 addr = 3;
    end
  endmodule