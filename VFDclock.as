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
	FNCALL	_setTime,___lbdiv
	FNCALL	_setTime,___lbmod
	FNROOT	_main
	FNCALL	intlevel1,_isr
	global	intlevel1
	FNROOT	intlevel1
	global	_numLookup
	global	_numLookupDec
	global	_hours
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
	line	28

;initializer for _numLookupDec
	retlw	0BFh
	retlw	083h
	retlw	077h
	retlw	0D7h
	retlw	0CBh
	retlw	0DDh
	retlw	0FDh
	retlw	087h
	retlw	0FFh
	retlw	0DFh
psect	idataCOMMON,class=CODE,space=0,delta=2
global __pidataCOMMON
__pidataCOMMON:
	line	50

;initializer for _hours
	retlw	0Ch
	global	_clkState
	global	_seconds
	global	_state
	global	_buttonEvent
	global	_buttonTime
	global	_minutes
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

_minutes:
       ds      1

_tick:
       ds      1

psect	dataCOMMON,class=COMMON,space=1
global __pdataCOMMON
__pdataCOMMON:
	file	"C:\Documents and Settings\Elijah\My Documents\PICs\C\VFDclock\main.c"
_hours:
       ds      1

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_clkState:
       ds      1

_seconds:
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

psect	dataBANK0
	file	"C:\Documents and Settings\Elijah\My Documents\PICs\C\VFDclock\main.c"
	line	28
_numLookupDec:
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
	clrf	((__pbssBANK0)+2)&07Fh
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
	fcall	__pidataBANK0+10		;fetch initializer
	movwf	__pdataBANK0+10&07fh		
	fcall	__pidataBANK0+11		;fetch initializer
	movwf	__pdataBANK0+11&07fh		
	fcall	__pidataBANK0+12		;fetch initializer
	movwf	__pdataBANK0+12&07fh		
	fcall	__pidataBANK0+13		;fetch initializer
	movwf	__pdataBANK0+13&07fh		
	fcall	__pidataBANK0+14		;fetch initializer
	movwf	__pdataBANK0+14&07fh		
	fcall	__pidataBANK0+15		;fetch initializer
	movwf	__pdataBANK0+15&07fh		
	fcall	__pidataBANK0+16		;fetch initializer
	movwf	__pdataBANK0+16&07fh		
	fcall	__pidataBANK0+17		;fetch initializer
	movwf	__pdataBANK0+17&07fh		
	fcall	__pidataBANK0+18		;fetch initializer
	movwf	__pdataBANK0+18&07fh		
	fcall	__pidataBANK0+19		;fetch initializer
	movwf	__pdataBANK0+19&07fh		
; Initialize objects allocated to COMMON
	global __pidataCOMMON
psect cinit,class=CODE,delta=2
	fcall	__pidataCOMMON+0		;fetch initializer
	movwf	__pdataCOMMON+0&07fh		
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
	global	___lbmod@dividend
___lbmod@dividend:	; 1 bytes @ 0x4
	ds	1
	global	___lbdiv@quotient
___lbdiv@quotient:	; 1 bytes @ 0x5
	global	___lbmod@counter
___lbmod@counter:	; 1 bytes @ 0x5
	ds	1
	global	___lbmod@rem
___lbmod@rem:	; 1 bytes @ 0x6
	ds	1
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	??_setTime
??_setTime:	; 0 bytes @ 0x0
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0x1
	ds	1
;;Data sizes: Strings 0, constant 0, data 21, bss 7, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      7      12
;; BANK0           80      2      25
;; BANK1           80      0       0
;; BANK2           80      0       0

;;
;; Pointer list with targets:



;;
;; Critical Paths under _main in COMMON
;;
;;   _main->___lbmod
;;   _setTime->___lbmod
;;
;; Critical Paths under _isr in COMMON
;;
;;   None.
;;
;; Critical Paths under _main in BANK0
;;
;;   _main->_setTime
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
;; (0) _main                                                 1     1      0     642
;;                                              1 BANK0      1     1      0
;;                               _init
;;                            ___lbdiv
;;                            ___lbmod
;;                            _setTime
;; ---------------------------------------------------------------------------------
;; (1) _setTime                                              1     1      0     321
;;                                              0 BANK0      1     1      0
;;                            ___lbdiv
;;                            ___lbmod
;; ---------------------------------------------------------------------------------
;; (2) ___lbmod                                              5     4      1     159
;;                                              2 COMMON     5     4      1
;; ---------------------------------------------------------------------------------
;; (2) ___lbdiv                                              4     3      1     162
;;                                              2 COMMON     4     3      1
;; ---------------------------------------------------------------------------------
;; (1) _init                                                 0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 2
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (3) _isr                                                  2     2      0       0
;;                                              0 COMMON     2     2      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 3
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _init
;;   ___lbdiv
;;   ___lbmod
;;   _setTime
;;     ___lbdiv
;;     ___lbmod
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
;;DATA                 0      0      27      10        0.0%
;;ABS                  0      0      25       8        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       2       2        0.0%
;;BANK0               50      2      19       3       31.3%
;;BITBANK0            50      0       0       9        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;COMMON               E      7       C       1       85.7%
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 72 in file "C:\Documents and Settings\Elijah\My Documents\PICs\C\VFDclock\main.c"
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
;; Hardware stack levels required when called:    3
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
	line	72
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 8
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	73
	
l1785:	
;main.c: 73: init();
	fcall	_init
	line	76
	
