#include <htc.h>
#include <pic.h>
#define _XTAL_FREQ 32768
#include "utils.c"


__CONFIG(LP & WDTDIS & PWRTEN & MCLRDIS & UNPROTECT & UNPROTECT & BORDIS & IESODIS & FCMDIS);

// Function Prototypes
void init(void);


//volatile int numDisplay = 0;

char numLookup[10] = {
	0b10111110,  // 0
	0b10000010,  // 1
	0b01110110,  // 2
	0b11010110,  // 3
	0b11001010,  // 4
	0b11011100,  // 5
	0b11111100,  // 6
	0b10000110,  // 7
	0b11111110,  // 8
	0b11011110   // 9
};

volatile unsigned char tick = 0;
volatile unsigned char seconds = 0;
volatile unsigned char minutes = 33;
volatile unsigned char buttonTime = 0;

// contains button 'events'.  A byte set to 1 is a short press, and a byte set to 2 is a long press
volatile unsigned char buttonEvent = 0;
//volatile unsigned char buttonQueuePtr = 0;

unsigned char hours = 17;

enum displayState {
	HOURONE = 0,
	HOURTWO = 1,
	MINONE  = 2,
	MINTWO  = 3,
	OFF0    = 4,
	OFF1    = 5
};

enum runState {
	RUNNING = 0,
	SETHOUR = 1,
	SETMIN  = 2
};

enum displayState state = HOURONE;
enum runState  clkState = RUNNING;

void setTime();

void main(void) {
	init();

	while (1) {
		if(tick) {
			state++;
			PORTC = ~0x00;
			__delay_ms(100);
			tick = 0;
		}
		if(state > 5)
			state = 0;

		if(seconds > 59) {
			minutes++;
			seconds = 0;
		}
		if(minutes > 59) {
			hours++;
			minutes = 0;
		}
		if(hours > 23)
			hours = 0;
		
		/*if(seconds) {
			//__delay_ms(100);
			numDisplay++;
			if(numDisplay > 9)
				numDisplay = 0;
			PORTC = ~numLookup[numDisplay];
			seconds = 0;
		} */
		RB7 = 0; 

		switch(state) {
			case HOURONE:
				// drop the leading zero
				if(!(hours / 10)) {
					state = HOURTWO;
					break;
				}
				PORTC = ~numLookup[(hours / 10)];
				break;
			case HOURTWO:
				PORTC = ~numLookup[(hours % 10)];
				break;
			case MINONE:
				PORTC = ~numLookup[(minutes / 10)];
				break;
			case MINTWO:
				PORTC = ~numLookup[(minutes % 10)];
				break;
			case OFF0:
				PORTC = ~0x00;
				break;
			case OFF1:
				PORTC = ~0x00;
				break;
		}

		//RB7 = 1;
		
		if(buttonEvent) {
			buttonEvent = 0;
			clkState = SETHOUR;
			setTime();
		}
	}
}

void setTime() {
	while(clkState != RUNNING) {
		__delay_ms(100);
		PORTC = ~numLookup[4];
		__delay_ms(100);
		PORTC = ~numLookup[3];
		__delay_ms(100);
		PORTC = ~numLookup[2];
		__delay_ms(100);
		PORTC = ~numLookup[1];
		
		clkState = RUNNING;
	}
}

