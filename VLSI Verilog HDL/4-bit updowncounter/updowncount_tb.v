module updowncount_tb();
reg dir, reset, clk;
wire [3:0]q;

updowncount test1(dir, reset, clk, q);

initial 
  begin
    dir = 0
    reset = 0
    clk = 0
  end

initial
  always #5 clk = ~clk;

initial
  begin 
    #10 reset = 1'b1;
    #100 dir = 1'b1;
    #100 reset = 1'b0;
    #20 dir = 1'b0;
    #20 reset = 1'b1;
  end

initial
  #500 $finish;

endmodule
