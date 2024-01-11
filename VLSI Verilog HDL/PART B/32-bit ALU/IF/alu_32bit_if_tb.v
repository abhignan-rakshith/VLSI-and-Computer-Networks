module alu_32bit_if_tb();

reg [31:0]a, b;
reg [2:0]f;
reg clk, rst;
wire [31:0]y;

alu_32bit_if test(y,clk,rst,a,b,f);

initial 
begin
clk=0;
rst=1;
end

always #5 clk = ~clk;

initial
begin
a = 32'h00000000;
b = 32'hFFFFFFFF;

#10 f=3'b000;
#10 f=3'b001;
#10 rst=1'b0;
#10 f=3'b010;
#10 f=3'b011;
#10 rst=1'b1;
#10 f=3'b100;
#10 f=3'b101;
end

initial
#200 $finish;

endmodule
