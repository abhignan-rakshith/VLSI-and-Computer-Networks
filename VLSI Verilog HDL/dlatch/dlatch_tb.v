module dlatch_tb();
reg d, en, rst;
wire q;

dlatch dl1(d, en, rst, q);

initial
begin

#10 rst = 0; en = 0; d = 1;
#10 rst = 1; en = 0; d = 1;
#10 rst = 0; en = 1; d = 1;
#10 rst = 1; en = 1; d = 1;

end

initial
#50 $finish;
endmodule
