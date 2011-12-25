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
# 34 "C:\Documents and Settings\Elijah\My Documents\PICs\C\VFDclock\main.c"
	psect config,class=CONFIG,delta=2 ;#
# 34 "C:\Documents and Settings\Elijah\My Documents\PICs\C\VFDclock\main.c"
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
	line	39

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
	line	52

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
	line	71

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
	line	39
_numLookup:
       ds      10

psect	dataBANK0
	file	"C:\Documents and Settings\Elijah\My Documents\PICs\C\VFDclock\main.c"
	line	52
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
;;		line 93 in file "C:\Documents and Settings\Elijah\My Documents\PICs\C\VFDclock\main.c"
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
	line	93
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 8
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	94
	
l1882:	
;main.c: 94: init();
	fcall	_init
	line	97
	
l1884:	
;main.c: 97: if(tick) {
	movf	(_tick),w	;volatile
	skipz
	goto	u760
	goto	l1894
u760:
	line	98
	
l1886:	
;main.c: 98: if(++state > 5)
	movlw	(06h)
	bcf	status, 5	;RP0=0, select bank0
	incf	(_state),f
	subwf	((_state)),w
	skipc
	goto	u771
	goto	u770
u771:
	goto	l1890
u770:
	line	99
	
l1888:	
;main.c: 99: state = 0;
	clrf	(_state)
	line	100
	
l1890:	
;main.c: 100: PORTC = ~0x00;
	movlw	(0FFh)
	movwf	(7)	;volatile
	line	101
	
l1892:	
;main.c: 101: _delay((unsigned long)((100)*(32768/4000.0)));
	opt asmopt_off
movlw	204
movwf	(??_main+0)+0,f
u837:
	clrwdt
decfsz	(??_main+0)+0,f
	goto	u837
	nop2	;nop
opt asmopt_on

	line	102
;main.c: 102: tick = 0;
	clrf	(_tick)	;volatile
	line	105
	
l1894:	
;main.c: 103: }
;main.c: 105: if(seconds > 59) {
	movlw	(03Ch)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	subwf	(_seconds),w	;volatile
	skipc
	goto	u781
	goto	u780
u781:
	goto	l1900
u780:
	line	106
	
l1896:	
;main.c: 106: minutes++;
	incf	(_minutes),f	;volatile
	line	107
	
l1898:	
;main.c: 107: seconds = 0;
	clrf	(_seconds)	;volatile
	line	109
	
l1900:	
;main.c: 108: }
;main.c: 109: if(minutes > 59) {
	movlw	(03Ch)
	subwf	(_minutes),w	;volatile
	skipc
	goto	u791
	goto	u790
u791:
	goto	l1906
u790:
	line	110
	
l1902:	
;main.c: 110: hours++;
	incf	(_hours),f
	line	111
	
l1904:	
;main.c: 111: minutes = 0;
	clrf	(_minutes)	;volatile
	line	113
	
l1906:	
;main.c: 112: }
;main.c: 113: if(hours > 23)
	movlw	(018h)
	subwf	(_hours),w
	skipc
	goto	u801
	goto	u800
u801:
	goto	l1910
u800:
	line	114
	
l1908:	
;main.c: 114: hours = 0;
	clrf	(_hours)
	line	117
	
l1910:	
;main.c: 117: RB7 = 0;
	bcf	(55/8),(55)&7
	line	119
