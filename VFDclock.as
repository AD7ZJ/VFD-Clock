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
# 8 "C:\Documents and Settings\Elijah\My Documents\PICs\C\VFDclock\main.c"
	psect config,class=CONFIG,delta=2 ;#
# 8 "C:\Documents and Settings\Elijah\My Documents\PICs\C\VFDclock\main.c"
	dw 0x3FFC & 0x3FF7 & 0x3FEF & 0x3FDF & 0x3FFF & 0x3FFF & 0x3CFF & 0x3BFF & 0x37FF ;#
	FNCALL	_main,_init
	FNROOT	_main
	FNCALL	intlevel1,_isr
	global	intlevel1
	FNROOT	intlevel1
	global	_numLookup
psect	idataBANK0,class=CODE,space=0,delta=2
global __pidataBANK0
__pidataBANK0:
	file	"C:\Documents and Settings\Elijah\My Documents\PICs\C\VFDclock\main.c"
	line	16

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
	global	_numDisplay
	global	_sec_count
	global	_sec_elapsed
	global	_tripped
	global	_INTCON
_INTCON	set	11
	global	_PIR1
_PIR1	set	12
	global	_PORTC
_PORTC	set	7
	global	_T1CON
_T1CON	set	16
	global	_TMR0
_TMR0	set	1
	global	_TMR1H
_TMR1H	set	15
	global	_TMR1L
_TMR1L	set	14
	global	_RB7
_RB7	set	55
	global	_PIE1
_PIE1	set	140
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
	file	"VFDclock.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssCOMMON,class=COMMON,space=1
global __pbssCOMMON
__pbssCOMMON:
_numDisplay:
       ds      2

_sec_count:
       ds      1

_sec_elapsed:
       ds      1

_tripped:
       ds      1

psect	dataBANK0,class=BANK0,space=1
global __pdataBANK0
__pdataBANK0:
	file	"C:\Documents and Settings\Elijah\My Documents\PICs\C\VFDclock\main.c"
_numLookup:
       ds      10

; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbssCOMMON)+0)&07Fh
	clrf	((__pbssCOMMON)+1)&07Fh
	clrf	((__pbssCOMMON)+2)&07Fh
	clrf	((__pbssCOMMON)+3)&07Fh
	clrf	((__pbssCOMMON)+4)&07Fh
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
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
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
	global	??_main
??_main:	; 0 bytes @ 0x2
	ds	2
;;Data sizes: Strings 0, constant 0, data 10, bss 5, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      4       9
;; BANK0           80      0      10
;; BANK1           80      0       0
;; BANK2           80      0       0

;;
;; Pointer list with targets:



;;
;; Critical Paths under _main in COMMON
;;
;;   None.
;;
;; Critical Paths under _isr in COMMON
;;
;;   None.
;;
;; Critical Paths under _main in BANK0
;;
;;   None.
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
;;Main: autosize = 0, tempsize = 2, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 2     2      0       0
;;                                              2 COMMON     2     2      0
;;                               _init
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
;;DATA                 0      0      14      10        0.0%
;;ABS                  0      0      13       8        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       1       2        0.0%
;;BANK0               50      0       A       3       12.5%
;;BITBANK0            50      0       0       9        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;COMMON               E      4       9       1       64.3%
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 29 in file "C:\Documents and Settings\Elijah\My Documents\PICs\C\VFDclock\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 60/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          2       0       0       0
;;      Totals:         2       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_init
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\Documents and Settings\Elijah\My Documents\PICs\C\VFDclock\main.c"
	line	29
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 8
; Regs used in _main: [wreg-fsr0h+status,2-btemp+0+pclath+cstack]
	line	34
	
l1197:	
;main.c: 30: static int ad_in;
;main.c: 31: static char i = 0;
;main.c: 32: static char temp_msb, temp_lsb, tempC, tempFrac;
;main.c: 34: init();
	fcall	_init
	line	38
	
