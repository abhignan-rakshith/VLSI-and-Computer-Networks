#include <stdio.h>
#include <string.h>

char t[28], temp[28], cs[28], g[] = {"10001000000100001"};
int i, j, flag, N, a;

void xor()
{
    for (j=0; j<N; j++)
    {
        //Matching? '0' else '1'
        cs[j] = ((cs[j] == g[j])?'0':'1');
    }
}

void crc() 
{
    for (i=0; i<N; i++)
    {
        cs[i] = t[i];
    }    
    do 
    {
    if (cs[0] == '1')
    {
        //First-Bit '0'?, xor()
        xor();
    }
    for (j=0; j<N-1; j++)
    {
        //left-shift
        cs[j] = cs[j+1];
    }
    cs[j] = t[i++];
    }while(i<=a+N-1);
        

}

void main()
{
    //clrscr();
    
    printf("\nEnter data : "); 
    scanf("%s",t);
    
    strcpy(temp,t);
    
    printf("\nGenerator polynomial : %s",g);
    
    a = strlen(t);
    N = strlen(g);
    for (i=a; i<a+N-1; i++)
    {
        t[i] = '0';
    }
    
    printf("\nModified data is : %s",t); 
    crc();
    printf("\nChecksum is : %s",cs);
    strcat(temp,cs);
    printf("\nFinal codeword is : %s",temp);
    
    printf("\nEnter the received message : "); 
    scanf("%s",t);
    crc();
    printf("\nremainder: %s",cs);
    
    flag = 0;
    for (i=0; i<N-1; i++)
    {
        if (cs[i] == '1')
        {
            flag = 1;
            break;
        }
    }
    
    if (flag == 1)
        printf("\nError Detected!");
    else 
        printf("\nNo Error Detected!");
    
    printf("Type any key and hit 'Enter'...");    
    scanf("%s",t);
}

