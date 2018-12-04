#ifndef __PITCHSHIFT_H__
#define __PITCHSHIFT_H__

#include <iostream>
#include <hls_stream.h>
#include <ap_axi_sdata.h>
#include <math.h>


using namespace std;

#define LENGTH 8192
#define Pi 3.1415926

typedef ap_axis<32,1,1,1> AXI_T;
typedef hls::stream<AXI_T> STREAM_T;

void pitchshift (STREAM_T &InA, STREAM_T &InB, STREAM_T &OutA, STREAM_T &OutB, int Len);


#endif // __PITCHSHIFT_H__ not defined
