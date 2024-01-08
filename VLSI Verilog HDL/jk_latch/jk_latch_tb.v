module jk_latch_tb();
reg en,reset,j_i,k_i;
wire q_o,qb_o;

jk_latch jklatch1(en,reset,j_i,k_i,q_o,qb_o);

initial
begin
reset=1'b0; j_i=1'b0; k_i=1'b0;
en=1'b1;

#10 j_i=1'b1; k_i=1'b1;
#10 j_i=1'b1; k_i=1'b0;
#10 reset=1'b1; j_i=1'b0; k_i=1'b0;
#10 j_i=1'b0; k_i=1'b1;
#10 j_i=1'b1; k_i=1'b0;
#10 reset=1'b0; j_i=1'b0; k_i=1'b0;
#10 j_i=1'b1; k_i=1'b1;
end

initial
#100 $finish;

endmodule
