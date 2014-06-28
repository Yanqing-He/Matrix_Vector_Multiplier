module MVM_tb();
  logic clk, start, reset;
  logic signed [7: 0] data_in;
  wire signed [15: 0] data_out;
  wire done;
  
  // for testing
  wire clear_acc;
  wire wr_en_x, wr_en_y, wr_en_a;
  wire [3: 0] addr_x;
  wire [1: 0] addr_y, addr_a;
  
  wire signed [7: 0] a, b;
  wire signed [15: 0] f;
  // end
  
  MatrixVectorMultiplier MVMInst1(
  .clk(clk),
  .start(start),
  .reset(reset),
  .data_in(data_in),
  .data_out(data_out),
  .done(done)
  //for testing
  ,.clear_acc(clear_acc)
  ,.wr_en_x(wr_en_x)
  ,.wr_en_y(wr_en_y)
  ,.wr_en_a(wr_en_a)
  ,.addr_x(addr_x)
  ,.addr_y(addr_y)
  ,.addr_a(addr_a)
  ,.a(a)
  ,.b(b)
  ,.f(f)
  );
  
  
  initial
  begin
    clk = 1;
    start = 0;
    reset = 1;
    data_in = 0;
  end
  
  always
  begin
    #1 clk = !clk;
  end
  always
  begin
    #2 data_in = data_in + 1;
  end
  
  initial
  begin
    #4 start = 1;
    #2 start = 0;
  end
  
  initial
  begin
    #2 reset = 0;
  end
  
endmodule