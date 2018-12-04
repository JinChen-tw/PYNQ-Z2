#include "testloop.h"

void testloop(din_t A, dout_t& X) {
#pragma HLS INTERFACE ap_ctrl_none port=return
#pragma HLS INTERFACE s_axilite port= A
#pragma HLS INTERFACE s_axilite port= X
int i,j,k;
dout_t accum=0;
	for(i=0;i<A;i++)
		for(j=0;j<A;j++)
			for(k=0;k<A;k++)
				accum += k-j*3+i*3;
	X = accum;
}
