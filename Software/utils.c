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
 * Filename:    utils.c                                                    *
 *                                                                         *
 ***************************************************************************/


extern volatile unsigned char seconds;
extern volatile unsigned char tick;
extern volatile unsigned char buttonTime;
extern volatile unsigned char buttonEvent;

/* 
 * Interrupt service routine, called whenever any interrupt occurs
 */
interrupt isr(void) {
	// Timer 0 interrupt every 1/128s
	if(INTCON & 0b00000100) {
		// Clear interrupt flag
		T0IF = 0;
		if(!RA2) {
			// button is pressed
			if(buttonTime < 255) {
				buttonTime++;
			}	
			else
				PORTC = ~0x00;
		}
		else {
			if(buttonTime) {
				if(buttonTime > 70) 
					buttonEvent = 2;
				else
					buttonEvent = 1;
				RB7 = 1;
			}
			buttonTime = 0;
		}
	}

	// Timer 1 interrupt every 0.2s
	if(PIR1 & 0b00000001) {
		// Clear interrupt flag
		PIR1 &= 0b11111110;
		TMR1H = 0xFF;
		TMR1L = 0x58;
	}

	// Timer 2 interrupt at exactly 1Hz
	if(PIR1 & 0x02) {
		seconds++;
		tick = 1;
		TMR2IF = 0;
	}
}

/* 
 * Initiates various registers to setup the PICs peripherals
 */
void init(void) {
	// port directions: 1=input, 0=output
	TRISA = 0b00000100;
	TRISB = 0b00000000;
	TRISC = 0b00000000;
	// Disable ADC inputs (all pins are digital)
	ANSEL = 0b00000000;
	ANSELH = 0b00000000;
	// Clear the timers
	TMR1H = 0xFF;
	TMR1L = 0x58;
	TMR0 = 0x00;
	
	// Timer 0 setup
	T0CS = 0; // internal clock source
	


	// Timer 1 setup
	T1CON = 0b00110001;

	// Timer 2 setup
	T2CON = 0b01111101;
	PR2 = 0x7F;

	// GIE, TMR0, PEIE Interrupts
	INTCON = 0b11100000;
	// TMR1 and TMR2 Interrupt enable
	PIE1 = 0b00000011;

	// Enable weak pull-up for RA2
	WPUA = 0b00000100;

	// Disable comparators
	CM1CON0 = 0x00;
	CM2CON0 = 0x00;
	T0CS = 0x0;
}