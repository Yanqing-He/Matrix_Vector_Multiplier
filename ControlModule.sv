module ControlModule(clk, start, reset, addr_x, wr_en_x, addr_a, wr_en_a, addr_y, wr_en_y, clear_acc, done);
  parameter DATA_WIDTH = 16, MEM_SIZE = 8, LOGSIZE = 3;
  input clk, start, reset;
  output logic clear_acc, done;
  output logic wr_en_x, wr_en_y, wr_en_a;
  output logic [3: 0] addr_x;
  output logic [1: 0] addr_y, addr_a;
  
  logic [15:0] state, next_state;
  //logic started = 0;
  
  always @(posedge clk)
  begin
    if(reset == 1)
      state <= 0;
    else
      state <= next_state;
  end
  
  always_comb
  begin
    if(state == 0)
      next_state = (start == 1) ? 1 : 0;
    else if(state == 39)
      next_state = 0;
    else
      next_state = state + 1;
  end
  
  always_comb
  begin
    if(state == 0)
      begin
        addr_x = 0;
        addr_a = 0;
        addr_y = 0;
        done = 0;
      end
    else if(state < 10 && state > 0)
      begin
        addr_x = state - 1;
        clear_acc = 1;
      end
    else if(state >= 10 && state < 13)
      begin
        addr_a = state - 10;
        clear_acc = 1;
      end
    else if(state == 13)
      begin
        clear_acc = 1;
        addr_x = 0;
        addr_a = 0;
   
     addr_y = 0;
   
     wr_en_y = 0;
      end
    else if(state == 14)
      begin
        addr_x = state - 14;
        addr_a = state - 14;
        clear_acc = 1;
      end
    else if(state >14 && state < 17)
      begin
        addr_x = state - 14;
        addr_a = state - 14;
        clear_acc = 0;
      end
    else if(state == 17)    
    begin
    end
  else if(state == 18)
    begin
    end
  else if(state == 19)
    begin
    end
  
  else if(state == 20)
  
    begin
  
      wr_en_y = 1;

      end

  
  else if(state == 21)
  
    begin
 
       clear_acc = 1;
        addr_x = 3;
        addr_a = 0;
        addr_y = 1;
        wr_en_y = 0;

      end
    else if(state == 22)
      begin
        addr_x = state - 19;
        addr_a = state - 22;
        clear_acc = 1;
      end
    else if(state >22 && state < 25)
      begin
        addr_x = state - 19;
        addr_a = state - 22;
        clear_acc = 0;
      end
    else if(state == 25)
      begin
      end
    else if(state == 26)
      begin
      end
    else if(state == 27)
      begin
      end
    else if(state == 28)
      begin
        wr_en_y = 1;
      end
    else if(state == 29)
  
    begin
 
        clear_acc = 1;
        addr_x = 6;
        addr_a = 0;
        addr_y = 2;
        wr_en_y = 0;

      end
    else if(state == 30)
      begin
        addr_x = state - 24;
        addr_a = state - 30;
        clear_acc = 1;
      end
    else if(state > 30 && state < 33)
      begin
        addr_x = state - 24;
        addr_a = state - 30;
        clear_acc = 0;
      end
    else if(state == 33)
      begin
      end
    else if(state == 34)
      begin
      end
    else if(state == 35)
      begin
      end
    else if(state == 36)
      begin
        wr_en_y = 1;
      end
  
    else if(state == 37)
      begin
 
        clear_acc = 1;
        addr_x = 0;
        addr_a = 0;
        addr_y = 0;
        wr_en_y = 0;
        done = 0;
    	 end

    else if(state >= 38 && state < 40)

      begin

        done = 1;

        addr_y = state - 37;

      end

    else

      begin

      end
  end
  
  assign wr_en_x = (state >= 0) & (state <= 9);
  assign wr_en_a = (state >= 9) & (state <= 12);
  
  
endmodule