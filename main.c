/***************************************************************************
 *                                                                         *
 *  This program is free software; you can redistribute it and/or modify   *
 *  it under the terms of the GNU General Public License as published by   *
 *  the Free Software Foundation; either version 2 of the License, or      *
 *  (at your option) any later version.                                    *
 *                                                                         *
 *  This program is distributed in the hope that it will be useful,        *
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of         *
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the          *
 *  GNU General Public License for more details.                           *
 *                                                                         *
 *  You should have received a copy of the GNU General Public License      *
 *  along with this program; if not, write to the Free Software            *
 *  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111 USA    *
 *                                                                         *
 ***************************************************************************
 *                                                                         *
 *               (c) Copyright, 2011 Elijah Brown                          *
 *                                                                         *
 ***************************************************************************
 *                                                                         *
 * Filename:    main.c                                                     *
 *                                                                         *
 ***************************************************************************/


#include <htc.h>
#include <pic.h>
#define _XTAL_FREQ 32768
#include "utils.c"

__CONFIG(LP & WDTDIS & PWRTEN & MCLRDIS & UNPROTECT & UNPROTECT & BORDIS & IESODIS & FCMDIS);

// Function Prototypes
void init(void);

char numLookup[10] = {
	0b10111101,  // 0
	0b00000101,  // 1
	0b11110100,  // 2
	0b11100101,  // 3
	0b01001101,  // 4
	0b11101001,  // 5
	0b11111001,  // 6
	0b10000101,  // 7
	0b11111101,  // 8
	0b11101101   // 9
};

char numLookupDec[10] = {
	0b10111111,  // 0
	0b00000111,  // 1
	0b11110110,  // 2
	0b11100111,  // 3
	0b01001111,  // 4
	0b11101011,  // 5
	0b11111011,  // 6
	0b10000111,  // 7
	0b11111111,  // 8
	0b11101111   // 9
};

volatile unsigned char tick = 0;
volatile unsigned char seconds = 0;
volatile unsigned char minutes = 0;
volatile unsigned char buttonTime = 0;
volatile unsigned char buttonEvent = 0;

unsigned char hours = 12;

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
			// state machine updates on the 1 Hz tick
			if(++state > 5)
				state = 0;
			PORTC = ~0x00;
			__delay_ms(100);
			tick = 0;
		}
	
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
		
		// toggle test point
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
		
		// Holding the button down puts the clock into set mode
		if(buttonEvent == 2) {
			buttonEvent = 0;
			clkState = SETHOUR;
			state = HOURONE;
			setTime();
		}
	}
}

void setTime() {
	while(clkState != RUNNING) {
		switch(clkState) {
			case SETHOUR:
				if(tick) {
					if(++state > 2)
						state = 0;
					PORTC = ~0x02;
					__delay_ms(100);
					tick = 0;
				}
		
				if(buttonEvent == 2) {
					buttonEvent = 0;
					clkState = SETMIN;
					state = MINONE;
					break;
				}
				if(buttonEvent == 1) {
					buttonEvent = 0;
					if(++hours > 23)
						hours = 0;
				}
				switch(state) {
					case HOURONE:
						PORTC = ~numLookupDec[(hours / 10)];
						break;
					case HOURTWO:
						PORTC = ~numLookupDec[(hours % 10)];
						break;
					case MINONE:
						PORTC = ~0x02;
						break;
				}
				break;

			case SETMIN:
				if(tick) {
					if(++state > 4)
						state = 2;
					PORTC = ~0x02;
					__delay_ms(100);
					tick = 0;
				}

				if(buttonEvent == 2) {
					buttonEvent = 0;
					clkState = RUNNING;
				}
				if(buttonEvent == 1) {
					buttonEvent = 0;
					if(++minutes > 59)
						minutes = 0;
				}
				switch(state) {
					case MINONE:
						PORTC = ~numLookupDec[(minutes / 10)];
						break;
					case MINTWO:
						PORTC = ~numLookupDec[(minutes % 10)];
						break;
					case OFF0:
						PORTC = ~0x02;
						break;
				}
				break;
		}		
	}
}

