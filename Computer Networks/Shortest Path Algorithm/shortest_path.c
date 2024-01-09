#include <stdio.h>
#include <conio.h>
#define max 5
#define PERMANENT 1
#define TENTATIVE 0
#define INFINITY 99

struct node
{
    unsigned int wt;
    int state;
    int prev;
};

int cost[max][max];

int main()
{
    int src, dstn, i, j, w_node;
    int mincost;
    struct node nodes[max];

    //clrscr();

    printf("\n Enter the cost matrix:\n");
    for (i = 0; i < max; i++) 
    {
        for (j = 0; j< max; j++)
        {
            scanf("%d", &cost[i][j]);
        }
    }

    for (i = 0; i < max; i++)
    {
        nodes[i].state = TENTATIVE;
        nodes[i].wt = INFINITY;
    }

    printf("\nEnter the source node: \t");
    scanf("%d", &src);
    w_node = src;
    nodes[src].prev = -1;
    nodes[src].wt = 0;

    printf("\nEnter the destination node: \t");
    scanf("%d", &dstn);
    if (dstn == src)
    {
        printf("\nThe Source and Destination nodes are the same!\n");
        printf("\nDistance = 0\n");
    }

    do
    {
        nodes[w_node].state = PERMANENT;

        for (i = 0; i < max; i++)
        {
            if (cost[w_node][i] != 0 && nodes[i].state == TENTATIVE)
            {
                if ((nodes[w_node].wt + cost[w_node][i]) < nodes[i].wt)
                {
                    nodes[i].wt = nodes[w_node].wt + cost[w_node][i];
                    nodes[i].prev = w_node;
                }
            }  
        }
        mincost = 100;

        for (i = 0; i < max; i++)
        {
            if (nodes[i].state == TENTATIVE &&  nodes[i].wt < mincost)
            {
                mincost = nodes[i].wt;
                w_node = i;
            }
        }
    } while (w_node != dstn);

    printf("\nShortest path obtained------------->\t%d", dstn);
    
    do
    {
        w_node = nodes[w_node].prev;
        printf("<-%d", w_node);
    } while (nodes[w_node].prev != -1);
    
    printf("\n\n With a total minimum weight of :\t%d",nodes[dstn].wt); 
    getch();

    return 0;
}
