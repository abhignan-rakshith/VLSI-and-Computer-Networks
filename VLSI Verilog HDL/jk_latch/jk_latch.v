module jk_latch(en,reset,j_i,k_i,q_o,qb_o);
input en,reset,j_i,k_i;
output q_o,qb_o;
reg q_o;

always@(j_i or k_i or reset or en)
begin
if(reset==1)
q_o<=0;
else if(en==0)
q_o<=0;
else
begin
if(j_i==0 & k_i==0)
q_o<=q_o;
if(j_i==0 & k_i==1)
q_o<=1'b0;
if(j_i==1 & k_i==0)
q_o<=1'b1;
if(j_i==1 & k_i==1)
q_o<= ~q_o;
end
end

assign qb_o= ~q_o;
endmodule