l1199:	
;main.c: 38: _delay((unsigned long)((100)*(4000000/4000.0)));
	opt asmopt_off
movlw	130
movwf	((??_main+0)+0+1),f
	movlw	221
movwf	((??_main+0)+0),f
u77:
	decfsz	((??_main+0)+0),f
	goto	u77
	decfsz	((??_main+0)+0+1),f
	goto	u77
	nop2
opt asmopt_on

	line	39
	
l1201:	
;main.c: 39: numDisplay++;
	incf	(_numDisplay),f	;volatile
	skipnz
	incf	(_numDisplay+1),f	;volatile
	line	40
	
l1203:	
;main.c: 40: if(numDisplay > 9)
	movf	(_numDisplay+1),w	;volatile
	xorlw	80h
	movwf	btemp+0
	movlw	(high(0Ah))^80h
	subwf	btemp+0,w
	skipz
	goto	u65
	movlw	low(0Ah)
	subwf	(_numDisplay),w	;volatile
u65:

	skipc
	goto	u61
	goto	u60
u61:
	goto	l1207
u60:
	line	41
	
l1205:	
;main.c: 41: numDisplay = 0;
	clrf	(_numDisplay)	;volatile
	clrf	(_numDisplay+1)	;volatile
	line	42
	
l1207:	
;main.c: 42: PORTC = ~numLookup[numDisplay];
	movf	(_numDisplay),w	;volatile
	addlw	_numLookup&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	comf	indf,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(7)	;volatile
	line	44
	
l1209:	
;main.c: 44: RB7 = 1;
	bsf	(55/8),(55)&7
	line	45
	
l1211:	
;main.c: 45: _delay((unsigned long)((100)*(4000000/4000.0)));
	opt asmopt_off
movlw	130
movwf	((??_main+0)+0+1),f
	movlw	221
movwf	((??_main+0)+0),f
u87:
	decfsz	((??_main+0)+0),f
	goto	u87
	decfsz	((??_main+0)+0+1),f
	goto	u87
	nop2
opt asmopt_on

	line	46
	
l1213:	
;main.c: 46: RB7 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(55/8),(55)&7
	goto	l1199
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

psect	maintext
	line	48
	signat	_main,88
	global	_init
psect	text72,local,class=CODE,delta=2
global __ptext72
__ptext72:

;; *************** function _init *****************
;; Defined at:
;;		line 45 in file "C:\Documents and Settings\Elijah\My Documents\PICs\C\VFDclock\utils.c"
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
psect	text72
	file	"C:\Documents and Settings\Elijah\My Documents\PICs\C\VFDclock\utils.c"
	line	45
	global	__size_of_init
	__size_of_init	equ	__end_of_init-_init
	
_init:	
	opt	stack 7
; Regs used in _init: [wreg+status,2]
	line	47
	
