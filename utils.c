extern volatile unsigned char seconds;
extern volatile unsigned char tick;
extern volatile unsigned char buttonTime;

extern volatile unsigned char buttonEvent;
//extern volatile unsigned char buttonQueuePtr;

/* 
 * Interrupt service routine, called whenever any interrupt occurs
 */
interrupt isr(void) {
	// Timer 0 interrupt every 1/128s
	if(INTCON & 0b00000100) {
		// Clear interrupt flag
		T0IF = 0;
		if(!RB6) {
			// button is pressed
			if(buttonTime < 255) {
				buttonTime++;
			}	
		}
		else {
			if(buttonTime) {
				if(buttonTime > 200) 
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

	// Timer 2 interrupt
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
	TRISB = 0b01000000;
	TRISC = 0b00000000;
	// Enable ADC channel 8 Disable channel 2
	ANSEL = 0b00000000;
	ANSELH = 0b00000011;
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
	// Disable Weak Pull-ups
	WPUA = 0x00;
	// Enable weak pull-up for RB6
	WPUB = 0b01000000;

	// Disable comparators
	CM1CON0 = 0x00;
	CM2CON0 = 0x00;
	T0CS = 0x0;
}