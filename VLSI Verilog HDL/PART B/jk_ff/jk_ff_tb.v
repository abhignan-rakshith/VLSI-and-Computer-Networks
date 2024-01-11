module jk_ff_tb();
reg clk, reset, j_i, k_i;
wire q_o, qb_o;

jk_ff jkff1(j_i,k_i,clk,reset,q_o,qb_o);

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
reset = 0; j_i = 0; k_i = 0;
#10 j_i = 1; k_i = 1;
#10 j_i = 1; k_i = 0;
#10 reset = 1; j_i = 0; k_i = 0;
#10 j_i = 0; k_i = 1;
#10 j_i = 1; k_i = 0;
#10 j_i = 0; k_i = 0;
#10 j_i = 1; k_i = 1;
end

initial
#100 $finish;

endmodule