l1181:	
;utils.c: 47: TRISA = 0b00000100;
	movlw	(04h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(133)^080h	;volatile
	line	48
	
l1183:	
;utils.c: 48: TRISB = 0b00000000;
	clrf	(134)^080h	;volatile
	line	49
	
l1185:	
;utils.c: 49: TRISC = 0b00000000;
	clrf	(135)^080h	;volatile
	line	51
	
l1187:	
;utils.c: 51: ANSEL = 0b00000000;
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	clrf	(286)^0100h	;volatile
	line	52
	
l1189:	
;utils.c: 52: ANSELH = 0b00000011;
	movlw	(03h)
	movwf	(287)^0100h	;volatile
	line	54
;utils.c: 54: TMR1H = 0x00;
	bcf	status, 6	;RP1=0, select bank0
	clrf	(15)	;volatile
	line	55
;utils.c: 55: TMR1L = 0x00;
	clrf	(14)	;volatile
	line	56
;utils.c: 56: TMR0 = 0x00;
	clrf	(1)	;volatile
	line	58
	
l1191:	
;utils.c: 58: T1CON = 0b00110001;
	movlw	(031h)
	movwf	(16)	;volatile
	line	63
	
l1193:	
;utils.c: 63: PIE1 = 0b00000001;
	movlw	(01h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(140)^080h	;volatile
	line	65
;utils.c: 65: WPUA = 0x00;
	clrf	(149)^080h	;volatile
	line	67
;utils.c: 67: CM1CON0 = 0x00;
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	clrf	(281)^0100h	;volatile
	line	68
;utils.c: 68: CM2CON0 = 0x00;
	clrf	(282)^0100h	;volatile
	line	69
	
l1195:	
;utils.c: 69: T0CS = 0x0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1037/8)^080h,(1037)&7
	line	70
	
l731:	
	return
	opt stack 0
GLOBAL	__end_of_init
	__end_of_init:
;; =============== function _init ends ============

	signat	_init,88
	global	_isr
psect	text73,local,class=CODE,delta=2
global __ptext73
__ptext73:

;; *************** function _isr *****************
;; Defined at:
;;		line 9 in file "C:\Documents and Settings\Elijah\My Documents\PICs\C\VFDclock\utils.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  2  720[COMMON] int 
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
psect	text73
	file	"C:\Documents and Settings\Elijah\My Documents\PICs\C\VFDclock\utils.c"
	line	9
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
psect	text73
	line	11
	
i1l1119:	
;utils.c: 11: if(INTCON & 0b00000010) {
	btfss	(11),(1)&7
	goto	u1_21
	goto	u1_20
u1_21:
	goto	i1l1129
u1_20:
	line	12
	
i1l1121:	
;utils.c: 12: if((TMR0 > 65) || (tripped == 1)) {
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(1),w	;volatile
	line	15
	
i1l1125:	
;utils.c: 14: }
;utils.c: 15: TMR0 = 0x00;
	clrf	(1)	;volatile
	line	17
	
i1l1127:	
;utils.c: 17: INTCON &= 0b11111101;
	bcf	(11)+(1/8),(1)&7	;volatile
	line	21
	
i1l1129:	
;utils.c: 18: }
;utils.c: 21: if(INTCON & 0b00000100) {
	btfss	(11),(2)&7
	goto	u2_21
	goto	u2_20
u2_21:
	goto	i1l725
u2_20:
	line	23
	
i1l1131:	
;utils.c: 23: INTCON &= 0b11111011;
	bcf	(11)+(2/8),(2)&7	;volatile
	line	24
	
i1l725:	
	line	27
;utils.c: 24: }
;utils.c: 27: if(PIR1 & 0b00000001) {
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(12),(0)&7
	goto	u3_21
	goto	u3_20
u3_21:
	goto	i1l728
u3_20:
	line	28
	
i1l1133:	
;utils.c: 28: if(sec_count > 4) {
	movlw	(05h)
	subwf	(_sec_count),w	;volatile
	skipc
	goto	u4_21
	goto	u4_20
u4_21:
	goto	i1l1139
u4_20:
	line	30
	
i1l1135:	
;utils.c: 30: sec_elapsed = 1;
	movlw	(01h)
	movwf	(_sec_elapsed)	;volatile
	line	31
	
i1l1137:	
;utils.c: 31: sec_count = 0;
	clrf	(_sec_count)	;volatile
	line	33
	
i1l1139:	
;utils.c: 32: }
;utils.c: 33: sec_count++;
	incf	(_sec_count),f	;volatile
	line	36
	
i1l1141:	
;utils.c: 36: PIR1 &= 0b11111110;
	bcf	(12)+(0/8),(0)&7	;volatile
	line	37
	
i1l1143:	
;utils.c: 37: TMR1H = 0x9E;
	movlw	(09Eh)
	movwf	(15)	;volatile
	line	38
	
i1l1145:	
;utils.c: 38: TMR1L = 0x58;
	movlw	(058h)
	movwf	(14)	;volatile
	line	40
	
i1l728:	
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
psect	text74,local,class=CODE,delta=2
global __ptext74
__ptext74:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
