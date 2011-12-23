opt subtitle "HI-TECH Software Omniscient Code Generator (PRO mode) build 6446"

opt pagewidth 120

	opt pm

	processor	16F690
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
pc	equ	2
pcl	equ	2
status	equ	3
fsr	equ	4
fsr0	equ	4
c	equ	1
z	equ	0
pclath	equ	10
# 7 "C:\Documents and Settings\Elijah\My Documents\PICs\C\VFDclock\main.c"
	psect config,class=CONFIG,delta=2 ;#
# 7 "C:\Documents and Settings\Elijah\My Documents\PICs\C\VFDclock\main.c"
	dw 0x3FF8 & 0x3FF7 & 0x3FEF & 0x3FDF & 0x3FFF & 0x3FFF & 0x3CFF & 0x3BFF & 0x37FF ;#
	FNCALL	_main,_init
	FNCALL	_main,___lbdiv
	FNCALL	_main,___lbmod
	FNCALL	_main,_setTime
	FNROOT	_main
	FNCALL	intlevel1,_isr
	global	intlevel1
	FNROOT	intlevel1
	global	_numLookup
	global	_hours
	global	_minutes
psect	idataBANK0,class=CODE,space=0,delta=2
global __pidataBANK0
__pidataBANK0:
	file	"C:\Documents and Settings\Elijah\My Documents\PICs\C\VFDclock\main.c"
	line	15

;initializer for _numLookup
	retlw	0BEh
	retlw	082h
	retlw	076h
	retlw	0D6h
	retlw	0CAh
	retlw	0DCh
	retlw	0FCh
	retlw	086h
	retlw	0FEh
	retlw	0DEh
psect	idataCOMMON,class=CODE,space=0,delta=2
global __pidataCOMMON
__pidataCOMMON:
	line	37

;initializer for _hours
	retlw	011h
	line	30

;initializer for _minutes
	retlw	021h
	global	_clkState
	global	_state
	global	_buttonEvent
	global	_buttonTime
	global	_seconds
	global	_tick
	global	_INTCON
_INTCON	set	11
	global	_PIR1
_PIR1	set	12
	global	_PORTC
_PORTC	set	7
	global	_T1CON
_T1CON	set	16
	global	_T2CON
_T2CON	set	18
	global	_TMR0
_TMR0	set	1
	global	_TMR1H
_TMR1H	set	15
	global	_TMR1L
_TMR1L	set	14
	global	_RB6
_RB6	set	54
	global	_RB7
_RB7	set	55
	global	_T0IF
_T0IF	set	90
	global	_TMR2IF
_TMR2IF	set	97
	global	_PIE1
_PIE1	set	140
	global	_PR2
_PR2	set	146
	global	_TRISA
_TRISA	set	133
	global	_TRISB
_TRISB	set	134
	global	_TRISC
_TRISC	set	135
	global	_WPUA
_WPUA	set	149
	global	_T0CS
_T0CS	set	1037
	global	_ANSEL
_ANSEL	set	286
	global	_ANSELH
_ANSELH	set	287
	global	_CM1CON0
_CM1CON0	set	281
	global	_CM2CON0
_CM2CON0	set	282
	global	_WPUB
_WPUB	set	277
	file	"VFDclock.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssCOMMON,class=COMMON,space=1
global __pbssCOMMON
__pbssCOMMON:
_buttonEvent:
       ds      1

_buttonTime:
       ds      1

_seconds:
       ds      1

_tick:
       ds      1

psect	dataCOMMON,class=COMMON,space=1
global __pdataCOMMON
__pdataCOMMON:
	file	"C:\Documents and Settings\Elijah\My Documents\PICs\C\VFDclock\main.c"
	line	37
_hours:
       ds      1

psect	dataCOMMON
	file	"C:\Documents and Settings\Elijah\My Documents\PICs\C\VFDclock\main.c"
	line	30
_minutes:
       ds      1

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_clkState:
       ds      1

_state:
       ds      1

psect	dataBANK0,class=BANK0,space=1
global __pdataBANK0
__pdataBANK0:
	file	"C:\Documents and Settings\Elijah\My Documents\PICs\C\VFDclock\main.c"
	line	15
_numLookup:
       ds      10

; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbssCOMMON)+0)&07Fh
	clrf	((__pbssCOMMON)+1)&07Fh
	clrf	((__pbssCOMMON)+2)&07Fh
	clrf	((__pbssCOMMON)+3)&07Fh
; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	clrf	((__pbssBANK0)+0)&07Fh
	clrf	((__pbssBANK0)+1)&07Fh
; Initialize objects allocated to BANK0
	global __pidataBANK0
psect cinit,class=CODE,delta=2
	fcall	__pidataBANK0+0		;fetch initializer
	movwf	__pdataBANK0+0&07fh		
	fcall	__pidataBANK0+1		;fetch initializer
	movwf	__pdataBANK0+1&07fh		
	fcall	__pidataBANK0+2		;fetch initializer
	movwf	__pdataBANK0+2&07fh		
	fcall	__pidataBANK0+3		;fetch initializer
	movwf	__pdataBANK0+3&07fh		
	fcall	__pidataBANK0+4		;fetch initializer
	movwf	__pdataBANK0+4&07fh		
	fcall	__pidataBANK0+5		;fetch initializer
	movwf	__pdataBANK0+5&07fh		
	fcall	__pidataBANK0+6		;fetch initializer
	movwf	__pdataBANK0+6&07fh		
	fcall	__pidataBANK0+7		;fetch initializer
	movwf	__pdataBANK0+7&07fh		
	fcall	__pidataBANK0+8		;fetch initializer
	movwf	__pdataBANK0+8&07fh		
	fcall	__pidataBANK0+9		;fetch initializer
	movwf	__pdataBANK0+9&07fh		
; Initialize objects allocated to COMMON
	global __pidataCOMMON
psect cinit,class=CODE,delta=2
	fcall	__pidataCOMMON+0		;fetch initializer
	movwf	__pdataCOMMON+0&07fh		
	fcall	__pidataCOMMON+1		;fetch initializer
	movwf	__pdataCOMMON+1&07fh		
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_setTime
?_setTime:	; 0 bytes @ 0x0
	global	??_isr
??_isr:	; 0 bytes @ 0x0
	global	?_init
?_init:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_isr
?_isr:	; 2 bytes @ 0x0
	ds	2
	global	??_setTime
??_setTime:	; 0 bytes @ 0x2
	global	??_init
??_init:	; 0 bytes @ 0x2
	global	?___lbdiv
?___lbdiv:	; 1 bytes @ 0x2
	global	?___lbmod
?___lbmod:	; 1 bytes @ 0x2
	global	___lbdiv@divisor
___lbdiv@divisor:	; 1 bytes @ 0x2
	global	___lbmod@divisor
___lbmod@divisor:	; 1 bytes @ 0x2
	ds	1
	global	??___lbdiv
??___lbdiv:	; 0 bytes @ 0x3
	global	??___lbmod
??___lbmod:	; 0 bytes @ 0x3
	global	___lbdiv@dividend
___lbdiv@dividend:	; 1 bytes @ 0x3
	ds	1
	global	___lbdiv@counter
___lbdiv@counter:	; 1 bytes @ 0x4
	ds	1
	global	___lbdiv@quotient
___lbdiv@quotient:	; 1 bytes @ 0x5
	ds	1
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	___lbmod@dividend
___lbmod@dividend:	; 1 bytes @ 0x0
	ds	1
	global	___lbmod@counter
___lbmod@counter:	; 1 bytes @ 0x1
	ds	1
	global	___lbmod@rem
___lbmod@rem:	; 1 bytes @ 0x2
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0x3
	ds	1
;;Data sizes: Strings 0, constant 0, data 12, bss 6, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      6      12
;; BANK0           80      4      16
;; BANK1           80      0       0
;; BANK2           80      0       0

;;
;; Pointer list with targets:



;;
;; Critical Paths under _main in COMMON
;;
;;   _main->___lbdiv
;;
;; Critical Paths under _isr in COMMON
;;
;;   None.
;;
;; Critical Paths under _main in BANK0
;;
;;   _main->___lbmod
;;
;; Critical Paths under _isr in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _isr in BANK1
;;
;;   None.
;;
;; Critical Paths under _main in BANK2
;;
;;   None.
;;
;; Critical Paths under _isr in BANK2
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 1, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 1     1      0     394
;;                                              3 BANK0      1     1      0
;;                               _init
;;                            ___lbdiv
;;                            ___lbmod
;;                            _setTime
;; ---------------------------------------------------------------------------------
;; (1) _setTime                                              1     1      0       0
;;                                              2 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; (1) ___lbmod                                              5     4      1     232
;;                                              2 COMMON     2     1      1
;;                                              0 BANK0      3     3      0
;; ---------------------------------------------------------------------------------
;; (1) ___lbdiv                                              4     3      1     162
;;                                              2 COMMON     4     3      1
;; ---------------------------------------------------------------------------------
;; (1) _init                                                 0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 1
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (2) _isr                                                  2     2      0       0
;;                                              0 COMMON     2     2      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 2
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _init
;;   ___lbdiv
;;   ___lbmod
;;   _setTime
;;
;; _isr (ROOT)
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;SFR3                 0      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;BANK2               50      0       0       7        0.0%
;;BITBANK2            50      0       0       6        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR1                 0      0       0       2        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;BANK1               50      0       0       5        0.0%
;;BITBANK1            50      0       0       4        0.0%
;;CODE                 0      0       0       0        0.0%
;;DATA                 0      0      1D      10        0.0%
;;ABS                  0      0      1C       8        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       1       2        0.0%
;;BANK0               50      4      10       3       20.0%
;;BITBANK0            50      0       0       9        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;COMMON               E      6       C       1       85.7%
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 59 in file "C:\Documents and Settings\Elijah\My Documents\PICs\C\VFDclock\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 60/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          0       1       0       0
;;      Totals:         0       1       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_init
;;		___lbdiv
;;		___lbmod
;;		_setTime
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\Documents and Settings\Elijah\My Documents\PICs\C\VFDclock\main.c"
	line	59
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 8
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	60
	
l1575:	
;main.c: 60: init();
	fcall	_init
	line	63
	
