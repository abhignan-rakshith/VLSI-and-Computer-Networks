module sr_latch(en,reset,s_i,r_i,q_o,qb_o);
input en,reset,s_i,r_i;
output q_o,qb_o;
reg q_o;

always@(s_i or r_i or reset or en)
begin
if(en==0)
q_o<=0;
else if(reset==1)
q_o<=0;
else
begin
if(s_i==0 & r_i==0)
q_o <= q_o;
if(s_i==0 & r_i==1)
q_o<=1'b0;
if(s_i==1 & r_i==0)
q_o<=1'b1;
if(s_i==1 & r_i==1)
q_o<=1'bx;
end
end

assign qb_o=~q_o;
endmodule
