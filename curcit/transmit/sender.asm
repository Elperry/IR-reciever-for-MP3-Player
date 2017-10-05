
_main:

;sender.c,3 :: 		void main() {
;sender.c,4 :: 		pcon.f3=1;
	BSF        PCON+0, 3
;sender.c,5 :: 		CMCON=0x07;TRISA=255;TRISB=0;portb=0;
	MOVLW      7
	MOVWF      CMCON+0
	MOVLW      255
	MOVWF      TRISA+0
	CLRF       TRISB+0
	CLRF       PORTB+0
;sender.c,10 :: 		while (1) {
L_main0:
;sender.c,11 :: 		if (porta.f0==1) {portb.f3=0;delay_us(9200);                    //button 1
	BTFSS      PORTA+0, 0
	GOTO       L_main2
	BCF        PORTB+0, 3
	MOVLW      12
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	NOP
	NOP
;sender.c,12 :: 		portb.f3=1;delay_us(4500);
	BSF        PORTB+0, 3
	MOVLW      6
	MOVWF      R12+0
	MOVLW      215
	MOVWF      R13+0
L_main4:
	DECFSZ     R13+0, 1
	GOTO       L_main4
	DECFSZ     R12+0, 1
	GOTO       L_main4
;sender.c,13 :: 		for(x=0;x<8;x++){            // 8zero
	CLRF       _x+0
L_main5:
	MOVLW      8
	SUBWF      _x+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main6
;sender.c,14 :: 		portb.f3=0;delay_us(600);portb.f3=1;delay_us(500); }
	BCF        PORTB+0, 3
	MOVLW      199
	MOVWF      R13+0
L_main8:
	DECFSZ     R13+0, 1
	GOTO       L_main8
	NOP
	NOP
	BSF        PORTB+0, 3
	MOVLW      166
	MOVWF      R13+0
L_main9:
	DECFSZ     R13+0, 1
	GOTO       L_main9
	NOP
;sender.c,13 :: 		for(x=0;x<8;x++){            // 8zero
	INCF       _x+0, 1
;sender.c,14 :: 		portb.f3=0;delay_us(600);portb.f3=1;delay_us(500); }
	GOTO       L_main5
L_main6:
;sender.c,16 :: 		for(x=0;x<8;x++){      // 8 oness
	CLRF       _x+0
L_main10:
	MOVLW      8
	SUBWF      _x+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main11
;sender.c,17 :: 		portb.f3=0;delay_us(600);portb.f3=1;
	BCF        PORTB+0, 3
	MOVLW      199
	MOVWF      R13+0
L_main13:
	DECFSZ     R13+0, 1
	GOTO       L_main13
	NOP
	NOP
	BSF        PORTB+0, 3
;sender.c,18 :: 		delay_us(1600);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      18
	MOVWF      R13+0
L_main14:
	DECFSZ     R13+0, 1
	GOTO       L_main14
	DECFSZ     R12+0, 1
	GOTO       L_main14
	NOP
;sender.c,16 :: 		for(x=0;x<8;x++){      // 8 oness
	INCF       _x+0, 1
;sender.c,19 :: 		}
	GOTO       L_main10
L_main11:
;sender.c,21 :: 		for(x=0;x<3;x++){            // 3zero
	CLRF       _x+0
L_main15:
	MOVLW      3
	SUBWF      _x+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main16
;sender.c,22 :: 		portb.f3=0;delay_us(600);portb.f3=1;delay_us(500); }
	BCF        PORTB+0, 3
	MOVLW      199
	MOVWF      R13+0
L_main18:
	DECFSZ     R13+0, 1
	GOTO       L_main18
	NOP
	NOP
	BSF        PORTB+0, 3
	MOVLW      166
	MOVWF      R13+0
L_main19:
	DECFSZ     R13+0, 1
	GOTO       L_main19
	NOP
;sender.c,21 :: 		for(x=0;x<3;x++){            // 3zero
	INCF       _x+0, 1
;sender.c,22 :: 		portb.f3=0;delay_us(600);portb.f3=1;delay_us(500); }
	GOTO       L_main15
L_main16:
;sender.c,24 :: 		for(x=0;x<2;x++){      // 8 oness
	CLRF       _x+0
L_main20:
	MOVLW      2
	SUBWF      _x+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main21
;sender.c,25 :: 		portb.f3=0;delay_us(600);portb.f3=1;
	BCF        PORTB+0, 3
	MOVLW      199
	MOVWF      R13+0
L_main23:
	DECFSZ     R13+0, 1
	GOTO       L_main23
	NOP
	NOP
	BSF        PORTB+0, 3
;sender.c,26 :: 		delay_us(1600);}
	MOVLW      3
	MOVWF      R12+0
	MOVLW      18
	MOVWF      R13+0
L_main24:
	DECFSZ     R13+0, 1
	GOTO       L_main24
	DECFSZ     R12+0, 1
	GOTO       L_main24
	NOP
;sender.c,24 :: 		for(x=0;x<2;x++){      // 8 oness
	INCF       _x+0, 1
;sender.c,26 :: 		delay_us(1600);}
	GOTO       L_main20
L_main21:
;sender.c,28 :: 		for(x=0;x<3;x++){            // 8zero
	CLRF       _x+0
L_main25:
	MOVLW      3
	SUBWF      _x+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main26
;sender.c,29 :: 		portb.f3=0;delay_us(600);portb.f3=1;delay_us(500); }
	BCF        PORTB+0, 3
	MOVLW      199
	MOVWF      R13+0
L_main28:
	DECFSZ     R13+0, 1
	GOTO       L_main28
	NOP
	NOP
	BSF        PORTB+0, 3
	MOVLW      166
	MOVWF      R13+0
L_main29:
	DECFSZ     R13+0, 1
	GOTO       L_main29
	NOP
;sender.c,28 :: 		for(x=0;x<3;x++){            // 8zero
	INCF       _x+0, 1
;sender.c,29 :: 		portb.f3=0;delay_us(600);portb.f3=1;delay_us(500); }
	GOTO       L_main25
L_main26:
;sender.c,32 :: 		for(x=0;x<3;x++){      // 8 oness
	CLRF       _x+0
L_main30:
	MOVLW      3
	SUBWF      _x+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main31
;sender.c,33 :: 		portb.f3=0;delay_us(600);portb.f3=1;
	BCF        PORTB+0, 3
	MOVLW      199
	MOVWF      R13+0
L_main33:
	DECFSZ     R13+0, 1
	GOTO       L_main33
	NOP
	NOP
	BSF        PORTB+0, 3
;sender.c,34 :: 		delay_us(1600);}
	MOVLW      3
	MOVWF      R12+0
	MOVLW      18
	MOVWF      R13+0
L_main34:
	DECFSZ     R13+0, 1
	GOTO       L_main34
	DECFSZ     R12+0, 1
	GOTO       L_main34
	NOP
;sender.c,32 :: 		for(x=0;x<3;x++){      // 8 oness
	INCF       _x+0, 1
;sender.c,34 :: 		delay_us(1600);}
	GOTO       L_main30
L_main31:
;sender.c,35 :: 		for(x=0;x<2;x++){            // 8zero
	CLRF       _x+0
L_main35:
	MOVLW      2
	SUBWF      _x+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main36
;sender.c,36 :: 		portb.f3=0;delay_us(600);portb.f3=1;delay_us(500); }
	BCF        PORTB+0, 3
	MOVLW      199
	MOVWF      R13+0
L_main38:
	DECFSZ     R13+0, 1
	GOTO       L_main38
	NOP
	NOP
	BSF        PORTB+0, 3
	MOVLW      166
	MOVWF      R13+0
L_main39:
	DECFSZ     R13+0, 1
	GOTO       L_main39
	NOP
;sender.c,35 :: 		for(x=0;x<2;x++){            // 8zero
	INCF       _x+0, 1
;sender.c,36 :: 		portb.f3=0;delay_us(600);portb.f3=1;delay_us(500); }
	GOTO       L_main35
L_main36:
;sender.c,38 :: 		for(x=0;x<4;x++){      // 8 oness
	CLRF       _x+0
L_main40:
	MOVLW      4
	SUBWF      _x+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main41
;sender.c,39 :: 		portb.f3=0;delay_us(600);portb.f3=1;
	BCF        PORTB+0, 3
	MOVLW      199
	MOVWF      R13+0
L_main43:
	DECFSZ     R13+0, 1
	GOTO       L_main43
	NOP
	NOP
	BSF        PORTB+0, 3
;sender.c,40 :: 		delay_us(1600);}
	MOVLW      3
	MOVWF      R12+0
	MOVLW      18
	MOVWF      R13+0
L_main44:
	DECFSZ     R13+0, 1
	GOTO       L_main44
	DECFSZ     R12+0, 1
	GOTO       L_main44
	NOP
;sender.c,38 :: 		for(x=0;x<4;x++){      // 8 oness
	INCF       _x+0, 1
;sender.c,40 :: 		delay_us(1600);}
	GOTO       L_main40
L_main41:
;sender.c,42 :: 		}
L_main2:
;sender.c,43 :: 		}
	GOTO       L_main0
;sender.c,45 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
