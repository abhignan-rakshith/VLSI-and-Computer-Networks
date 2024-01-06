module alu_32bit_if(y,clk,rst,a,b,f);
input [31:0]a;
input [31:0]b;
input [2:0]f;
input clk,rst;
output reg [31:0]y;

always@(posedge clk or negedge rst)
begin
if(!rst)
y=0;
else
begin
if(f==3'b000)
y=a&b; //and
else if(f==3'b001)
y=a|b; //or
else if(f==3'b010)
y=a+b; //sum
else if(f==3'b011)
y=a-b; //diff
else if(f==3'b100)
y=a*b; //mul
else
y=32'bx;
end
end
endmodule

















