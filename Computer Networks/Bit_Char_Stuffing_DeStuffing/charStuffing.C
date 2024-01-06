//C program to implement Character Stuffing
#include <stdio.h>
#include <conio.h>
#define DLE 16
#define STX 2
#define ETX 3

int
main ()
{
  char ch, array[100] = { DLE, STX };
  int i = 2, j;

  //Stuffing
  printf ("\nEnter the data stream(ctrl+b->STX,ctrl+c->ETX,ctrl+p->DLE);\n");
  while ((ch = getch ()) != '\r')
    {
      if (ch == DLE)
	{
	  array[i++] = DLE;
	  printf ("DLE");
	}
      else if (ch == STX)
	printf ("STX");
      else if (ch == ETX)
	printf ("ETX");
      else
	printf ("%c", ch);

      array[i++] = ch;
    }
  array[i++] = DLE;
  array[i++] = ETX;

  printf ("\nThe character stuffed data stream: \n");
  for (j = 0; j < i; ++j)
    {
      if (array[j] == DLE)
	{
	  printf ("DLE");
	}
      else if (array[j] == STX)
	{
	  printf ("STX");
	}
      else if (array[j] == ETX)
	{
	  printf ("ETX");
	}
      else
	{
	  printf ("%c", array[j]);
	}
    }

  //De-Stuffing
  printf ("\nThe De-Stuffed data stream:\n");
  for (j = 2; j < i - 2; j++)
    {
      if (array[j] == DLE)
	{
	  printf ("DLE");
	  j++;
	}
      else if (array[j] == STX)
	{
	  printf ("STX");
	}
      else if (array[j] == ETX)
	{
	  printf ("ETX");
	}
      else
	{
	  printf ("%c", array[j]);
	}
    }

  getch ();
  return 0;
}