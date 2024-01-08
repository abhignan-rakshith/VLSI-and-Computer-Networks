module sr_ff(s_i,r_i,clk,reset,q_o,qb_o);
input clk,reset,s_i,r_i;
output q_o,qb_o;
reg q_o;

always@(posedge clk or negedge reset)
begin
if(reset==0)
q_o<=0;
else
begin
if(s_i==1'b0 & r_i==1'b0)
q_o<=q_o;

if(s_i==1'b0 & r_i==1'b1)
q_o<=1'b0;

if(s_i==1'b1 & r_i==1'b0)
q_o<=1'b1;

if(s_i==1'b1 & r_i==1'b1)
q_o<=1'bx;
end
end

assign qb_o = ~q_o;
endmodule
