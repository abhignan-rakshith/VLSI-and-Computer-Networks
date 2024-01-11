#include <stdio.h>
#define N 5
#define bucketsize 1000

void
bucketoutput (int *bucket, int op)
{
  if ((*bucket > 0) && (*bucket > op))
    {
      *bucket = *bucket - op;
      printf ("\n%d-outputed remaining is %d", op, *bucket);
    }
  else if (*bucket > 0)
    {
      *bucket = 0;
      printf ("\nremaining data output = %d\n", *bucket);
    }
}

int
main ()
{
  int op, bucket = 0, newpack, oldpack = 0;
  int wt, i, j;

  printf ("\nEnter output rate:\t");
  scanf ("%d", &op);

  for (i = 1; i <= N; i++)
    {
      newpack = rand () % 500;
      printf ("\n\nnew packet size = %d", newpack);
      newpack = oldpack + newpack;
      wt = rand () % 5;

      if (newpack < bucketsize)
	{
	  bucket = newpack;
	}
      else
	{
	  printf ("\n%d > than bucketsize...reject", newpack);
	  bucket = oldpack;
	}

      printf ("\nthe data in bucket = %d", bucket);
      printf ("\nthe next packet will arrive after = %d sec", wt);

      for (j = 0; j < wt; j++)
	{
	  bucketoutput (&bucket, op);
	  sleep (1);
	}

      oldpack = bucket;
    }

  while (bucket > 0)
    bucketoutput (&bucket, op);

  getch();
  return 0;
}
