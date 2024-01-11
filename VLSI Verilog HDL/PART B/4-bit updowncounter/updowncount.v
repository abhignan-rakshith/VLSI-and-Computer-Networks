module updowncount(input dir, input reset, input clk, output [3:0]q);
reg [3:0]q;

always@ (posedge clk or negedge reset)
  begin 
    if(!reset)
      q<=4'b0000;
    else
      begin
        if(dir)
          begin
            q <= q + 1;
            if(q == 4'b1001)
              q<=4'b0000;
          end
        else
          begin
            q <= 4'b1001;
            q <= q - 1;
            if(q == 4'b0000)
              q<=4'b1001
          end
      end
  end
endmodule
