extern unsigned char seconds;
extern unsigned char minutes;
extern unsigned char hours;

/* 
 * Interrupt service routine, called whenever any interrupt occurs
 */
interrupt isr(void) {
	// Timer 0 interrupt every 256uS
	if(INTCON & 0b00000100) {
		// Clear interrupt flag
		INTCON &= 0b11111011;
	}

	// Timer 1 interrupt every 0.2s
	if(PIR1 & 0b00000001) {
		if(sec_count > 4) {
			// It's been 1 second, set the flag to output data
			sec_elapsed = 1;
			sec_count = 0;
		}
		sec_count++;
		
		// Clear interrupt flag
		PIR1 &= 0b11111110;
		TMR1H = 0xFF;
		TMR1L = 0x58;
	}

	// Timer 2 interrupt
	if(PIR1 & 0x02) {
		seconds++;
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
	// Enable ADC channel 8 Disable channel 2
	ANSEL = 0b00000000;
	ANSELH = 0b00000011;
	// Clear the timers
	TMR1H = 0xFF;
	TMR1L = 0x58;
	TMR0 = 0x00;
	// Timer 1 setup
	T1CON = 0b00110001;

	// Timer 2 setup
	T2CON = 0b01111101;
	PR2 = 0x80;

	// GIE, TMR0, PEIE Interrupts
	INTCON = 0b11100000;
	// TMR1 and TMR2 Interrupt enable
	PIE1 = 0b00000011;
	// Disable Weak Pull-ups
	WPUA = 0x00;
	// Disable comparators
	CM1CON0 = 0x00;
	CM2CON0 = 0x00;
	T0CS = 0x0;
}