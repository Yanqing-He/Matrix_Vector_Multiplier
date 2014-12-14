module DataPath(clk, addr_x, wr_en_x, addr_a, wr_en_a, addr_y, wr_en_y, clear_acc, data_in, data_out, a, b, f);
  input clk, clear_acc;
  input wr_en_x, wr_en_a, wr_en_y;
  input [3: 0] addr_x;
  input [1: 0] addr_y, addr_a;
  input signed [7: 0] data_in;
  output logic signed [15: 0] data_out;
  
  //wire signed [7: 0] a, b;
  //wire signed [15: 0] f;
  
  // for testing
  inout signed [7: 0] a, b;
  inout signed [15: 0] f;
  
  Memory #(8, 9, 4) memX(
  .clk(clk), 
  .data_in(data_in), 
  .data_out(a), 
  .addr(addr_x), 
  .wr_en(wr_en_x)
  );
  
  Memory #(8, 3, 2) memA(
  .clk(clk),
  .data_in(data_in),
  .data_out(b),
  .addr(addr_a),
  .wr_en(wr_en_a)
  );
  
  Memory #(16, 3, 2) memY(
  .clk(clk),
  .data_in(f),
  .data_out(data_out),
  .addr(addr_y),
  .wr_en(wr_en_y)
  );
  
  MULACC mulacc(
  .clk(clk),
  .reset(clear_acc),
  .a(a),
  .b(b),
  .f(f)
  );
  
endmodule