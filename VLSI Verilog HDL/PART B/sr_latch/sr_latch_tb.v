module sr_latch_tb();
reg en,reset,s_i,r_i;
wire q_o,qb_o;

sr_latch srlatch1(en,reset,s_i,r_i,q_o,qb_o);

initial 
begin
reset=1'b0;
en=1'b1;
s_i=1'b0; r_i=1'b0;
#10 s_i=1'b1; r_i=1'b1;
#10 s_i=1'b1; r_i=1'b0;
#10 reset=1'b1; s_i=1'b0; r_i=1'b0;
#10 s_i=1'b0; r_i=1'b1;
#10 s_i=1'b1; r_i=1'b0;
#10 s_i=1'b0; r_i=1'b0;
#10 s_i=1'b1; r_i=1'b1;
end
initial
#100 $finish;
endmodule

