module dlatch(d, en, rst, q);
input d, en, rst;
output q;
reg q;

always@(d, en, rst)
begin
	if(en == 0)
	q<=0;
	else
	begin
	if(rst == 1)
	q<=0;
	else
	q<=d;
	end
	end
endmodule