;main.c: 119: switch(state) {
	goto	l1930
	line	122
	
l1912:	
;main.c: 122: if(!(hours / 10)) {
	movlw	(0Ah)
	movwf	(?___lbdiv)
	movf	(_hours),w
	fcall	___lbdiv
	iorlw	0
	skipz
	goto	u811
	goto	u810
u811:
	goto	l1916
u810:
	line	123
	
l1914:	
;main.c: 123: state = HOURTWO;
	clrf	(_state)
	incf	(_state),f
	line	124
;main.c: 124: break;
	goto	l1932
	line	126
	
l1916:	
;main.c: 125: }
;main.c: 126: PORTC = ~numLookup[(hours / 10)];
	movlw	(0Ah)
	movwf	(?___lbdiv)
	movf	(_hours),w
	fcall	___lbdiv
	addlw	_numLookup&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	comf	indf,w
	movwf	(7)	;volatile
	line	127
;main.c: 127: break;
	goto	l1932
	line	129
	
l1918:	
;main.c: 129: PORTC = ~numLookup[(hours % 10)];
	movlw	(0Ah)
	movwf	(?___lbmod)
	movf	(_hours),w
	fcall	___lbmod
	addlw	_numLookup&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	comf	indf,w
	movwf	(7)	;volatile
	line	130
;main.c: 130: break;
	goto	l1932
	line	132
	
l1920:	
;main.c: 132: PORTC = ~numLookup[(minutes / 10)];
	movlw	(0Ah)
	movwf	(?___lbdiv)
	movf	(_minutes),w	;volatile
	fcall	___lbdiv
	addlw	_numLookup&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	comf	indf,w
	movwf	(7)	;volatile
	line	133
;main.c: 133: break;
	goto	l1932
	line	135
	
l1922:	
;main.c: 135: PORTC = ~numLookup[(minutes % 10)];
	movlw	(0Ah)
	movwf	(?___lbmod)
	movf	(_minutes),w	;volatile
	fcall	___lbmod
	addlw	_numLookup&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	comf	indf,w
	movwf	(7)	;volatile
	line	136
;main.c: 136: break;
	goto	l1932
	line	138
	
l1924:	
;main.c: 138: PORTC = ~0x00;
	movlw	(0FFh)
	movwf	(7)	;volatile
	line	139
;main.c: 139: break;
	goto	l1932
	line	119
	
l1930:	
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
	goto	l1912
	xorlw	1^0	; case 1
	skipnz
	goto	l1918
	xorlw	2^1	; case 2
	skipnz
	goto	l1920
	xorlw	3^2	; case 3
	skipnz
	goto	l1922
	xorlw	4^3	; case 4
	skipnz
	goto	l1924
	xorlw	5^4	; case 5
	skipnz
	goto	l1924
	goto	l1932

	line	146
	
l1932:	
;main.c: 146: if(buttonEvent == 2) {
	movf	(_buttonEvent),w	;volatile
	xorlw	02h
	skipz
	goto	u821
	goto	u820
u821:
	goto	l1884
u820:
	line	147
	
l1934:	
;main.c: 147: buttonEvent = 0;
	clrf	(_buttonEvent)	;volatile
	line	148
	
l1936:	
;main.c: 148: clkState = SETHOUR;
	clrf	(_clkState)
	incf	(_clkState),f
	line	149
;main.c: 149: state = HOURONE;
	clrf	(_state)
	line	150
	
l1938:	
;main.c: 150: setTime();
	fcall	_setTime
	goto	l1884
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

psect	maintext
	line	153
	signat	_main,88
	global	_setTime
psect	text203,local,class=CODE,delta=2
global __ptext203
__ptext203:

;; *************** function _setTime *****************
;; Defined at:
;;		line 155 in file "C:\Documents and Settings\Elijah\My Documents\PICs\C\VFDclock\main.c"
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
	line	155
	global	__size_of_setTime
	__size_of_setTime	equ	__end_of_setTime-_setTime
	
_setTime:	
	opt	stack 7
; Regs used in _setTime: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	156
	
l1804:	
;main.c: 156: while(clkState != RUNNING) {
	goto	l1880
	line	159
	
l1806:	
;main.c: 159: if(tick) {
	movf	(_tick),w	;volatile
	skipz
	goto	u650
	goto	l1816
u650:
	line	160
	
l1808:	
;main.c: 160: if(++state > 3)
	movlw	(04h)
	incf	(_state),f
	subwf	((_state)),w
	skipc
	goto	u661
	goto	u660
u661:
	goto	l1812
u660:
	line	161
	
l1810:	
;main.c: 161: state = 0;
	clrf	(_state)
	line	162
	
l1812:	
;main.c: 162: PORTC = ~0x01;
	movlw	(0FEh)
	movwf	(7)	;volatile
	line	163
	
l1814:	
;main.c: 163: _delay((unsigned long)((100)*(32768/4000.0)));
	opt asmopt_off
movlw	204
movwf	(??_setTime+0)+0,f
u847:
	clrwdt
decfsz	(??_setTime+0)+0,f
	goto	u847
	nop2	;nop
opt asmopt_on

	line	164
;main.c: 164: tick = 0;
	clrf	(_tick)	;volatile
	line	167
	
l1816:	
;main.c: 165: }
;main.c: 167: if(buttonEvent == 2) {
	movf	(_buttonEvent),w	;volatile
	xorlw	02h
	skipz
	goto	u671
	goto	u670
u671:
	goto	l1824
u670:
	line	168
	
l1818:	
;main.c: 168: buttonEvent = 0;
	clrf	(_buttonEvent)	;volatile
	line	169
	
l1820:	
;main.c: 169: clkState = SETMIN;
	movlw	(02h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_clkState)
	line	170
	
l1822:	
;main.c: 170: state = MINONE;
	movlw	(02h)
	movwf	(_state)
	line	171
;main.c: 171: break;
	goto	l1880
	line	173
	
l1824:	
;main.c: 172: }
;main.c: 173: if(buttonEvent == 1) {
	decf	(_buttonEvent),w	;volatile
	skipz
	goto	u681
	goto	u680
u681:
	goto	l1842
u680:
	line	174
	
l1826:	
;main.c: 174: buttonEvent = 0;
	clrf	(_buttonEvent)	;volatile
	line	175
	
l1828:	
;main.c: 175: if(++hours > 23)
	movlw	(018h)
	incf	(_hours),f
	subwf	((_hours)),w
	skipc
	goto	u691
	goto	u690
u691:
	goto	l1842
u690:
	line	176
	
l1830:	
;main.c: 176: hours = 0;
	clrf	(_hours)
	goto	l1842
	line	180
	
l1832:	
;main.c: 180: PORTC = ~numLookupDec[(hours / 10)];
	movlw	(0Ah)
	movwf	(?___lbdiv)
	movf	(_hours),w
	fcall	___lbdiv
	addlw	_numLookupDec&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	comf	indf,w
	movwf	(7)	;volatile
	line	181
;main.c: 181: break;
	goto	l1804
	line	183
	
l1834:	
;main.c: 183: PORTC = ~numLookupDec[(hours % 10)];
	movlw	(0Ah)
	movwf	(?___lbmod)
	movf	(_hours),w
	fcall	___lbmod
	addlw	_numLookupDec&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	comf	indf,w
	movwf	(7)	;volatile
	line	184
;main.c: 184: break;
	goto	l1804
	line	186
	
l1836:	
;main.c: 186: PORTC = ~0x01;
	movlw	(0FEh)
	movwf	(7)	;volatile
	line	187
;main.c: 187: break;
	goto	l1804
	line	178
	
l1842:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
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
	goto	l1832
	xorlw	1^0	; case 1
	skipnz
	goto	l1834
	xorlw	2^1	; case 2
	skipnz
	goto	l1836
	xorlw	3^2	; case 3
	skipnz
	goto	l1836
	goto	l1880

	line	195
	
l1844:	
;main.c: 195: if(tick) {
	movf	(_tick),w	;volatile
	skipz
	goto	u700
	goto	l1852
u700:
	line	196
	
l1846:	
;main.c: 196: if(++state > 5)
	movlw	(06h)
	incf	(_state),f
	subwf	((_state)),w
	skipc
	goto	u711
	goto	u710
u711:
	goto	l796
u710:
	line	197
	
l1848:	
;main.c: 197: state = 2;
	movlw	(02h)
	movwf	(_state)
	
l796:	
	line	198
;main.c: 198: PORTC = ~0x01;
	movlw	(0FEh)
	movwf	(7)	;volatile
	line	199
;main.c: 199: _delay((unsigned long)((100)*(32768/4000.0)));
	opt asmopt_off
movlw	204
movwf	(??_setTime+0)+0,f
u857:
	clrwdt
decfsz	(??_setTime+0)+0,f
	goto	u857
	nop2	;nop
opt asmopt_on

	line	200
	
l1850:	
;main.c: 200: tick = 0;
	clrf	(_tick)	;volatile
	line	203
	
l1852:	
;main.c: 201: }
;main.c: 203: if(buttonEvent == 2) {
	movf	(_buttonEvent),w	;volatile
	xorlw	02h
	skipz
	goto	u721
	goto	u720
u721:
	goto	l1856
u720:
	line	204
	
l1854:	
;main.c: 204: buttonEvent = 0;
	clrf	(_buttonEvent)	;volatile
	line	205
;main.c: 205: clkState = RUNNING;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_clkState)
	line	207
	
l1856:	
;main.c: 206: }
;main.c: 207: if(buttonEvent == 1) {
	decf	(_buttonEvent),w	;volatile
	skipz
	goto	u731
	goto	u730
u731:
	goto	l1874
u730:
	line	208
	
l1858:	
;main.c: 208: buttonEvent = 0;
	clrf	(_buttonEvent)	;volatile
	line	209
	
l1860:	
;main.c: 209: if(++minutes > 59)
	movlw	(03Ch)
	incf	(_minutes),f	;volatile
	subwf	((_minutes)),w	;volatile
	skipc
	goto	u741
	goto	u740
u741:
	goto	l1874
u740:
	line	210
	
l1862:	
;main.c: 210: minutes = 0;
	clrf	(_minutes)	;volatile
	goto	l1874
	line	214
	
l1864:	
;main.c: 214: PORTC = ~numLookupDec[(minutes / 10)];
	movlw	(0Ah)
	movwf	(?___lbdiv)
	movf	(_minutes),w	;volatile
	fcall	___lbdiv
	addlw	_numLookupDec&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	comf	indf,w
	movwf	(7)	;volatile
	line	215
;main.c: 215: break;
	goto	l1804
	line	217
	
l1866:	
;main.c: 217: PORTC = ~numLookupDec[(minutes % 10)];
	movlw	(0Ah)
	movwf	(?___lbmod)
	movf	(_minutes),w	;volatile
	fcall	___lbmod
	addlw	_numLookupDec&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	comf	indf,w
	movwf	(7)	;volatile
	line	218
;main.c: 218: break;
	goto	l1804
	line	212
	
l1874:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_state),w
	; Switch size 1, requested type "space"
; Number of cases is 4, Range of values is 2 to 5
; switch strategies available:
; Name         Bytes Cycles
; simple_byte    13     7 (average)
; direct_byte    27    19 (fixed)
;	Chosen strategy is simple_byte

	xorlw	2^0	; case 2
	skipnz
	goto	l1864
	xorlw	3^2	; case 3
	skipnz
	goto	l1866
	xorlw	4^3	; case 4
	skipnz
	goto	l1836
	xorlw	5^4	; case 5
	skipnz
	goto	l1836
	goto	l1880

	line	157
	
l1878:	
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
	goto	l1806
	xorlw	2^1	; case 2
	skipnz
	goto	l1844
	goto	l1880

	line	156
	
l1880:	
	movf	(_clkState),f
	skipz
	goto	u751
	goto	u750
u751:
	goto	l1878
u750:
	line	229
	
l807:	
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
	
l1632:	
	movlw	(08h)
	movwf	(___lbmod@counter)
	line	10
	
l1634:	
	clrf	(___lbmod@rem)
	line	12
	
l1636:	
	movf	(___lbmod@dividend),w
	movwf	(??___lbmod+0)+0
	movlw	07h
u445:
	clrc
	rrf	(??___lbmod+0)+0,f
	addlw	-1
	skipz
	goto	u445
	clrc
	rlf	(___lbmod@rem),w
	iorwf	0+(??___lbmod+0)+0,w
	movwf	(___lbmod@rem)
	line	13
	
l1638:	
	clrc
	rlf	(___lbmod@dividend),f
	line	14
	
l1640:	
	movf	(___lbmod@divisor),w
	subwf	(___lbmod@rem),w
	skipc
	goto	u451
	goto	u450
u451:
	goto	l1644
u450:
	line	15
	
l1642:	
	movf	(___lbmod@divisor),w
	subwf	(___lbmod@rem),f
	line	16
	
l1644:	
	decfsz	(___lbmod@counter),f
	goto	u461
	goto	u460
u461:
	goto	l1636
u460:
	line	17
	
l1646:	
	movf	(___lbmod@rem),w
	line	18
	
l855:	
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
	
l1608:	
	clrf	(___lbdiv@quotient)
	line	10
	
l1610:	
	movf	(___lbdiv@divisor),w
	skipz
	goto	u400
	goto	l1628
u400:
	line	11
	
l1612:	
	clrf	(___lbdiv@counter)
	incf	(___lbdiv@counter),f
	line	12
	goto	l1616
	
l844:	
	line	13
	clrc
	rlf	(___lbdiv@divisor),f
	line	14
	
l1614:	
	incf	(___lbdiv@counter),f
	line	12
	
l1616:	
	btfss	(___lbdiv@divisor),(7)&7
	goto	u411
	goto	u410
u411:
	goto	l844
u410:
	line	16
	
l846:	
	line	17
	clrc
	rlf	(___lbdiv@quotient),f
	line	18
	
l1618:	
	movf	(___lbdiv@divisor),w
	subwf	(___lbdiv@dividend),w
	skipc
	goto	u421
	goto	u420
u421:
	goto	l1624
u420:
	line	19
	
l1620:	
	movf	(___lbdiv@divisor),w
	subwf	(___lbdiv@dividend),f
	line	20
	
l1622:	
	bsf	(___lbdiv@quotient)+(0/8),(0)&7
	line	22
	
l1624:	
	clrc
	rrf	(___lbdiv@divisor),f
	line	23
	
l1626:	
	decfsz	(___lbdiv@counter),f
	goto	u431
	goto	u430
u431:
	goto	l846
u430:
	line	25
	
l1628:	
	movf	(___lbdiv@quotient),w
	line	26
	
l849:	
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
;;		line 80 in file "C:\Documents and Settings\Elijah\My Documents\PICs\C\VFDclock\utils.c"
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
	line	80
	global	__size_of_init
	__size_of_init	equ	__end_of_init-_init
	
_init:	
	opt	stack 7
; Regs used in _init: [wreg+status,2]
	line	82
	
l1580:	
;utils.c: 82: TRISA = 0b00000100;
	movlw	(04h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(133)^080h	;volatile
	line	83
;utils.c: 83: TRISB = 0b01000000;
	movlw	(040h)
	movwf	(134)^080h	;volatile
	line	84
	
l1582:	
;utils.c: 84: TRISC = 0b00000000;
	clrf	(135)^080h	;volatile
	line	86
	
l1584:	
;utils.c: 86: ANSEL = 0b00000000;
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	clrf	(286)^0100h	;volatile
	line	87
;utils.c: 87: ANSELH = 0b00000011;
	movlw	(03h)
	movwf	(287)^0100h	;volatile
	line	89
;utils.c: 89: TMR1H = 0xFF;
	movlw	(0FFh)
	bcf	status, 6	;RP1=0, select bank0
	movwf	(15)	;volatile
	line	90
;utils.c: 90: TMR1L = 0x58;
	movlw	(058h)
	movwf	(14)	;volatile
	line	91
	
l1586:	
;utils.c: 91: TMR0 = 0x00;
	clrf	(1)	;volatile
	line	94
	
l1588:	
;utils.c: 94: T0CS = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1037/8)^080h,(1037)&7
	line	99
	
l1590:	
;utils.c: 99: T1CON = 0b00110001;
	movlw	(031h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(16)	;volatile
	line	102
	
l1592:	
;utils.c: 102: T2CON = 0b01111101;
	movlw	(07Dh)
	movwf	(18)	;volatile
	line	103
	
l1594:	
;utils.c: 103: PR2 = 0x7F;
	movlw	(07Fh)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(146)^080h	;volatile
	line	106
	
l1596:	
;utils.c: 106: INTCON = 0b11100000;
	movlw	(0E0h)
	movwf	(11)	;volatile
	line	108
	
l1598:	
;utils.c: 108: PIE1 = 0b00000011;
	movlw	(03h)
	movwf	(140)^080h	;volatile
	line	110
;utils.c: 110: WPUA = 0x00;
	clrf	(149)^080h	;volatile
	line	112
	
l1600:	
;utils.c: 112: WPUB = 0b01000000;
	movlw	(040h)
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movwf	(277)^0100h	;volatile
	line	115
	
l1602:	
;utils.c: 115: CM1CON0 = 0x00;
	clrf	(281)^0100h	;volatile
	line	116
	
l1604:	
;utils.c: 116: CM2CON0 = 0x00;
	clrf	(282)^0100h	;volatile
	line	117
	
l1606:	
;utils.c: 117: T0CS = 0x0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1037/8)^080h,(1037)&7
	line	118
	
l754:	
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
;;		line 36 in file "C:\Documents and Settings\Elijah\My Documents\PICs\C\VFDclock\utils.c"
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
	line	36
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
	line	38
	
i1l1544:	
;utils.c: 38: if(INTCON & 0b00000100) {
	btfss	(11),(2)&7
	goto	u33_21
	goto	u33_20
u33_21:
	goto	i1l1566
u33_20:
	line	40
	
i1l1546:	
;utils.c: 40: T0IF = 0;
	bcf	(90/8),(90)&7
	line	41
;utils.c: 41: if(!RB6) {
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(54/8),(54)&7
	goto	u34_21
	goto	u34_20
u34_21:
	goto	i1l1554
u34_20:
	line	43
	
i1l1548:	
;utils.c: 43: if(buttonTime < 255) {
	movf	(_buttonTime),w	;volatile
	xorlw	0FFh
	skipnz
	goto	u35_21
	goto	u35_20
u35_21:
	goto	i1l1552
u35_20:
	line	44
	
i1l1550:	
;utils.c: 44: buttonTime++;
	incf	(_buttonTime),f	;volatile
	line	45
;utils.c: 45: }
	goto	i1l1566
	line	47
	
i1l1552:	
;utils.c: 46: else
;utils.c: 47: PORTC = ~0x00;
	movlw	(0FFh)
	movwf	(7)	;volatile
	goto	i1l1566
	line	50
	
i1l1554:	
;utils.c: 49: else {
;utils.c: 50: if(buttonTime) {
	movf	(_buttonTime),w	;volatile
	skipz
	goto	u36_20
	goto	i1l1564
u36_20:
	line	51
	
i1l1556:	
;utils.c: 51: if(buttonTime > 70)
	movlw	(047h)
	subwf	(_buttonTime),w	;volatile
	skipc
	goto	u37_21
	goto	u37_20
u37_21:
	goto	i1l1560
u37_20:
	line	52
	
i1l1558:	
;utils.c: 52: buttonEvent = 2;
	movlw	(02h)
	movwf	(_buttonEvent)	;volatile
	goto	i1l1562
	line	54
	
i1l1560:	
;utils.c: 53: else
;utils.c: 54: buttonEvent = 1;
	movlw	(01h)
	movwf	(_buttonEvent)	;volatile
	line	55
	
i1l1562:	
;utils.c: 55: RB7 = 1;
	bsf	(55/8),(55)&7
	line	57
	
i1l1564:	
;utils.c: 56: }
;utils.c: 57: buttonTime = 0;
	clrf	(_buttonTime)	;volatile
	line	62
	
i1l1566:	
;utils.c: 58: }
;utils.c: 59: }
;utils.c: 62: if(PIR1 & 0b00000001) {
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(12),(0)&7
	goto	u38_21
	goto	u38_20
u38_21:
	goto	i1l1572
u38_20:
	line	64
	
i1l1568:	
;utils.c: 64: PIR1 &= 0b11111110;
	bcf	(12)+(0/8),(0)&7	;volatile
	line	65
	
i1l1570:	
;utils.c: 65: TMR1H = 0xFF;
	movlw	(0FFh)
	movwf	(15)	;volatile
	line	66
;utils.c: 66: TMR1L = 0x58;
	movlw	(058h)
	movwf	(14)	;volatile
	line	70
	
i1l1572:	
;utils.c: 67: }
;utils.c: 70: if(PIR1 & 0x02) {
	btfss	(12),(1)&7
	goto	u39_21
	goto	u39_20
u39_21:
	goto	i1l751
u39_20:
	line	71
	
i1l1574:	
;utils.c: 71: seconds++;
	incf	(_seconds),f	;volatile
	line	72
	
i1l1576:	
;utils.c: 72: tick = 1;
	movlw	(01h)
	movwf	(_tick)	;volatile
	line	73
	
i1l1578:	
;utils.c: 73: TMR2IF = 0;
	bcf	(97/8),(97)&7
	line	75
	
i1l751:	
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
