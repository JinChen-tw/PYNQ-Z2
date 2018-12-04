#include "testloop.h"

int main () {
	  int d[5],in[5];
	  int ref[5],out[5];
	  int i=0;
	  // Create input data
	  for (i=0;i<5;i++) {
		  in[i]=i+17;
		  d[i]=in[i];
		  // Call the function to operate on the data
		  testloop(d[i],ref[i]);
	  }
	  //Print the output
	  printf(" Din Dout\n");
	  for (i=0;i<5;i++) {
		  out[i]=ref[i];
		  printf("%d   %d\n", in[i], out[i]);
	  }
}
