module d_ff(din,clk,reset,q,qb);
input clk,reset,din;
output q,qb;
reg q;

always@(posedge clk or negedge reset)
begin
if(~reset)
q<=0;
else
q<=din;
end

assign qb = ~q;
endmodule
