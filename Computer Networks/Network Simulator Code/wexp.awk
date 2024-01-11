BEGIN {
tcppack1=0; 
tcppack2=0; 
tcppack3=0;
tcppack4=0;
}
{
if($1=="s"&&$3=="_0_"&&$4=="AGT")
{
tcppack1++;
}
if($1=="r"&&$3=="_4_"&&$4=="AGT")
{
tcppack2++;
}
if($1=="r"&&$3=="_1_"&&$4=="AGT")
{
tcppack3++;
}
if($1=="s"&&$3=="_3_"&&$4=="AGT")
{
tcppack4++;
}
}
END {
printf("\n total number of data packets sent by Node 0: %d\n", tcppack1++); 
printf("\n total number of data packets received by Node 4: %d\n", tcppack2++); 
printf("\n total number of data packets sent by Node 3: %d\n", tcppack3++); 
printf("\n total number of data packets received by Node 1: %d\n", tcppack4++);
}
