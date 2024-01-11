module alu_32bit_case(y,rst,a,b,f);
input [31:0]a;
input [31:0]b;
input [2:0]f;
input clk,rst;
output reg [31:0]y;

always@(*)
begin
if(!rst)
y=0;
else
begin
case(f)
3'b000:y=a&b;
3'b001:y=a|b;
3'b010:y=~(a&b);
3'b011:y=~(a|b);
3'b100:y=a+b;
3'b101:y=a-b;
3'b110:y=a*b;
default:y=32'bx;
endcase
end
endmodule

