l1577:	
;main.c: 63: if(tick) {
	movf	(_tick),w	;volatile
	skipz
	goto	u410
	goto	l1587
u410:
	line	64
	
l1579:	
;main.c: 64: state++;
	bcf	status, 5	;RP0=0, select bank0
	incf	(_state),f
	line	65
	
l1581:	
;main.c: 65: PORTC = ~0x00;
	movlw	(0FFh)
	movwf	(7)	;volatile
	line	66
	
l1583:	
;main.c: 66: _delay((unsigned long)((100)*(32768/4000.0)));
	opt asmopt_off
movlw	204
movwf	(??_main+0)+0,f
u487:
	clrwdt
decfsz	(??_main+0)+0,f
	goto	u487
	nop2	;nop
opt asmopt_on

	line	67
	
l1585:	
;main.c: 67: tick = 0;
	clrf	(_tick)	;volatile
	line	69
	
l1587:	
;main.c: 68: }
;main.c: 69: if(state > 5)
	movlw	(06h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	subwf	(_state),w
	skipc
	goto	u421
	goto	u420
u421:
	goto	l1591
u420:
	line	70
	
l1589:	
;main.c: 70: state = 0;
	clrf	(_state)
	line	72
	
l1591:	
;main.c: 72: if(seconds > 59) {
	movlw	(03Ch)
	subwf	(_seconds),w	;volatile
	skipc
	goto	u431
	goto	u430
u431:
	goto	l1597
u430:
	line	73
	
l1593:	
;main.c: 73: minutes++;
	incf	(_minutes),f	;volatile
	line	74
	
l1595:	
;main.c: 74: seconds = 0;
	clrf	(_seconds)	;volatile
	line	76
	
l1597:	
;main.c: 75: }
;main.c: 76: if(minutes > 59) {
	movlw	(03Ch)
	subwf	(_minutes),w	;volatile
	skipc
	goto	u441
	goto	u440
u441:
	goto	l1603
u440:
	line	77
	
l1599:	
;main.c: 77: hours++;
	incf	(_hours),f
	line	78
	
l1601:	
;main.c: 78: minutes = 0;
	clrf	(_minutes)	;volatile
	line	80
	
l1603:	
;main.c: 79: }
;main.c: 80: if(hours > 23)
	movlw	(018h)
	subwf	(_hours),w
	skipc
	goto	u451
	goto	u450
u451:
	goto	l1607
u450:
	line	81
	
l1605:	
;main.c: 81: hours = 0;
	clrf	(_hours)
	line	91
	
l1607:	
;main.c: 91: RB7 = 0;
	bcf	(55/8),(55)&7
	line	93
;main.c: 93: switch(state) {
	goto	l1627
	line	96
	
l1609:	
;main.c: 96: if(!(hours / 10)) {
	movlw	(0Ah)
	movwf	(?___lbdiv)
	movf	(_hours),w
	fcall	___lbdiv
	iorlw	0
	skipz
	goto	u461
	goto	u460
u461:
	goto	l1613
u460:
	line	97
	
l1611:	
;main.c: 97: state = HOURTWO;
	clrf	(_state)
	incf	(_state),f
	line	98
;main.c: 98: break;
	goto	l1629
	line	100
	
l1613:	
;main.c: 99: }
;main.c: 100: PORTC = ~numLookup[(hours / 10)];
	movlw	(0Ah)
	movwf	(?___lbdiv)
	movf	(_hours),w
	fcall	___lbdiv
	addlw	_numLookup&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	comf	indf,w
	movwf	(7)	;volatile
	line	101
;main.c: 101: break;
	goto	l1629
	line	103
	
l1615:	
;main.c: 103: PORTC = ~numLookup[(hours % 10)];
	movlw	(0Ah)
	movwf	(?___lbmod)
	movf	(_hours),w
	fcall	___lbmod
	addlw	_numLookup&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	comf	indf,w
	movwf	(7)	;volatile
	line	104
;main.c: 104: break;
	goto	l1629
	line	106
	
l1617:	
;main.c: 106: PORTC = ~numLookup[(minutes / 10)];
	movlw	(0Ah)
	movwf	(?___lbdiv)
	movf	(_minutes),w	;volatile
	fcall	___lbdiv
	addlw	_numLookup&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	comf	indf,w
	movwf	(7)	;volatile
	line	107
;main.c: 107: break;
	goto	l1629
	line	109
	
l1619:	
;main.c: 109: PORTC = ~numLookup[(minutes % 10)];
	movlw	(0Ah)
	movwf	(?___lbmod)
	movf	(_minutes),w	;volatile
	fcall	___lbmod
	addlw	_numLookup&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	comf	indf,w
	movwf	(7)	;volatile
	line	110
;main.c: 110: break;
	goto	l1629
	line	112
	
l1621:	
;main.c: 112: PORTC = ~0x00;
	movlw	(0FFh)
	movwf	(7)	;volatile
	line	113
;main.c: 113: break;
	goto	l1629
	line	93
	
l1627:	
	movf	(_state),w
	; Switch size 1, requested type "space"
; Number of cases is 6, Range of values is 0 to 5
; switch strategies available:
; Name         Bytes Cycles
; simple_byte    19    10 (average)
; direct_byte    28    16 (fixed)
;	Chosen strategy is simple_byte

	xorlw	0^0	; case 0
	skipnz
	goto	l1609
	xorlw	1^0	; case 1
	skipnz
	goto	l1615
	xorlw	2^1	; case 2
	skipnz
	goto	l1617
	xorlw	3^2	; case 3
	skipnz
	goto	l1619
	xorlw	4^3	; case 4
	skipnz
	goto	l1621
	xorlw	5^4	; case 5
	skipnz
	goto	l1621
	goto	l1629

	line	121
	
l1629:	
;main.c: 121: if(buttonEvent) {
	movf	(_buttonEvent),w	;volatile
	skipz
	goto	u470
	goto	l1577
u470:
	line	122
	
l1631:	
;main.c: 122: buttonEvent = 0;
	clrf	(_buttonEvent)	;volatile
	line	123
	
l1633:	
;main.c: 123: clkState = SETHOUR;
	clrf	(_clkState)
	incf	(_clkState),f
	line	124
	
l1635:	
;main.c: 124: setTime();
	fcall	_setTime
	goto	l1577
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

psect	maintext
	line	127
	signat	_main,88
	global	_setTime
psect	text190,local,class=CODE,delta=2
global __ptext190
__ptext190:

;; *************** function _setTime *****************
;; Defined at:
;;		line 129 in file "C:\Documents and Settings\Elijah\My Documents\PICs\C\VFDclock\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          1       0       0       0
;;      Totals:         1       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text190
	file	"C:\Documents and Settings\Elijah\My Documents\PICs\C\VFDclock\main.c"
	line	129
	global	__size_of_setTime
	__size_of_setTime	equ	__end_of_setTime-_setTime
	
_setTime:	
	opt	stack 7
; Regs used in _setTime: [wreg+status,2+status,0]
	line	130
	
l1469:	
;main.c: 130: while(clkState != RUNNING) {
	goto	l1483
	line	131
	
l1471:	
;main.c: 131: _delay((unsigned long)((100)*(32768/4000.0)));
	opt asmopt_off
movlw	204
movwf	(??_setTime+0)+0,f
u497:
	clrwdt
decfsz	(??_setTime+0)+0,f
	goto	u497
	nop2	;nop
opt asmopt_on

	line	132
	
l1473:	
;main.c: 132: PORTC = ~numLookup[4];
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	comf	0+(_numLookup)+04h,w
	movwf	(7)	;volatile
	line	133
	
l1475:	
;main.c: 133: _delay((unsigned long)((100)*(32768/4000.0)));
	opt asmopt_off
movlw	204
movwf	(??_setTime+0)+0,f
u507:
	clrwdt
decfsz	(??_setTime+0)+0,f
	goto	u507
	nop2	;nop
opt asmopt_on

	line	134
;main.c: 134: PORTC = ~numLookup[3];
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	comf	0+(_numLookup)+03h,w
	movwf	(7)	;volatile
	line	135
	
l1477:	
;main.c: 135: _delay((unsigned long)((100)*(32768/4000.0)));
	opt asmopt_off
movlw	204
movwf	(??_setTime+0)+0,f
u517:
	clrwdt
decfsz	(??_setTime+0)+0,f
	goto	u517
	nop2	;nop
opt asmopt_on

	line	136
	
l1479:	
;main.c: 136: PORTC = ~numLookup[2];
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	comf	0+(_numLookup)+02h,w
	movwf	(7)	;volatile
	line	137
;main.c: 137: _delay((unsigned long)((100)*(32768/4000.0)));
	opt asmopt_off
movlw	204
movwf	(??_setTime+0)+0,f
u527:
	clrwdt
decfsz	(??_setTime+0)+0,f
	goto	u527
	nop2	;nop
opt asmopt_on

	line	138
	
l1481:	
;main.c: 138: PORTC = ~numLookup[1];
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	comf	0+(_numLookup)+01h,w
	movwf	(7)	;volatile
	line	140
;main.c: 140: clkState = RUNNING;
	clrf	(_clkState)
	line	130
	
l1483:	
	movf	(_clkState),f
	skipz
	goto	u301
	goto	u300
u301:
	goto	l1471
u300:
	line	142
	
l778:	
	return
	opt stack 0
GLOBAL	__end_of_setTime
	__end_of_setTime:
;; =============== function _setTime ends ============

	signat	_setTime,88
	global	___lbmod
psect	text191,local,class=CODE,delta=2
global __ptext191
__ptext191:

;; *************** function ___lbmod *****************
;; Defined at:
;;		line 5 in file "C:\Program Files\HI-TECH Software\PICC\9.71a\sources\lbmod.c"
;; Parameters:    Size  Location     Type
;;  dividend        1    wreg     unsigned char 
;;  divisor         1    2[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  dividend        1    0[BANK0 ] unsigned char 
;;  rem             1    2[BANK0 ] unsigned char 
;;  counter         1    1[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         1       0       0       0
;;      Locals:         0       3       0       0
;;      Temps:          1       0       0       0
;;      Totals:         2       3       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text191
	file	"C:\Program Files\HI-TECH Software\PICC\9.71a\sources\lbmod.c"
	line	5
	global	__size_of___lbmod
	__size_of___lbmod	equ	__end_of___lbmod-___lbmod
	
___lbmod:	
	opt	stack 7
; Regs used in ___lbmod: [wreg+status,2+status,0]
;___lbmod@dividend stored from wreg
	line	9
	movwf	(___lbmod@dividend)
	
l1557:	
	movlw	(08h)
	movwf	(___lbmod@counter)
	line	10
	
l1559:	
	clrf	(___lbmod@rem)
	line	12
	
l1561:	
	movf	(___lbmod@dividend),w
	movwf	(??___lbmod+0)+0
	movlw	07h
u385:
	clrc
	rrf	(??___lbmod+0)+0,f
	addlw	-1
	skipz
	goto	u385
	clrc
	rlf	(___lbmod@rem),w
	iorwf	0+(??___lbmod+0)+0,w
	movwf	(___lbmod@rem)
	line	13
	
l1563:	
	clrc
	rlf	(___lbmod@dividend),f
	line	14
	
l1565:	
	movf	(___lbmod@divisor),w
	subwf	(___lbmod@rem),w
	skipc
	goto	u391
	goto	u390
u391:
	goto	l1569
u390:
	line	15
	
l1567:	
	movf	(___lbmod@divisor),w
	subwf	(___lbmod@rem),f
	line	16
	
l1569:	
	decfsz	(___lbmod@counter),f
	goto	u401
	goto	u400
u401:
	goto	l1561
u400:
	line	17
	
l1571:	
	movf	(___lbmod@rem),w
	line	18
	
l826:	
	return
	opt stack 0
GLOBAL	__end_of___lbmod
	__end_of___lbmod:
;; =============== function ___lbmod ends ============

	signat	___lbmod,8313
	global	___lbdiv
psect	text192,local,class=CODE,delta=2
global __ptext192
__ptext192:

;; *************** function ___lbdiv *****************
;; Defined at:
;;		line 5 in file "C:\Program Files\HI-TECH Software\PICC\9.71a\sources\lbdiv.c"
;; Parameters:    Size  Location     Type
;;  dividend        1    wreg     unsigned char 
;;  divisor         1    2[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  dividend        1    3[COMMON] unsigned char 
;;  quotient        1    5[COMMON] unsigned char 
;;  counter         1    4[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         1       0       0       0
;;      Locals:         3       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         4       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text192
	file	"C:\Program Files\HI-TECH Software\PICC\9.71a\sources\lbdiv.c"
	line	5
	global	__size_of___lbdiv
	__size_of___lbdiv	equ	__end_of___lbdiv-___lbdiv
	
___lbdiv:	
	opt	stack 7
; Regs used in ___lbdiv: [wreg+status,2+status,0]
;___lbdiv@dividend stored from wreg
	line	9
	movwf	(___lbdiv@dividend)
	
l1427:	
	clrf	(___lbdiv@quotient)
	line	10
	
l1429:	
	movf	(___lbdiv@divisor),w
	skipz
	goto	u230
	goto	l1447
u230:
	line	11
	
l1431:	
	clrf	(___lbdiv@counter)
	incf	(___lbdiv@counter),f
	line	12
	goto	l1435
	
l815:	
	line	13
	clrc
	rlf	(___lbdiv@divisor),f
	line	14
	
l1433:	
	incf	(___lbdiv@counter),f
	line	12
	
l1435:	
	btfss	(___lbdiv@divisor),(7)&7
	goto	u241
	goto	u240
u241:
	goto	l815
u240:
	line	16
	
l817:	
	line	17
	clrc
	rlf	(___lbdiv@quotient),f
	line	18
	
l1437:	
	movf	(___lbdiv@divisor),w
	subwf	(___lbdiv@dividend),w
	skipc
	goto	u251
	goto	u250
u251:
	goto	l1443
u250:
	line	19
	
l1439:	
	movf	(___lbdiv@divisor),w
	subwf	(___lbdiv@dividend),f
	line	20
	
l1441:	
	bsf	(___lbdiv@quotient)+(0/8),(0)&7
	line	22
	
l1443:	
	clrc
	rrf	(___lbdiv@divisor),f
	line	23
	
l1445:	
	decfsz	(___lbdiv@counter),f
	goto	u261
	goto	u260
u261:
	goto	l817
u260:
	line	25
	
l1447:	
	movf	(___lbdiv@quotient),w
	line	26
	
l820:	
	return
	opt stack 0
GLOBAL	__end_of___lbdiv
	__end_of___lbdiv:
;; =============== function ___lbdiv ends ============

	signat	___lbdiv,8313
	global	_init
psect	text193,local,class=CODE,delta=2
global __ptext193
__ptext193:

;; *************** function _init *****************
;; Defined at:
;;		line 53 in file "C:\Documents and Settings\Elijah\My Documents\PICs\C\VFDclock\utils.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/20
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text193
	file	"C:\Documents and Settings\Elijah\My Documents\PICs\C\VFDclock\utils.c"
	line	53
	global	__size_of_init
	__size_of_init	equ	__end_of_init-_init
	
_init:	
	opt	stack 7
; Regs used in _init: [wreg+status,2]
	line	55
	
l1399:	
;utils.c: 55: TRISA = 0b00000100;
	movlw	(04h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(133)^080h	;volatile
	line	56
;utils.c: 56: TRISB = 0b01000000;
	movlw	(040h)
	movwf	(134)^080h	;volatile
	line	57
	
l1401:	
;utils.c: 57: TRISC = 0b00000000;
	clrf	(135)^080h	;volatile
	line	59
	
l1403:	
;utils.c: 59: ANSEL = 0b00000000;
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	clrf	(286)^0100h	;volatile
	line	60
;utils.c: 60: ANSELH = 0b00000011;
	movlw	(03h)
	movwf	(287)^0100h	;volatile
	line	62
;utils.c: 62: TMR1H = 0xFF;
	movlw	(0FFh)
	bcf	status, 6	;RP1=0, select bank0
	movwf	(15)	;volatile
	line	63
;utils.c: 63: TMR1L = 0x58;
	movlw	(058h)
	movwf	(14)	;volatile
	line	64
	
l1405:	
;utils.c: 64: TMR0 = 0x00;
	clrf	(1)	;volatile
	line	67
	
l1407:	
;utils.c: 67: T0CS = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1037/8)^080h,(1037)&7
	line	72
	
l1409:	
;utils.c: 72: T1CON = 0b00110001;
	movlw	(031h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(16)	;volatile
	line	75
	
l1411:	
;utils.c: 75: T2CON = 0b01111101;
	movlw	(07Dh)
	movwf	(18)	;volatile
	line	76
	
l1413:	
;utils.c: 76: PR2 = 0x7F;
	movlw	(07Fh)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(146)^080h	;volatile
	line	79
	
l1415:	
;utils.c: 79: INTCON = 0b11100000;
	movlw	(0E0h)
	movwf	(11)	;volatile
	line	81
	
l1417:	
;utils.c: 81: PIE1 = 0b00000011;
	movlw	(03h)
	movwf	(140)^080h	;volatile
	line	83
;utils.c: 83: WPUA = 0x00;
	clrf	(149)^080h	;volatile
	line	85
	
l1419:	
;utils.c: 85: WPUB = 0b01000000;
	movlw	(040h)
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movwf	(277)^0100h	;volatile
	line	88
	
l1421:	
;utils.c: 88: CM1CON0 = 0x00;
	clrf	(281)^0100h	;volatile
	line	89
	
l1423:	
;utils.c: 89: CM2CON0 = 0x00;
	clrf	(282)^0100h	;volatile
	line	90
	
l1425:	
;utils.c: 90: T0CS = 0x0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1037/8)^080h,(1037)&7
	line	91
	
l751:	
	return
	opt stack 0
GLOBAL	__end_of_init
	__end_of_init:
;; =============== function _init ends ============

	signat	_init,88
	global	_isr
psect	text194,local,class=CODE,delta=2
global __ptext194
__ptext194:

;; *************** function _isr *****************
;; Defined at:
;;		line 11 in file "C:\Documents and Settings\Elijah\My Documents\PICs\C\VFDclock\utils.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  2  738[COMMON] int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          2       0       0       0
;;      Totals:         2       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text194
	file	"C:\Documents and Settings\Elijah\My Documents\PICs\C\VFDclock\utils.c"
	line	11
	global	__size_of_isr
	__size_of_isr	equ	__end_of_isr-_isr
	
_isr:	
	opt	stack 6
; Regs used in _isr: [wreg+status,2+status,0]
psect	intentry,class=CODE,delta=2
global __pintentry
__pintentry:
global interrupt_function
interrupt_function:
	global saved_w
	saved_w	set	btemp+0
	movwf	saved_w
	movf	status,w
	movwf	(??_isr+0)
	movf	pclath,w
	movwf	(??_isr+1)
	ljmp	_isr
psect	text194
	line	13
	
i1l1207:	
;utils.c: 13: if(INTCON & 0b00000100) {
	btfss	(11),(2)&7
	goto	u1_21
	goto	u1_20
u1_21:
	goto	i1l1227
u1_20:
	line	15
	
i1l1209:	
;utils.c: 15: T0IF = 0;
	bcf	(90/8),(90)&7
	line	16
;utils.c: 16: if(!RB6) {
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(54/8),(54)&7
	goto	u2_21
	goto	u2_20
u2_21:
	goto	i1l1215
u2_20:
	line	18
	
i1l1211:	
;utils.c: 18: if(buttonTime < 255) {
	movf	(_buttonTime),w	;volatile
	xorlw	0FFh
	skipnz
	goto	u3_21
	goto	u3_20
u3_21:
	goto	i1l1227
u3_20:
	line	19
	
i1l1213:	
;utils.c: 19: buttonTime++;
	incf	(_buttonTime),f	;volatile
	goto	i1l1227
	line	23
	
i1l1215:	
;utils.c: 22: else {
;utils.c: 23: if(buttonTime) {
	movf	(_buttonTime),w	;volatile
	skipz
	goto	u4_20
	goto	i1l1225
u4_20:
	line	24
	
i1l1217:	
;utils.c: 24: if(buttonTime > 200)
	movlw	(0C9h)
	subwf	(_buttonTime),w	;volatile
	skipc
	goto	u5_21
	goto	u5_20
u5_21:
	goto	i1l1221
u5_20:
	line	25
	
i1l1219:	
;utils.c: 25: buttonEvent = 2;
	movlw	(02h)
	movwf	(_buttonEvent)	;volatile
	goto	i1l1223
	line	27
	
i1l1221:	
;utils.c: 26: else
;utils.c: 27: buttonEvent = 1;
	movlw	(01h)
	movwf	(_buttonEvent)	;volatile
	line	28
	
i1l1223:	
;utils.c: 28: RB7 = 1;
	bsf	(55/8),(55)&7
	line	30
	
i1l1225:	
;utils.c: 29: }
;utils.c: 30: buttonTime = 0;
	clrf	(_buttonTime)	;volatile
	line	35
	
i1l1227:	
;utils.c: 31: }
;utils.c: 32: }
;utils.c: 35: if(PIR1 & 0b00000001) {
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(12),(0)&7
	goto	u6_21
	goto	u6_20
u6_21:
	goto	i1l1233
u6_20:
	line	37
	
i1l1229:	
;utils.c: 37: PIR1 &= 0b11111110;
	bcf	(12)+(0/8),(0)&7	;volatile
	line	38
	
i1l1231:	
;utils.c: 38: TMR1H = 0xFF;
	movlw	(0FFh)
	movwf	(15)	;volatile
	line	39
;utils.c: 39: TMR1L = 0x58;
	movlw	(058h)
	movwf	(14)	;volatile
	line	43
	
i1l1233:	
;utils.c: 40: }
;utils.c: 43: if(PIR1 & 0x02) {
	btfss	(12),(1)&7
	goto	u7_21
	goto	u7_20
u7_21:
	goto	i1l748
u7_20:
	line	44
	
i1l1235:	
;utils.c: 44: seconds++;
	incf	(_seconds),f	;volatile
	line	45
	
i1l1237:	
;utils.c: 45: tick = 1;
	movlw	(01h)
	movwf	(_tick)	;volatile
	line	46
	
i1l1239:	
;utils.c: 46: TMR2IF = 0;
	bcf	(97/8),(97)&7
	line	48
	
i1l748:	
	movf	(??_isr+1),w
	movwf	pclath
	movf	(??_isr+0),w
	movwf	status
	swapf	saved_w,f
	swapf	saved_w,w
	retfie
	opt stack 0
GLOBAL	__end_of_isr
	__end_of_isr:
;; =============== function _isr ends ============

	signat	_isr,90
psect	text195,local,class=CODE,delta=2
global __ptext195
__ptext195:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
