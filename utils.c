volatile unsigned char tripped = 0;
volatile unsigned char sec_elapsed = 0;
volatile unsigned char sec_count = 0;


/* 
 * Interrupt service routine, called whenever any interrupt occurs
 */
interrupt isr(void) {
	// There's been an interrupt on RA2
	if(INTCON & 0b00000010) {
		if((TMR0 > 65) || (tripped == 1)) {
			// If it's been more than ~10mS or the timer has overflowed
		}
		TMR0 = 0x00;
		// Clear the interrupt flag
		INTCON &= 0b11111101;
	}

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
		TMR1H = 0x9E;
		TMR1L = 0x58;
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
	TMR1H = 0x00;
	TMR1L = 0x00;
	TMR0 = 0x00;
	// Timer 1 setup
	T1CON = 0b00110001;

	// GIE, RA2, TMR0, PEIE Interrupts
	//INTCON = 0b11110000;
	// TMR1 Interrupt enable
	PIE1 = 0b00000001;
	// Disable Weak Pull-ups
	WPUA = 0x00;
	// Disable comparators
	CM1CON0 = 0x00;
	CM2CON0 = 0x00;
	T0CS = 0x0;
}