l1787:	
;main.c: 76: if(tick) {
	movf	(_tick),w	;volatile
	skipz
	goto	u700
	goto	l1797
u700:
	line	77
	
l1789:	
;main.c: 77: state++;
	bcf	status, 5	;RP0=0, select bank0
	incf	(_state),f
	line	78
	
l1791:	
;main.c: 78: PORTC = ~0x00;
	movlw	(0FFh)
	movwf	(7)	;volatile
	line	79
	
l1793:	
;main.c: 79: _delay((unsigned long)((100)*(32768/4000.0)));
	opt asmopt_off
movlw	204
movwf	(??_main+0)+0,f
u777:
	clrwdt
decfsz	(??_main+0)+0,f
	goto	u777
	nop2	;nop
opt asmopt_on

	line	80
	
l1795:	
;main.c: 80: tick = 0;
	clrf	(_tick)	;volatile
	line	82
	
l1797:	
;main.c: 81: }
;main.c: 82: if(state > 5)
	movlw	(06h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	subwf	(_state),w
	skipc
	goto	u711
	goto	u710
u711:
	goto	l1801
u710:
	line	83
	
l1799:	
;main.c: 83: state = 0;
	clrf	(_state)
	line	85
	
l1801:	
;main.c: 85: if(seconds > 59) {
	movlw	(03Ch)
	subwf	(_seconds),w	;volatile
	skipc
	goto	u721
	goto	u720
u721:
	goto	l1807
u720:
	line	86
	
l1803:	
;main.c: 86: minutes++;
	incf	(_minutes),f	;volatile
	line	87
	
l1805:	
;main.c: 87: seconds = 0;
	clrf	(_seconds)	;volatile
	line	89
	
l1807:	
;main.c: 88: }
;main.c: 89: if(minutes > 59) {
	movlw	(03Ch)
	subwf	(_minutes),w	;volatile
	skipc
	goto	u731
	goto	u730
u731:
	goto	l1813
u730:
	line	90
	
l1809:	
;main.c: 90: hours++;
	incf	(_hours),f
	line	91
	
l1811:	
;main.c: 91: minutes = 0;
	clrf	(_minutes)	;volatile
	line	93
	
l1813:	
;main.c: 92: }
;main.c: 93: if(hours > 23)
	movlw	(018h)
	subwf	(_hours),w
	skipc
	goto	u741
	goto	u740
u741:
	goto	l1817
u740:
	line	94
	
l1815:	
;main.c: 94: hours = 0;
	clrf	(_hours)
	line	104
	
l1817:	
;main.c: 104: RB7 = 0;
	bcf	(55/8),(55)&7
	line	106
;main.c: 106: switch(state) {
	goto	l1837
	line	109
	
l1819:	
;main.c: 109: if(!(hours / 10)) {
	movlw	(0Ah)
	movwf	(?___lbdiv)
	movf	(_hours),w
	fcall	___lbdiv
	iorlw	0
	skipz
	goto	u751
	goto	u750
u751:
	goto	l1823
u750:
	line	110
	
l1821:	
;main.c: 110: state = HOURTWO;
	clrf	(_state)
	incf	(_state),f
	line	111
;main.c: 111: break;
	goto	l1839
	line	113
	
l1823:	
;main.c: 112: }
;main.c: 113: PORTC = ~numLookup[(hours / 10)];
	movlw	(0Ah)
	movwf	(?___lbdiv)
	movf	(_hours),w
	fcall	___lbdiv
	addlw	_numLookup&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	comf	indf,w
	movwf	(7)	;volatile
	line	114
;main.c: 114: break;
	goto	l1839
	line	116
	
l1825:	
;main.c: 116: PORTC = ~numLookup[(hours % 10)];
	movlw	(0Ah)
	movwf	(?___lbmod)
	movf	(_hours),w
	fcall	___lbmod
	addlw	_numLookup&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	comf	indf,w
	movwf	(7)	;volatile
	line	117
;main.c: 117: break;
	goto	l1839
	line	119
	
l1827:	
;main.c: 119: PORTC = ~numLookup[(minutes / 10)];
	movlw	(0Ah)
	movwf	(?___lbdiv)
	movf	(_minutes),w	;volatile
	fcall	___lbdiv
	addlw	_numLookup&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	comf	indf,w
	movwf	(7)	;volatile
	line	120
;main.c: 120: break;
	goto	l1839
	line	122
	
l1829:	
;main.c: 122: PORTC = ~numLookup[(minutes % 10)];
	movlw	(0Ah)
	movwf	(?___lbmod)
	movf	(_minutes),w	;volatile
	fcall	___lbmod
	addlw	_numLookup&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	comf	indf,w
	movwf	(7)	;volatile
	line	123
;main.c: 123: break;
	goto	l1839
	line	125
	
l1831:	
;main.c: 125: PORTC = ~0x00;
	movlw	(0FFh)
	movwf	(7)	;volatile
	line	126
;main.c: 126: break;
	goto	l1839
	line	106
	
l1837:	
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
	goto	l1819
	xorlw	1^0	; case 1
	skipnz
	goto	l1825
	xorlw	2^1	; case 2
	skipnz
	goto	l1827
	xorlw	3^2	; case 3
	skipnz
	goto	l1829
	xorlw	4^3	; case 4
	skipnz
	goto	l1831
	xorlw	5^4	; case 5
	skipnz
	goto	l1831
	goto	l1839

	line	134
	
l1839:	
;main.c: 134: if(buttonEvent == 2) {
	movf	(_buttonEvent),w	;volatile
	xorlw	02h
	skipz
	goto	u761
	goto	u760
u761:
	goto	l1787
u760:
	line	135
	
l1841:	
;main.c: 135: buttonEvent = 0;
	clrf	(_buttonEvent)	;volatile
	line	136
	
l1843:	
;main.c: 136: clkState = SETHOUR;
	clrf	(_clkState)
	incf	(_clkState),f
	line	137
	
l1845:	
;main.c: 137: setTime();
	fcall	_setTime
	goto	l1787
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

psect	maintext
	line	140
	signat	_main,88
	global	_setTime
psect	text203,local,class=CODE,delta=2
global __ptext203
__ptext203:

;; *************** function _setTime *****************
;; Defined at:
;;		line 142 in file "C:\Documents and Settings\Elijah\My Documents\PICs\C\VFDclock\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          0       1       0       0
;;      Totals:         0       1       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		___lbdiv
;;		___lbmod
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text203
	file	"C:\Documents and Settings\Elijah\My Documents\PICs\C\VFDclock\main.c"
	line	142
	global	__size_of_setTime
	__size_of_setTime	equ	__end_of_setTime-_setTime
	
_setTime:	
	opt	stack 7
; Regs used in _setTime: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	143
	
l1727:	
;main.c: 143: while(clkState != RUNNING) {
	goto	l1783
	line	146
	
l1729:	
;main.c: 146: if(tick) {
	movf	(_tick),w	;volatile
	skipz
	goto	u610
	goto	l1739
u610:
	line	147
	
l1731:	
;main.c: 147: state++;
	incf	(_state),f
	line	148
	
l1733:	
;main.c: 148: PORTC = ~0x01;
	movlw	(0FEh)
	movwf	(7)	;volatile
	line	149
	
l1735:	
;main.c: 149: _delay((unsigned long)((100)*(32768/4000.0)));
	opt asmopt_off
movlw	204
movwf	(??_setTime+0)+0,f
u787:
	clrwdt
decfsz	(??_setTime+0)+0,f
	goto	u787
	nop2	;nop
opt asmopt_on

	line	150
	
l1737:	
;main.c: 150: tick = 0;
	clrf	(_tick)	;volatile
	line	152
	
l1739:	
;main.c: 151: }
;main.c: 152: if(state > 3)
	movlw	(04h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	subwf	(_state),w
	skipc
	goto	u621
	goto	u620
u621:
	goto	l1743
u620:
	line	153
	
l1741:	
;main.c: 153: state = 0;
	clrf	(_state)
	line	154
	
l1743:	
;main.c: 154: if(buttonEvent == 2) {
	movf	(_buttonEvent),w	;volatile
	xorlw	02h
	skipz
	goto	u631
	goto	u630
u631:
	goto	l1747
u630:
	line	155
	
l1745:	
;main.c: 155: clkState = SETMIN;
	movlw	(02h)
	movwf	(_clkState)
	line	156
;main.c: 156: break;
	goto	l1781
	line	158
	
l1747:	
;main.c: 157: }
;main.c: 158: if(buttonEvent == 1) {
	decf	(_buttonEvent),w	;volatile
	skipz
	goto	u641
	goto	u640
u641:
	goto	l1763
u640:
	line	159
	
l1749:	
;main.c: 159: if(++hours > 23)
	movlw	(018h)
	incf	(_hours),f
	subwf	((_hours)),w
	skipc
	goto	u651
	goto	u650
u651:
	goto	l1763
u650:
	line	160
	
l1751:	
;main.c: 160: hours = 0;
	clrf	(_hours)
	goto	l1763
	line	164
	
l1753:	
;main.c: 164: PORTC = ~numLookupDec[(hours / 10)];
	movlw	(0Ah)
	movwf	(?___lbdiv)
	movf	(_hours),w
	fcall	___lbdiv
	addlw	_numLookupDec&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	comf	indf,w
	movwf	(7)	;volatile
	line	165
;main.c: 165: break;
	goto	l1781
	line	167
	
l1755:	
;main.c: 167: PORTC = ~numLookupDec[(hours % 10)];
	movlw	(0Ah)
	movwf	(?___lbmod)
	movf	(_hours),w
	fcall	___lbmod
	addlw	_numLookupDec&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	comf	indf,w
	movwf	(7)	;volatile
	line	168
;main.c: 168: break;
	goto	l1781
	line	170
	
l1757:	
;main.c: 170: PORTC = ~0x01;
	movlw	(0FEh)
	movwf	(7)	;volatile
	line	171
;main.c: 171: break;
	goto	l1781
	line	162
	
l1763:	
	movf	(_state),w
	; Switch size 1, requested type "space"
; Number of cases is 4, Range of values is 0 to 3
; switch strategies available:
; Name         Bytes Cycles
; simple_byte    13     7 (average)
; direct_byte    24    16 (fixed)
;	Chosen strategy is simple_byte

	xorlw	0^0	; case 0
	skipnz
	goto	l1753
	xorlw	1^0	; case 1
	skipnz
	goto	l1755
	xorlw	2^1	; case 2
	skipnz
	goto	l1757
	xorlw	3^2	; case 3
	skipnz
	goto	l1757
	goto	l1781

	line	179
	
l1765:	
;main.c: 179: if(buttonEvent == 2)
	movf	(_buttonEvent),w	;volatile
	xorlw	02h
	skipz
	goto	u661
	goto	u660
u661:
	goto	l1769
u660:
	line	180
	
l1767:	
;main.c: 180: clkState = RUNNING;
	clrf	(_clkState)
	line	181
	
l1769:	
;main.c: 181: if(buttonEvent == 1) {
	decf	(_buttonEvent),w	;volatile
	skipz
	goto	u671
	goto	u670
u671:
	goto	l1757
u670:
	line	182
	
l1771:	
;main.c: 182: if(++minutes > 59)
	movlw	(03Ch)
	incf	(_minutes),f	;volatile
	subwf	((_minutes)),w	;volatile
	skipc
	goto	u681
	goto	u680
u681:
	goto	l1757
u680:
	line	183
	
l1773:	
;main.c: 183: minutes = 0;
	clrf	(_minutes)	;volatile
	goto	l1757
	line	144
	
l1779:	
	movf	(_clkState),w
	; Switch size 1, requested type "space"
; Number of cases is 2, Range of values is 1 to 2
; switch strategies available:
; Name         Bytes Cycles
; simple_byte     7     4 (average)
; direct_byte    23    19 (fixed)
;	Chosen strategy is simple_byte

	xorlw	1^0	; case 1
	skipnz
	goto	l1729
	xorlw	2^1	; case 2
	skipnz
	goto	l1765
	goto	l1781

	line	188
	
l1781:	
;main.c: 188: buttonEvent = 0;
	clrf	(_buttonEvent)	;volatile
	line	143
	
l1783:	
	movf	(_clkState),f
	skipz
	goto	u691
	goto	u690
u691:
	goto	l1779
u690:
	line	201
	
l798:	
	return
	opt stack 0
GLOBAL	__end_of_setTime
	__end_of_setTime:
;; =============== function _setTime ends ============

	signat	_setTime,88
	global	___lbmod
psect	text204,local,class=CODE,delta=2
global __ptext204
__ptext204:

;; *************** function ___lbmod *****************
;; Defined at:
;;		line 5 in file "C:\Program Files\HI-TECH Software\PICC\9.71a\sources\lbmod.c"
;; Parameters:    Size  Location     Type
;;  dividend        1    wreg     unsigned char 
;;  divisor         1    2[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  dividend        1    4[COMMON] unsigned char 
;;  rem             1    6[COMMON] unsigned char 
;;  counter         1    5[COMMON] unsigned char 
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
;;      Temps:          1       0       0       0
;;      Totals:         5       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;;		_setTime
;; This function uses a non-reentrant model
;;
psect	text204
	file	"C:\Program Files\HI-TECH Software\PICC\9.71a\sources\lbmod.c"
	line	5
	global	__size_of___lbmod
	__size_of___lbmod	equ	__end_of___lbmod-___lbmod
	
___lbmod:	
	opt	stack 6
; Regs used in ___lbmod: [wreg+status,2+status,0]
;___lbmod@dividend stored from wreg
	line	9
	movwf	(___lbmod@dividend)
	
l1575:	
	movlw	(08h)
	movwf	(___lbmod@counter)
	line	10
	
l1577:	
	clrf	(___lbmod@rem)
	line	12
	
l1579:	
	movf	(___lbmod@dividend),w
	movwf	(??___lbmod+0)+0
	movlw	07h
u425:
	clrc
	rrf	(??___lbmod+0)+0,f
	addlw	-1
	skipz
	goto	u425
	clrc
	rlf	(___lbmod@rem),w
	iorwf	0+(??___lbmod+0)+0,w
	movwf	(___lbmod@rem)
	line	13
	
l1581:	
	clrc
	rlf	(___lbmod@dividend),f
	line	14
	
l1583:	
	movf	(___lbmod@divisor),w
	subwf	(___lbmod@rem),w
	skipc
	goto	u431
	goto	u430
u431:
	goto	l1587
u430:
	line	15
	
l1585:	
	movf	(___lbmod@divisor),w
	subwf	(___lbmod@rem),f
	line	16
	
l1587:	
	decfsz	(___lbmod@counter),f
	goto	u441
	goto	u440
u441:
	goto	l1579
u440:
	line	17
	
l1589:	
	movf	(___lbmod@rem),w
	line	18
	
l846:	
	return
	opt stack 0
GLOBAL	__end_of___lbmod
	__end_of___lbmod:
;; =============== function ___lbmod ends ============

	signat	___lbmod,8313
	global	___lbdiv
psect	text205,local,class=CODE,delta=2
global __ptext205
__ptext205:

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
;;		_setTime
;; This function uses a non-reentrant model
;;
psect	text205
	file	"C:\Program Files\HI-TECH Software\PICC\9.71a\sources\lbdiv.c"
	line	5
	global	__size_of___lbdiv
	__size_of___lbdiv	equ	__end_of___lbdiv-___lbdiv
	
___lbdiv:	
	opt	stack 6
; Regs used in ___lbdiv: [wreg+status,2+status,0]
;___lbdiv@dividend stored from wreg
	line	9
	movwf	(___lbdiv@dividend)
	
l1551:	
	clrf	(___lbdiv@quotient)
	line	10
	
l1553:	
	movf	(___lbdiv@divisor),w
	skipz
	goto	u380
	goto	l1571
u380:
	line	11
	
l1555:	
	clrf	(___lbdiv@counter)
	incf	(___lbdiv@counter),f
	line	12
	goto	l1559
	
l835:	
	line	13
	clrc
	rlf	(___lbdiv@divisor),f
	line	14
	
l1557:	
	incf	(___lbdiv@counter),f
	line	12
	
l1559:	
	btfss	(___lbdiv@divisor),(7)&7
	goto	u391
	goto	u390
u391:
	goto	l835
u390:
	line	16
	
l837:	
	line	17
	clrc
	rlf	(___lbdiv@quotient),f
	line	18
	
l1561:	
	movf	(___lbdiv@divisor),w
	subwf	(___lbdiv@dividend),w
	skipc
	goto	u401
	goto	u400
u401:
	goto	l1567
u400:
	line	19
	
l1563:	
	movf	(___lbdiv@divisor),w
	subwf	(___lbdiv@dividend),f
	line	20
	
l1565:	
	bsf	(___lbdiv@quotient)+(0/8),(0)&7
	line	22
	
l1567:	
	clrc
	rrf	(___lbdiv@divisor),f
	line	23
	
l1569:	
	decfsz	(___lbdiv@counter),f
	goto	u411
	goto	u410
u411:
	goto	l837
u410:
	line	25
	
l1571:	
	movf	(___lbdiv@quotient),w
	line	26
	
l840:	
	return
	opt stack 0
GLOBAL	__end_of___lbdiv
	__end_of___lbdiv:
;; =============== function ___lbdiv ends ============

	signat	___lbdiv,8313
	global	_init
psect	text206,local,class=CODE,delta=2
global __ptext206
__ptext206:

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
psect	text206
	file	"C:\Documents and Settings\Elijah\My Documents\PICs\C\VFDclock\utils.c"
	line	53
	global	__size_of_init
	__size_of_init	equ	__end_of_init-_init
	
_init:	
	opt	stack 7
; Regs used in _init: [wreg+status,2]
	line	55
	
l1523:	
;utils.c: 55: TRISA = 0b00000100;
	movlw	(04h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(133)^080h	;volatile
	line	56
;utils.c: 56: TRISB = 0b01000000;
	movlw	(040h)
	movwf	(134)^080h	;volatile
	line	57
	
l1525:	
;utils.c: 57: TRISC = 0b00000000;
	clrf	(135)^080h	;volatile
	line	59
	
l1527:	
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
	
l1529:	
;utils.c: 64: TMR0 = 0x00;
	clrf	(1)	;volatile
	line	67
	
l1531:	
;utils.c: 67: T0CS = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1037/8)^080h,(1037)&7
	line	72
	
l1533:	
;utils.c: 72: T1CON = 0b00110001;
	movlw	(031h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(16)	;volatile
	line	75
	
l1535:	
;utils.c: 75: T2CON = 0b01111101;
	movlw	(07Dh)
	movwf	(18)	;volatile
	line	76
	
l1537:	
;utils.c: 76: PR2 = 0x7F;
	movlw	(07Fh)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(146)^080h	;volatile
	line	79
	
l1539:	
;utils.c: 79: INTCON = 0b11100000;
	movlw	(0E0h)
	movwf	(11)	;volatile
	line	81
	
l1541:	
;utils.c: 81: PIE1 = 0b00000011;
	movlw	(03h)
	movwf	(140)^080h	;volatile
	line	83
;utils.c: 83: WPUA = 0x00;
	clrf	(149)^080h	;volatile
	line	85
	
l1543:	
;utils.c: 85: WPUB = 0b01000000;
	movlw	(040h)
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movwf	(277)^0100h	;volatile
	line	88
	
l1545:	
;utils.c: 88: CM1CON0 = 0x00;
	clrf	(281)^0100h	;volatile
	line	89
	
l1547:	
;utils.c: 89: CM2CON0 = 0x00;
	clrf	(282)^0100h	;volatile
	line	90
	
l1549:	
;utils.c: 90: T0CS = 0x0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1037/8)^080h,(1037)&7
	line	91
	
l753:	
	return
	opt stack 0
GLOBAL	__end_of_init
	__end_of_init:
;; =============== function _init ends ============

	signat	_init,88
	global	_isr
psect	text207,local,class=CODE,delta=2
global __ptext207
__ptext207:

;; *************** function _isr *****************
;; Defined at:
;;		line 11 in file "C:\Documents and Settings\Elijah\My Documents\PICs\C\VFDclock\utils.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  2  740[COMMON] int 
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
psect	text207
	file	"C:\Documents and Settings\Elijah\My Documents\PICs\C\VFDclock\utils.c"
	line	11
	global	__size_of_isr
	__size_of_isr	equ	__end_of_isr-_isr
	
_isr:	
	opt	stack 5
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
psect	text207
	line	13
	
i1l1489:	
;utils.c: 13: if(INTCON & 0b00000100) {
	btfss	(11),(2)&7
	goto	u31_21
	goto	u31_20
u31_21:
	goto	i1l1509
u31_20:
	line	15
	
i1l1491:	
;utils.c: 15: T0IF = 0;
	bcf	(90/8),(90)&7
	line	16
;utils.c: 16: if(!RB6) {
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(54/8),(54)&7
	goto	u32_21
	goto	u32_20
u32_21:
	goto	i1l1497
u32_20:
	line	18
	
i1l1493:	
;utils.c: 18: if(buttonTime < 255) {
	movf	(_buttonTime),w	;volatile
	xorlw	0FFh
	skipnz
	goto	u33_21
	goto	u33_20
u33_21:
	goto	i1l1509
u33_20:
	line	19
	
i1l1495:	
;utils.c: 19: buttonTime++;
	incf	(_buttonTime),f	;volatile
	goto	i1l1509
	line	23
	
i1l1497:	
;utils.c: 22: else {
;utils.c: 23: if(buttonTime) {
	movf	(_buttonTime),w	;volatile
	skipz
	goto	u34_20
	goto	i1l1507
u34_20:
	line	24
	
i1l1499:	
;utils.c: 24: if(buttonTime > 100)
	movlw	(065h)
	subwf	(_buttonTime),w	;volatile
	skipc
	goto	u35_21
	goto	u35_20
u35_21:
	goto	i1l1503
u35_20:
	line	25
	
i1l1501:	
;utils.c: 25: buttonEvent = 2;
	movlw	(02h)
	movwf	(_buttonEvent)	;volatile
	goto	i1l1505
	line	27
	
i1l1503:	
;utils.c: 26: else
;utils.c: 27: buttonEvent = 1;
	movlw	(01h)
	movwf	(_buttonEvent)	;volatile
	line	28
	
i1l1505:	
;utils.c: 28: RB7 = 1;
	bsf	(55/8),(55)&7
	line	30
	
i1l1507:	
;utils.c: 29: }
;utils.c: 30: buttonTime = 0;
	clrf	(_buttonTime)	;volatile
	line	35
	
i1l1509:	
;utils.c: 31: }
;utils.c: 32: }
;utils.c: 35: if(PIR1 & 0b00000001) {
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(12),(0)&7
	goto	u36_21
	goto	u36_20
u36_21:
	goto	i1l1515
u36_20:
	line	37
	
i1l1511:	
;utils.c: 37: PIR1 &= 0b11111110;
	bcf	(12)+(0/8),(0)&7	;volatile
	line	38
	
i1l1513:	
;utils.c: 38: TMR1H = 0xFF;
	movlw	(0FFh)
	movwf	(15)	;volatile
	line	39
;utils.c: 39: TMR1L = 0x58;
	movlw	(058h)
	movwf	(14)	;volatile
	line	43
	
i1l1515:	
;utils.c: 40: }
;utils.c: 43: if(PIR1 & 0x02) {
	btfss	(12),(1)&7
	goto	u37_21
	goto	u37_20
u37_21:
	goto	i1l750
u37_20:
	line	44
	
i1l1517:	
;utils.c: 44: seconds++;
	incf	(_seconds),f	;volatile
	line	45
	
i1l1519:	
;utils.c: 45: tick = 1;
	movlw	(01h)
	movwf	(_tick)	;volatile
	line	46
	
i1l1521:	
;utils.c: 46: TMR2IF = 0;
	bcf	(97/8),(97)&7
	line	48
	
i1l750:	
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
psect	text208,local,class=CODE,delta=2
global __ptext208
__ptext208:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
