#include <stdio.h>
#include <stdlib.h>
#include <windows.h>

#define RTT 4
#define TOT_FRAMES 7
#define TIMEOUT 4 

enum {YES, NO} ACK;

int main()
{
    int wait_time, i = 1;
    ACK = YES;
    
    for (;i<=TOT_FRAMES;) 
    {
        if (ACK==YES && i!=1)
        {
            printf("\nSENDER: ACK for frame %d received.\n", i);
        }
        printf("\nSENDER: Frame %d sent, Waiting for ACK....\n", i);
        ACK = NO;
        
        wait_time = rand() % 4 + 1;
        
        if (wait_time == TIMEOUT) 
        {
            printf("\nSENDER: ACK not received for Frame %d=>TIMEOUT Resending frame...", i);
        }
        else
        {
            sleep(RTT/2);
            printf("RECEIVER: Frame %d received, ACK %d sent...\n", i, i+1);
            printf("-----------------------------------------------------");
            ACK = YES;
            sleep(RTT/2);
            i++;
        }
    }

    return 0;
}