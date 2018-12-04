#include "pitch_shift.h"


void pitchshift (STREAM_T &InA, STREAM_T &InB, STREAM_T &OutA, STREAM_T &OutB, int Len) {

#pragma HLS INTERFACE s_axilite port=Len bundle=ctrl
#pragma HLS INTERFACE axis port=InA
#pragma HLS INTERFACE axis port=InB
#pragma HLS INTERFACE axis port=OutA
#pragma HLS INTERFACE axis port=OutB
#pragma HLS INTERFACE s_axilite port=return bundle=ctrl

#pragma HLS dataflow

	AXI_T tmp_A, tmp_B;
	AXI_T tmp_OutA, tmp_OutB;

	float Hanning[LENGTH], Buff_A[LENGTH], Buff_B[LENGTH];


for (int i = 0; i < Len; i++) {
#pragma HLS pipeline
	Hanning[i] = (1-cos(2*Pi*i/Len))/2;
	InA >> tmp_A;
	InB >> tmp_B;
	Buff_A[i] = tmp_A.data * Hanning[i];
	Buff_B[i] = tmp_B.data * Hanning[i];
}


for (int i = 0; i < Len; i++) {
#pragma HLS pipeline
	tmp_OutA.data = Buff_A[i];
	tmp_OutB.data = Buff_B[i];
	if(i == Len - 1) {
		tmp_OutA.last = 1;
		tmp_OutB.last = 1;
	} else {
		tmp_OutA.last = 0;
		tmp_OutB.last = 0;
	}
	tmp_OutA.keep = 0xf;
	tmp_OutA.strb = 0xf;
	tmp_OutB.keep = 0xf;
	tmp_OutB.strb = 0xf;
	OutA << tmp_OutA;
	OutB << tmp_OutB;
}

}

