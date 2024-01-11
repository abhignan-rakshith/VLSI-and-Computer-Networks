module d_ff_tb();
reg reset, clk, din;
wire q, qb;

d_ff d1(din,clk,reset,q,qb);

initial
begin
clk <= 1'b0;
end

always
begin
#5 clk <= ~clk;
end

initial
begin
reset = 1'b0;
din = 1'b0;

#10 din = 1'b1;
#10 reset = 1'b1; din = 1'b0;
#10 din = 1'b1;
end

initial
#100 $finish;
endmodule
