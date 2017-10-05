
_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;Recive.c,5 :: 		void interrupt()
;Recive.c,7 :: 		count++;
	INCF       _count+0, 1
	BTFSC      STATUS+0, 2
	INCF       _count+1, 1
;Recive.c,8 :: 		intcon=0b00100000;
	MOVLW      32
	MOVWF      INTCON+0
;Recive.c,9 :: 		TMR0=0;
	CLRF       TMR0+0
;Recive.c,10 :: 		}
L_end_interrupt:
L__interrupt53:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_time:

;Recive.c,11 :: 		unsigned int time(){
;Recive.c,12 :: 		while(!ir);
L_time0:
	BTFSC      RA1_bit+0, BitPos(RA1_bit+0)
	GOTO       L_time1
	GOTO       L_time0
L_time1:
;Recive.c,13 :: 		TMR0=count=0;
	CLRF       _count+0
	CLRF       _count+1
	CLRF       TMR0+0
;Recive.c,14 :: 		while(ir);
L_time2:
	BTFSS      RA1_bit+0, BitPos(RA1_bit+0)
	GOTO       L_time3
	GOTO       L_time2
L_time3:
;Recive.c,15 :: 		x=2*(TMR0+count*256);
	MOVF       _count+0, 0
	MOVWF      R0+1
	CLRF       R0+0
	MOVF       R0+0, 0
	ADDWF      TMR0+0, 0
	MOVWF      R3+0
	MOVLW      0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      R0+1, 0
	MOVWF      R3+1
	MOVF       R3+0, 0
	MOVWF      R0+0
	MOVF       R3+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	MOVWF      _x+0
	MOVF       R0+1, 0
	MOVWF      _x+1
;Recive.c,16 :: 		return x;
;Recive.c,18 :: 		}
L_end_time:
	RETURN
; end of _time

_get_byte:

;Recive.c,20 :: 		int get_byte(){  int byt=0;
	CLRF       get_byte_byt_L0+0
	CLRF       get_byte_byt_L0+1
;Recive.c,21 :: 		for(i=0;i<8;i++){
	CLRF       _i+0
	CLRF       _i+1
L_get_byte4:
	MOVLW      0
	SUBWF      _i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__get_byte56
	MOVLW      8
	SUBWF      _i+0, 0
L__get_byte56:
	BTFSC      STATUS+0, 0
	GOTO       L_get_byte5
;Recive.c,22 :: 		x=time();
	CALL       _time+0
	MOVF       R0+0, 0
	MOVWF      _x+0
	MOVF       R0+1, 0
	MOVWF      _x+1
;Recive.c,23 :: 		byt <<=1;
	RLF        get_byte_byt_L0+0, 1
	RLF        get_byte_byt_L0+1, 1
	BCF        get_byte_byt_L0+0, 0
;Recive.c,24 :: 		if (x >1000 && x < 2000) {byt+=1;}
	MOVF       R0+1, 0
	SUBLW      3
	BTFSS      STATUS+0, 2
	GOTO       L__get_byte57
	MOVF       R0+0, 0
	SUBLW      232
L__get_byte57:
	BTFSC      STATUS+0, 0
	GOTO       L_get_byte9
	MOVLW      7
	SUBWF      _x+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__get_byte58
	MOVLW      208
	SUBWF      _x+0, 0
L__get_byte58:
	BTFSC      STATUS+0, 0
	GOTO       L_get_byte9
L__get_byte44:
	INCF       get_byte_byt_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       get_byte_byt_L0+1, 1
L_get_byte9:
;Recive.c,21 :: 		for(i=0;i<8;i++){
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;Recive.c,25 :: 		}
	GOTO       L_get_byte4
L_get_byte5:
;Recive.c,26 :: 		return byt;
	MOVF       get_byte_byt_L0+0, 0
	MOVWF      R0+0
	MOVF       get_byte_byt_L0+1, 0
	MOVWF      R0+1
;Recive.c,27 :: 		}
L_end_get_byte:
	RETURN
; end of _get_byte

_start:

;Recive.c,30 :: 		void start(){    x=time();
	CALL       _time+0
	MOVF       R0+0, 0
	MOVWF      _x+0
	MOVF       R0+1, 0
	MOVWF      _x+1
;Recive.c,31 :: 		if (x > 3500 && x < 5000){
	MOVF       R0+1, 0
	SUBLW      13
	BTFSS      STATUS+0, 2
	GOTO       L__start60
	MOVF       R0+0, 0
	SUBLW      172
L__start60:
	BTFSC      STATUS+0, 0
	GOTO       L_start12
	MOVLW      19
	SUBWF      _x+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__start61
	MOVLW      136
	SUBWF      _x+0, 0
L__start61:
	BTFSC      STATUS+0, 0
	GOTO       L_start12
L__start51:
;Recive.c,32 :: 		address0=get_byte(); address1=get_byte();
	CALL       _get_byte+0
	MOVF       R0+0, 0
	MOVWF      _address0+0
	MOVF       R0+1, 0
	MOVWF      _address0+1
	CALL       _get_byte+0
	MOVF       R0+0, 0
	MOVWF      _address1+0
	MOVF       R0+1, 0
	MOVWF      _address1+1
;Recive.c,33 :: 		if (address0==0b00000000&&address1==0b11111111)
	MOVLW      0
	XORWF      _address0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__start62
	MOVLW      0
	XORWF      _address0+0, 0
L__start62:
	BTFSS      STATUS+0, 2
	GOTO       L_start15
	MOVLW      0
	XORWF      _address1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__start63
	MOVLW      255
	XORWF      _address1+0, 0
L__start63:
	BTFSS      STATUS+0, 2
	GOTO       L_start15
L__start50:
;Recive.c,34 :: 		{command0=get_byte(); command1=get_byte();
	CALL       _get_byte+0
	MOVF       R0+0, 0
	MOVWF      _command0+0
	MOVF       R0+1, 0
	MOVWF      _command0+1
	CALL       _get_byte+0
	MOVF       R0+0, 0
	MOVWF      _command1+0
	MOVF       R0+1, 0
	MOVWF      _command1+1
;Recive.c,35 :: 		if (command0==0b00110000 && command1==0b11001111){portb.f0=1;delay_ms(500);}   //f1
	MOVLW      0
	XORWF      _command0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__start64
	MOVLW      48
	XORWF      _command0+0, 0
L__start64:
	BTFSS      STATUS+0, 2
	GOTO       L_start18
	MOVLW      0
	XORWF      _command1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__start65
	MOVLW      207
	XORWF      _command1+0, 0
L__start65:
	BTFSS      STATUS+0, 2
	GOTO       L_start18
L__start49:
	BSF        PORTB+0, 0
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_start19:
	DECFSZ     R13+0, 1
	GOTO       L_start19
	DECFSZ     R12+0, 1
	GOTO       L_start19
	DECFSZ     R11+0, 1
	GOTO       L_start19
	NOP
	NOP
	GOTO       L_start20
L_start18:
;Recive.c,36 :: 		else if (command0==0b00011000 && command1==0b11100111){portb.f2=1;delay_ms(400);} //f2
	MOVLW      0
	XORWF      _command0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__start66
	MOVLW      24
	XORWF      _command0+0, 0
L__start66:
	BTFSS      STATUS+0, 2
	GOTO       L_start23
	MOVLW      0
	XORWF      _command1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__start67
	MOVLW      231
	XORWF      _command1+0, 0
L__start67:
	BTFSS      STATUS+0, 2
	GOTO       L_start23
L__start48:
	BSF        PORTB+0, 2
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_start24:
	DECFSZ     R13+0, 1
	GOTO       L_start24
	DECFSZ     R12+0, 1
	GOTO       L_start24
	DECFSZ     R11+0, 1
	GOTO       L_start24
	GOTO       L_start25
L_start23:
;Recive.c,37 :: 		else if (command0==0b01111010 && command1==0b10000101){portb.f3=1;delay_ms(400);}//f3
	MOVLW      0
	XORWF      _command0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__start68
	MOVLW      122
	XORWF      _command0+0, 0
L__start68:
	BTFSS      STATUS+0, 2
	GOTO       L_start28
	MOVLW      0
	XORWF      _command1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__start69
	MOVLW      133
	XORWF      _command1+0, 0
L__start69:
	BTFSS      STATUS+0, 2
	GOTO       L_start28
L__start47:
	BSF        PORTB+0, 3
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_start29:
	DECFSZ     R13+0, 1
	GOTO       L_start29
	DECFSZ     R12+0, 1
	GOTO       L_start29
	DECFSZ     R11+0, 1
	GOTO       L_start29
	GOTO       L_start30
L_start28:
;Recive.c,38 :: 		else if (command0==0b00010000 && command1==0b11101111){portb.f4=1;delay_ms(400);}//f4
	MOVLW      0
	XORWF      _command0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__start70
	MOVLW      16
	XORWF      _command0+0, 0
L__start70:
	BTFSS      STATUS+0, 2
	GOTO       L_start33
	MOVLW      0
	XORWF      _command1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__start71
	MOVLW      239
	XORWF      _command1+0, 0
L__start71:
	BTFSS      STATUS+0, 2
	GOTO       L_start33
L__start46:
	BSF        PORTB+0, 4
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_start34:
	DECFSZ     R13+0, 1
	GOTO       L_start34
	DECFSZ     R12+0, 1
	GOTO       L_start34
	DECFSZ     R11+0, 1
	GOTO       L_start34
	GOTO       L_start35
L_start33:
;Recive.c,39 :: 		else if (command0==0b00111000 && command1==0b11000111){portb.f5=1;delay_ms(400);}//f5
	MOVLW      0
	XORWF      _command0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__start72
	MOVLW      56
	XORWF      _command0+0, 0
L__start72:
	BTFSS      STATUS+0, 2
	GOTO       L_start38
	MOVLW      0
	XORWF      _command1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__start73
	MOVLW      199
	XORWF      _command1+0, 0
L__start73:
	BTFSS      STATUS+0, 2
	GOTO       L_start38
L__start45:
	BSF        PORTB+0, 5
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_start39:
	DECFSZ     R13+0, 1
	GOTO       L_start39
	DECFSZ     R12+0, 1
	GOTO       L_start39
	DECFSZ     R11+0, 1
	GOTO       L_start39
L_start38:
L_start35:
L_start30:
L_start25:
L_start20:
;Recive.c,40 :: 		}
L_start15:
;Recive.c,41 :: 		}
L_start12:
;Recive.c,43 :: 		}
L_end_start:
	RETURN
; end of _start

_main:

;Recive.c,45 :: 		void main() {
;Recive.c,46 :: 		pcon.f3=1;
	BSF        PCON+0, 3
;Recive.c,47 :: 		TRISA=0x0F;
	MOVLW      15
	MOVWF      TRISA+0
;Recive.c,48 :: 		TRISB=0;
	CLRF       TRISB+0
;Recive.c,49 :: 		PORTB=0;
	CLRF       PORTB+0
;Recive.c,50 :: 		PORTA=0;
	CLRF       PORTA+0
;Recive.c,51 :: 		cmcon=7;
	MOVLW      7
	MOVWF      CMCON+0
;Recive.c,52 :: 		option_reg=0b10000000;
	MOVLW      128
	MOVWF      OPTION_REG+0
;Recive.c,53 :: 		intcon=0b10100000;
	MOVLW      160
	MOVWF      INTCON+0
;Recive.c,54 :: 		TMR0 = 0;
	CLRF       TMR0+0
;Recive.c,55 :: 		while(1){ portb=0;
L_main40:
	CLRF       PORTB+0
;Recive.c,57 :: 		while(ir);
L_main42:
	BTFSS      RA1_bit+0, BitPos(RA1_bit+0)
	GOTO       L_main43
	GOTO       L_main42
L_main43:
;Recive.c,58 :: 		start();
	CALL       _start+0
;Recive.c,60 :: 		}
	GOTO       L_main40
;Recive.c,61 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
