module MatrixVectorMultiplier(clk, start, reset, data_in, data_out, done, clear_acc, wr_en_x, wr_en_y, wr_en_a, addr_x, addr_y, addr_a, a, b, f);
  
  input clk, start, reset;
  output logic [15: 0] data_out;
  input [7: 0] data_in;
  output done;
  
  // for testing
  inout clear_acc;
  inout wr_en_x, wr_en_y, wr_en_a;
  inout [3: 0] addr_x;
  inout [1: 0] addr_y, addr_a;
  
  inout signed [7: 0] a, b;
  inout signed [15: 0] f;
  
  ControlModule controlInstance(
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
  
  DataPath pathInstance(
  .clk(clk), 
  .addr_x(addr_x), 
  .wr_en_x(wr_en_x), 
  .addr_a(addr_a), 
  .wr_en_a(wr_en_a), 
  .addr_y(addr_y), 
  .wr_en_y(wr_en_y), 
  .clear_acc(clear_acc), 
  .data_in(data_in), 
  .data_out(data_out)
  ,.a(a)
  ,.b(b)
  ,.f(f)
  );
  
endmodule