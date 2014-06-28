module ControlModule_tb();
  logic clk, start, reset;
  wire wr_en_x, wr_en_y, wr_en_a;
  wire [3: 0] addr_x;
  wire [1: 0] addr_y, addr_a;
  wire clear_acc, done;
  
  ControlModule conInst1(
  .clk(clk),
  .start(start),
  .reset(reset),
  .addr_x(addr_x), 
  .wr_en_x(wr_en_x), 
  .addr_a(addr_a), 
  .wr_en_a(wr_en_a), 
  .addr_y(addr_y), 
  .wr_en_y(wr_en_y), 
  .clear_acc(clear_acc), 
  .done(done)
  );
  
  initial
  begin
    clk = 1;
    start = 0;
    reset = 1;
  end
  
  always
  begin
    #1 clk = !clk;
  end
  
  initial
  begin
    #4 start = 1;
    #2 start = 0;
  end
  
  initial
  begin
    //#2 reset = 1;
    #2 reset = 0;
  end
  
endmodule