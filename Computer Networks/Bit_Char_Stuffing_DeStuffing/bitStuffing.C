//C program to implement Bit-Stuffing
#include <stdio.h>
#include <string.h>
#include <conio.h>

int main()
{
    char ch, array[50]={"01111110"}, read_array[50];
    int count=0, i=8, j, k;
    
    //Stuffing
    printf("\nEnter the bit stream to be stuffed: \t");
    while((ch=getche())!='\r'){
        if(ch == '1')
        count++;
        else
        count=0;
        array[i++]=ch;
        
        if(count==5){
            array[i++]='0';
            count=0;
        }
    }
    
    strcat(array, "01111110");
    printf("\nThe stuffed bit stream is: \t");
    
    for(j=0; j<i+8; j++){
        printf("%c", array[j]);
    }
    
    //De-Stuffing
    count = 0;
    
    printf("\nThe De-Stuffed bit stream is: \t");
    for(j=8,k=0; j<i+8; j++){
        if(array[j] == '1')
        count++;
        else
        count=0;
        read_array[k++]=array[j];
        
        if((count==5)&&(array[j++]=='0')){
            j++;
            count=0;
        }
    }
    
    for(j=0; j<=k-strlen("01111110"); ++j){
        printf("%c", read_array[j]);
    }
    
    getch();
    return 0;
}
