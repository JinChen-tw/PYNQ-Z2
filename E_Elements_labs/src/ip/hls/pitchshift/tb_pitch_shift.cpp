#include <stdio.h>
#include "pitch_shift.h"

int main() {

	STREAM_T ina, inb, outa, outb;
	AXI_T tmpa, tmpb, tmp_outa, tmp_outb;

	for (int i=0; i<LENGTH; i++){
		tmpa.data = i % 256;
		tmpa.keep = 0xf;
		tmpa.strb = 0xf;
		ina << tmpa;

		tmpb.data = i % 256;
		tmpb.keep = 0xf;
		tmpb.strb = 0xf;
		inb << tmpb;
	}

	pitchshift(ina, inb, outa, outb, LENGTH);

	for (int i=0; i<LENGTH; i++){
		outa >> tmp_outa;
		outb >> tmp_outb;
		printf("i: %d OutA: %d OutB: %d\n",(int)i, (int)tmp_outa.data, (int)tmp_outb.data);
	}

   return 0;
}


