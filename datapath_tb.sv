module datapath_tb();
  logic clk, clear_acc;
  logic wr_en_x, wr_en_a, wr_en_y;
  logic [3: 0] addr_x;
  logic [1: 0] addr_y, addr_a;
  logic signed [7: 0] data_in;
  wire signed [15: 0] data_out;
  wire signed [7: 0] a, b;
  wire signed [15: 0] f;
  
  DataPath ins1(
  .clk(clk),
  .addr_x(addr_x), 
  .wr_en_x(wr_en_x), 
  .addr_a(addr_a), 
  .wr_en_a(wr_en_a), 
  .addr_y(addr_y), 
  .wr_en_y(wr_en_y), 
  .clear_acc(clear_acc), 
  .data_in(data_in), 
  .data_out(data_out),
  .a(a),
  .b(b),
  .f(f)
  );
  
  initial
  begin
    clk = 0;
    clear_acc = 1;
    wr_en_x = 0;
    wr_en_a = 0;
    wr_en_y = 0;
    addr_x = 4'b0000;
    addr_a = 2'b00;
    addr_y = 2'b00;
    data_in = 8'b00000000;
  end
  
  always
  begin
    #1 clk = !clk;
  end
  always
  begin
    #2 data_in = {$random} % 16;
  end
  initial
  begin
    #2 clear_acc = 0;
  end
  initial
  begin
    #2 addr_x = 0;
    #2 addr_x = 1;
    #2 addr_x = 2;
    #2 addr_x = 3;
    #2 addr_x = 4;
    #2 addr_x = 5;
    #2 addr_x = 6;
    #2 addr_x = 7;
    #2 addr_x = 8;
    #2 addr_a = 0;
    #2 addr_a = 1;
    #2 addr_a = 2;
  end
  initial
  begin
    #1 wr_en_x = 1;
    #20 wr_en_x = 0;
  end
  initial
  begin
    #19 wr_en_a = 1;
    #8 wr_en_a = 0;
  end
  initial
  begin
    #28 addr_x = 0;
    #2 addr_x = 1;
    #2 addr_x = 2;
    #8;
    #2 addr_x = 3;
    #2 addr_x = 4;
    #2 addr_x = 5;
    #8;
    #2 addr_x = 6;
    #2 addr_x = 7;
    #2 addr_x = 8;
  end
  initial
  begin
    #28 addr_a = 0;
    #2 addr_a = 1;
    #2 addr_a = 2;
    #8;
    #2 addr_a = 0;
    #2 addr_a = 1;
    #2 addr_a = 2;
    #8;
    #2 addr_a = 0;
    #2 addr_a = 1;
    #2 addr_a = 2;
  end
  initial
  begin
    #26 clear_acc = 1;
    #5 clear_acc = 0;
    #9 wr_en_y = 1;
    #2 wr_en_y = 0;
    #0 clear_acc = 1;
    #2 clear_acc = 0;
    #10 wr_en_y = 1;
    #2 wr_en_y = 0;
    #0 clear_acc = 1;
    #2 clear_acc = 0;
    #10 wr_en_y = 1;
    #2 wr_en_y = 0;
  end
  initial
  begin
    #36 addr_y = 0;
    #2 addr_y = 0;
    #2 addr_y = 0;
    #8;
    #2 addr_y = 1;
    #2 addr_y = 1;
    #2 addr_y = 1;
    #8;
    #2 addr_y = 2;
    #2 addr_y = 2;
    #2 addr_y = 2;
    #2 addr_y = 0;
    #2 addr_y = 1;
    #2 addr_y = 2;
    #2 addr_y = 0;
    #2 addr_y = 1;
    #2 addr_y = 2;
    #2 addr_y = 0;
    #2 addr_y = 1;
    #2 addr_y = 2;
  end
  
endmodule