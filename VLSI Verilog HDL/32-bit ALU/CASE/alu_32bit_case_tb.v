module alu_32bit_case_tb();

reg [31:0]a, b;
reg [2:0]f;
reg rst;
wire [31:0]y;

alu_32bit_case test(y,rst,a,b,f);

initial 
rst=1;

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
