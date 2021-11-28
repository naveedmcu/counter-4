
_get_digit:

;counter4.c,12 :: 		char get_digit(char _data)
;counter4.c,14 :: 		if (_data==0)
	MOVF       FARG_get_digit__data+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_get_digit0
;counter4.c,16 :: 		return display [0];
	MOVF       _display+0, 0
	MOVWF      R0+0
	GOTO       L_end_get_digit
;counter4.c,17 :: 		}
L_get_digit0:
;counter4.c,18 :: 		else if(_data==1)
	MOVF       FARG_get_digit__data+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_get_digit2
;counter4.c,20 :: 		return display [1];
	MOVF       _display+1, 0
	MOVWF      R0+0
	GOTO       L_end_get_digit
;counter4.c,21 :: 		}
L_get_digit2:
;counter4.c,22 :: 		else if(_data==2)
	MOVF       FARG_get_digit__data+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_get_digit4
;counter4.c,24 :: 		return display [2];
	MOVF       _display+2, 0
	MOVWF      R0+0
	GOTO       L_end_get_digit
;counter4.c,25 :: 		}
L_get_digit4:
;counter4.c,26 :: 		else if(_data==3)
	MOVF       FARG_get_digit__data+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_get_digit6
;counter4.c,28 :: 		return display [3];
	MOVF       _display+3, 0
	MOVWF      R0+0
	GOTO       L_end_get_digit
;counter4.c,29 :: 		}
L_get_digit6:
;counter4.c,30 :: 		else if(_data==4)
	MOVF       FARG_get_digit__data+0, 0
	XORLW      4
	BTFSS      STATUS+0, 2
	GOTO       L_get_digit8
;counter4.c,32 :: 		return display [4];
	MOVF       _display+4, 0
	MOVWF      R0+0
	GOTO       L_end_get_digit
;counter4.c,33 :: 		}
L_get_digit8:
;counter4.c,34 :: 		else if(_data==5)
	MOVF       FARG_get_digit__data+0, 0
	XORLW      5
	BTFSS      STATUS+0, 2
	GOTO       L_get_digit10
;counter4.c,36 :: 		return display [5];
	MOVF       _display+5, 0
	MOVWF      R0+0
	GOTO       L_end_get_digit
;counter4.c,37 :: 		}
L_get_digit10:
;counter4.c,38 :: 		else if(_data==6)
	MOVF       FARG_get_digit__data+0, 0
	XORLW      6
	BTFSS      STATUS+0, 2
	GOTO       L_get_digit12
;counter4.c,40 :: 		return display [6];
	MOVF       _display+6, 0
	MOVWF      R0+0
	GOTO       L_end_get_digit
;counter4.c,41 :: 		}
L_get_digit12:
;counter4.c,42 :: 		else if(_data==7)
	MOVF       FARG_get_digit__data+0, 0
	XORLW      7
	BTFSS      STATUS+0, 2
	GOTO       L_get_digit14
;counter4.c,44 :: 		return display [7];
	MOVF       _display+7, 0
	MOVWF      R0+0
	GOTO       L_end_get_digit
;counter4.c,45 :: 		}
L_get_digit14:
;counter4.c,46 :: 		else if(_data==8)
	MOVF       FARG_get_digit__data+0, 0
	XORLW      8
	BTFSS      STATUS+0, 2
	GOTO       L_get_digit16
;counter4.c,48 :: 		return display [8];
	MOVF       _display+8, 0
	MOVWF      R0+0
	GOTO       L_end_get_digit
;counter4.c,49 :: 		}
L_get_digit16:
;counter4.c,50 :: 		else if(_data==9)
	MOVF       FARG_get_digit__data+0, 0
	XORLW      9
	BTFSS      STATUS+0, 2
	GOTO       L_get_digit18
;counter4.c,52 :: 		return display [9];
	MOVF       _display+9, 0
	MOVWF      R0+0
	GOTO       L_end_get_digit
;counter4.c,53 :: 		}
L_get_digit18:
;counter4.c,54 :: 		}
L_end_get_digit:
	RETURN
; end of _get_digit

_EEPRom_init:

;counter4.c,56 :: 		void EEPRom_init(){
;counter4.c,57 :: 		soft_I2C_Init();
	CALL       _Soft_I2C_Init+0
;counter4.c,58 :: 		}
L_end_EEPRom_init:
	RETURN
; end of _EEPRom_init

_EEPROM_24C512_WrSingle:

;counter4.c,61 :: 		void EEPROM_24C512_WrSingle(unsigned char wAddr, unsigned short wData)
;counter4.c,63 :: 		soft_I2C_Start();
	CALL       _Soft_I2C_Start+0
;counter4.c,65 :: 		while(soft_I2C_Write(0xA0)!=0) soft_I2C_Start();
L_EEPROM_24C512_WrSingle19:
	MOVLW      160
	MOVWF      FARG_Soft_I2C_Write_data_+0
	CALL       _Soft_I2C_Write+0
	MOVF       R0+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_EEPROM_24C512_WrSingle20
	CALL       _Soft_I2C_Start+0
	GOTO       L_EEPROM_24C512_WrSingle19
L_EEPROM_24C512_WrSingle20:
;counter4.c,68 :: 		while(soft_I2C_Write(wAddr)!=0);
L_EEPROM_24C512_WrSingle21:
	MOVF       FARG_EEPROM_24C512_WrSingle_wAddr+0, 0
	MOVWF      FARG_Soft_I2C_Write_data_+0
	CALL       _Soft_I2C_Write+0
	MOVF       R0+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_EEPROM_24C512_WrSingle22
	GOTO       L_EEPROM_24C512_WrSingle21
L_EEPROM_24C512_WrSingle22:
;counter4.c,70 :: 		while(soft_I2C_Write(wData)!=0);
L_EEPROM_24C512_WrSingle23:
	MOVF       FARG_EEPROM_24C512_WrSingle_wData+0, 0
	MOVWF      FARG_Soft_I2C_Write_data_+0
	CALL       _Soft_I2C_Write+0
	MOVF       R0+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_EEPROM_24C512_WrSingle24
	GOTO       L_EEPROM_24C512_WrSingle23
L_EEPROM_24C512_WrSingle24:
;counter4.c,72 :: 		soft_I2C_Stop();
	CALL       _Soft_I2C_Stop+0
;counter4.c,74 :: 		}
L_end_EEPROM_24C512_WrSingle:
	RETURN
; end of _EEPROM_24C512_WrSingle

_EEPROM_24C512_RdSingle:

;counter4.c,76 :: 		unsigned short EEPROM_24C512_RdSingle(unsigned char rAddr)
;counter4.c,79 :: 		soft_I2C_Start();
	CALL       _Soft_I2C_Start+0
;counter4.c,80 :: 		while(soft_I2C_Write(0xA0)!=0) soft_I2C_Start();
L_EEPROM_24C512_RdSingle25:
	MOVLW      160
	MOVWF      FARG_Soft_I2C_Write_data_+0
	CALL       _Soft_I2C_Write+0
	MOVF       R0+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_EEPROM_24C512_RdSingle26
	CALL       _Soft_I2C_Start+0
	GOTO       L_EEPROM_24C512_RdSingle25
L_EEPROM_24C512_RdSingle26:
;counter4.c,83 :: 		soft_I2C_Write(rAddr);
	MOVF       FARG_EEPROM_24C512_RdSingle_rAddr+0, 0
	MOVWF      FARG_Soft_I2C_Write_data_+0
	CALL       _Soft_I2C_Write+0
;counter4.c,85 :: 		soft_I2C_Start();
	CALL       _Soft_I2C_Start+0
;counter4.c,86 :: 		soft_I2C_Write(0xA1);
	MOVLW      161
	MOVWF      FARG_Soft_I2C_Write_data_+0
	CALL       _Soft_I2C_Write+0
;counter4.c,89 :: 		reslt = soft_I2C_Read(0);
	CLRF       FARG_Soft_I2C_Read_ack+0
	CLRF       FARG_Soft_I2C_Read_ack+1
	CALL       _Soft_I2C_Read+0
	MOVF       R0+0, 0
	MOVWF      EEPROM_24C512_RdSingle_reslt_L0+0
;counter4.c,92 :: 		soft_I2C_Stop();
	CALL       _Soft_I2C_Stop+0
;counter4.c,94 :: 		return reslt;
	MOVF       EEPROM_24C512_RdSingle_reslt_L0+0, 0
	MOVWF      R0+0
;counter4.c,95 :: 		}
L_end_EEPROM_24C512_RdSingle:
	RETURN
; end of _EEPROM_24C512_RdSingle

_main:

;counter4.c,97 :: 		void main(){
;counter4.c,98 :: 		TRISA = 0;
	CLRF       TRISA+0
;counter4.c,99 :: 		TRISB = 0;
	CLRF       TRISB+0
;counter4.c,100 :: 		TRISC = 0;
	CLRF       TRISC+0
;counter4.c,101 :: 		PORTC = 0;
	CLRF       PORTC+0
;counter4.c,102 :: 		PORTA = 0;
	CLRF       PORTA+0
;counter4.c,103 :: 		TRISC = 0x07;                                // set RC1 pin as input
	MOVLW      7
	MOVWF      TRISC+0
;counter4.c,105 :: 		EEPRom_init();
	CALL       _EEPRom_init+0
;counter4.c,106 :: 		delay_ms(10);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_main27:
	DECFSZ     R13+0, 1
	GOTO       L_main27
	DECFSZ     R12+0, 1
	GOTO       L_main27
	NOP
	NOP
;counter4.c,115 :: 		hours = EEPROM_24C512_RdSingle(10);
	MOVLW      10
	MOVWF      FARG_EEPROM_24C512_RdSingle_rAddr+0
	CALL       _EEPROM_24C512_RdSingle+0
	MOVF       R0+0, 0
	MOVWF      _hours+0
;counter4.c,116 :: 		minutes = EEPROM_24C512_RdSingle(2);
	MOVLW      2
	MOVWF      FARG_EEPROM_24C512_RdSingle_rAddr+0
	CALL       _EEPROM_24C512_RdSingle+0
	MOVF       R0+0, 0
	MOVWF      _minutes+0
;counter4.c,121 :: 		hh0 = hours % 10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       _hours+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      _hh0+0
;counter4.c,122 :: 		hh1 = hours / 10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       _hours+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_U+0
	MOVF       R0+0, 0
	MOVWF      _hh1+0
;counter4.c,123 :: 		mm0 = minutes % 10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       _minutes+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      _mm0+0
;counter4.c,124 :: 		mm1 = minutes / 10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       _minutes+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_U+0
	MOVF       R0+0, 0
	MOVWF      _mm1+0
;counter4.c,158 :: 		while (1)
L_main28:
;counter4.c,160 :: 		if (portc.b1 == 1)
	BTFSS      PORTC+0, 1
	GOTO       L_main30
;counter4.c,162 :: 		button_flag=1;
	MOVLW      1
	MOVWF      _button_flag+0
;counter4.c,164 :: 		if (--minutes <= 00)
	DECF       _minutes+0, 1
	MOVF       _minutes+0, 0
	SUBLW      0
	BTFSS      STATUS+0, 0
	GOTO       L_main31
;counter4.c,165 :: 		minutes = 59;
	MOVLW      59
	MOVWF      _minutes+0
L_main31:
;counter4.c,166 :: 		mm0 = minutes % 10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       _minutes+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      _mm0+0
;counter4.c,167 :: 		mm1 = minutes / 10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       _minutes+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_U+0
	MOVF       R0+0, 0
	MOVWF      _mm1+0
;counter4.c,168 :: 		for (i=0; i<=25; i++)
	CLRF       _i+0
L_main32:
	MOVF       _i+0, 0
	SUBLW      25
	BTFSS      STATUS+0, 0
	GOTO       L_main33
;counter4.c,170 :: 		PORTB = get_digit(hh1);        //0
	MOVF       _hh1+0, 0
	MOVWF      FARG_get_digit__data+0
	CALL       _get_digit+0
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;counter4.c,171 :: 		PORTA.B0 = 1;        //A0 - common hh1
	BSF        PORTA+0, 0
;counter4.c,172 :: 		DELAY_MS(3);
	MOVLW      4
	MOVWF      R12+0
	MOVLW      228
	MOVWF      R13+0
L_main35:
	DECFSZ     R13+0, 1
	GOTO       L_main35
	DECFSZ     R12+0, 1
	GOTO       L_main35
	NOP
;counter4.c,173 :: 		PORTA.B0 = 0;
	BCF        PORTA+0, 0
;counter4.c,174 :: 		PORTB = get_digit(hh0);        //1
	MOVF       _hh0+0, 0
	MOVWF      FARG_get_digit__data+0
	CALL       _get_digit+0
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;counter4.c,175 :: 		PORTC.B5 = 1;        //C5 - common hh0
	BSF        PORTC+0, 5
;counter4.c,176 :: 		DELAY_MS(3);
	MOVLW      4
	MOVWF      R12+0
	MOVLW      228
	MOVWF      R13+0
L_main36:
	DECFSZ     R13+0, 1
	GOTO       L_main36
	DECFSZ     R12+0, 1
	GOTO       L_main36
	NOP
;counter4.c,177 :: 		PORTC.B5 = 0;
	BCF        PORTC+0, 5
;counter4.c,178 :: 		PORTB = get_digit(mm1);        //2
	MOVF       _mm1+0, 0
	MOVWF      FARG_get_digit__data+0
	CALL       _get_digit+0
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;counter4.c,179 :: 		PORTC.B6 = 1;        //C6 - common mm1
	BSF        PORTC+0, 6
;counter4.c,180 :: 		DELAY_MS(3);
	MOVLW      4
	MOVWF      R12+0
	MOVLW      228
	MOVWF      R13+0
L_main37:
	DECFSZ     R13+0, 1
	GOTO       L_main37
	DECFSZ     R12+0, 1
	GOTO       L_main37
	NOP
;counter4.c,181 :: 		PORTC.B6 = 0;
	BCF        PORTC+0, 6
;counter4.c,182 :: 		PORTB = get_digit(mm0);        //3
	MOVF       _mm0+0, 0
	MOVWF      FARG_get_digit__data+0
	CALL       _get_digit+0
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;counter4.c,183 :: 		PORTC.B7 = 1;        //C7 - common mm0
	BSF        PORTC+0, 7
;counter4.c,184 :: 		DELAY_MS(3);
	MOVLW      4
	MOVWF      R12+0
	MOVLW      228
	MOVWF      R13+0
L_main38:
	DECFSZ     R13+0, 1
	GOTO       L_main38
	DECFSZ     R12+0, 1
	GOTO       L_main38
	NOP
;counter4.c,185 :: 		PORTC.B7 = 0;
	BCF        PORTC+0, 7
;counter4.c,168 :: 		for (i=0; i<=25; i++)
	INCF       _i+0, 1
;counter4.c,186 :: 		}
	GOTO       L_main32
L_main33:
;counter4.c,187 :: 		}
	GOTO       L_main39
L_main30:
;counter4.c,189 :: 		if (portc.b0 == 1)
	BTFSS      PORTC+0, 0
	GOTO       L_main40
;counter4.c,192 :: 		button_flag=1;
	MOVLW      1
	MOVWF      _button_flag+0
;counter4.c,194 :: 		if (++hours >= 13)
	INCF       _hours+0, 1
	MOVLW      13
	SUBWF      _hours+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_main41
;counter4.c,195 :: 		hours = 1;
	MOVLW      1
	MOVWF      _hours+0
L_main41:
;counter4.c,196 :: 		hh0 = hours % 10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       _hours+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      _hh0+0
;counter4.c,197 :: 		hh1 = hours / 10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       _hours+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_U+0
	MOVF       R0+0, 0
	MOVWF      _hh1+0
;counter4.c,198 :: 		for (i=0; i<=25; i++)
	CLRF       _i+0
L_main42:
	MOVF       _i+0, 0
	SUBLW      25
	BTFSS      STATUS+0, 0
	GOTO       L_main43
;counter4.c,200 :: 		PORTB = get_digit(hh1);        //0
	MOVF       _hh1+0, 0
	MOVWF      FARG_get_digit__data+0
	CALL       _get_digit+0
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;counter4.c,201 :: 		PORTA.B0 = 1;        //A0 - common hh1
	BSF        PORTA+0, 0
;counter4.c,202 :: 		DELAY_MS(3);
	MOVLW      4
	MOVWF      R12+0
	MOVLW      228
	MOVWF      R13+0
L_main45:
	DECFSZ     R13+0, 1
	GOTO       L_main45
	DECFSZ     R12+0, 1
	GOTO       L_main45
	NOP
;counter4.c,203 :: 		PORTA.B0 = 0;
	BCF        PORTA+0, 0
;counter4.c,204 :: 		PORTB = get_digit(hh0);        //1
	MOVF       _hh0+0, 0
	MOVWF      FARG_get_digit__data+0
	CALL       _get_digit+0
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;counter4.c,205 :: 		PORTC.B5 = 1;        //C5 - common hh0
	BSF        PORTC+0, 5
;counter4.c,206 :: 		DELAY_MS(3);
	MOVLW      4
	MOVWF      R12+0
	MOVLW      228
	MOVWF      R13+0
L_main46:
	DECFSZ     R13+0, 1
	GOTO       L_main46
	DECFSZ     R12+0, 1
	GOTO       L_main46
	NOP
;counter4.c,207 :: 		PORTC.B5 = 0;
	BCF        PORTC+0, 5
;counter4.c,208 :: 		PORTB = get_digit(mm1);        //2
	MOVF       _mm1+0, 0
	MOVWF      FARG_get_digit__data+0
	CALL       _get_digit+0
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;counter4.c,209 :: 		PORTC.B6 = 1;        //C6 - common mm1
	BSF        PORTC+0, 6
;counter4.c,210 :: 		DELAY_MS(3);
	MOVLW      4
	MOVWF      R12+0
	MOVLW      228
	MOVWF      R13+0
L_main47:
	DECFSZ     R13+0, 1
	GOTO       L_main47
	DECFSZ     R12+0, 1
	GOTO       L_main47
	NOP
;counter4.c,211 :: 		PORTC.B6 = 0;
	BCF        PORTC+0, 6
;counter4.c,212 :: 		PORTB = get_digit(mm0);        //3
	MOVF       _mm0+0, 0
	MOVWF      FARG_get_digit__data+0
	CALL       _get_digit+0
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;counter4.c,213 :: 		PORTC.B7 = 1;        //C7 - common mm0
	BSF        PORTC+0, 7
;counter4.c,214 :: 		DELAY_MS(3);
	MOVLW      4
	MOVWF      R12+0
	MOVLW      228
	MOVWF      R13+0
L_main48:
	DECFSZ     R13+0, 1
	GOTO       L_main48
	DECFSZ     R12+0, 1
	GOTO       L_main48
	NOP
;counter4.c,215 :: 		PORTC.B7 = 0;
	BCF        PORTC+0, 7
;counter4.c,198 :: 		for (i=0; i<=25; i++)
	INCF       _i+0, 1
;counter4.c,216 :: 		}
	GOTO       L_main42
L_main43:
;counter4.c,217 :: 		}
	GOTO       L_main49
L_main40:
;counter4.c,220 :: 		if (portc.b2 == 1)
	BTFSS      PORTC+0, 2
	GOTO       L_main50
;counter4.c,223 :: 		button_flag=1;
	MOVLW      1
	MOVWF      _button_flag+0
;counter4.c,224 :: 		if (++minutes >= 60)
	INCF       _minutes+0, 1
	MOVLW      60
	SUBWF      _minutes+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_main51
;counter4.c,225 :: 		minutes = 00;
	CLRF       _minutes+0
L_main51:
;counter4.c,226 :: 		mm0 = minutes % 10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       _minutes+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      _mm0+0
;counter4.c,227 :: 		mm1 = minutes / 10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       _minutes+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_U+0
	MOVF       R0+0, 0
	MOVWF      _mm1+0
;counter4.c,228 :: 		for (i=0; i<=25; i++)
	CLRF       _i+0
L_main52:
	MOVF       _i+0, 0
	SUBLW      25
	BTFSS      STATUS+0, 0
	GOTO       L_main53
;counter4.c,230 :: 		PORTB = get_digit(hh1);        //0
	MOVF       _hh1+0, 0
	MOVWF      FARG_get_digit__data+0
	CALL       _get_digit+0
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;counter4.c,231 :: 		PORTA.B0 = 1;        //A0 - common hh1
	BSF        PORTA+0, 0
;counter4.c,232 :: 		DELAY_MS(3);
	MOVLW      4
	MOVWF      R12+0
	MOVLW      228
	MOVWF      R13+0
L_main55:
	DECFSZ     R13+0, 1
	GOTO       L_main55
	DECFSZ     R12+0, 1
	GOTO       L_main55
	NOP
;counter4.c,233 :: 		PORTA.B0 = 0;
	BCF        PORTA+0, 0
;counter4.c,234 :: 		PORTB = get_digit(hh0);        //1
	MOVF       _hh0+0, 0
	MOVWF      FARG_get_digit__data+0
	CALL       _get_digit+0
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;counter4.c,235 :: 		PORTC.B5 = 1;        //C5 - common hh0
	BSF        PORTC+0, 5
;counter4.c,236 :: 		DELAY_MS(3);
	MOVLW      4
	MOVWF      R12+0
	MOVLW      228
	MOVWF      R13+0
L_main56:
	DECFSZ     R13+0, 1
	GOTO       L_main56
	DECFSZ     R12+0, 1
	GOTO       L_main56
	NOP
;counter4.c,237 :: 		PORTC.B5 = 0;
	BCF        PORTC+0, 5
;counter4.c,238 :: 		PORTB = get_digit(mm1);        //2
	MOVF       _mm1+0, 0
	MOVWF      FARG_get_digit__data+0
	CALL       _get_digit+0
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;counter4.c,239 :: 		PORTC.B6 = 1;        //C6 - common mm1
	BSF        PORTC+0, 6
;counter4.c,240 :: 		DELAY_MS(3);
	MOVLW      4
	MOVWF      R12+0
	MOVLW      228
	MOVWF      R13+0
L_main57:
	DECFSZ     R13+0, 1
	GOTO       L_main57
	DECFSZ     R12+0, 1
	GOTO       L_main57
	NOP
;counter4.c,241 :: 		PORTC.B6 = 0;
	BCF        PORTC+0, 6
;counter4.c,242 :: 		PORTB = get_digit(mm0);        //3
	MOVF       _mm0+0, 0
	MOVWF      FARG_get_digit__data+0
	CALL       _get_digit+0
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;counter4.c,243 :: 		PORTC.B7 = 1;        //C7 - common mm0
	BSF        PORTC+0, 7
;counter4.c,244 :: 		DELAY_MS(3);
	MOVLW      4
	MOVWF      R12+0
	MOVLW      228
	MOVWF      R13+0
L_main58:
	DECFSZ     R13+0, 1
	GOTO       L_main58
	DECFSZ     R12+0, 1
	GOTO       L_main58
	NOP
;counter4.c,245 :: 		PORTC.B7 = 0;
	BCF        PORTC+0, 7
;counter4.c,228 :: 		for (i=0; i<=25; i++)
	INCF       _i+0, 1
;counter4.c,246 :: 		}
	GOTO       L_main52
L_main53:
;counter4.c,247 :: 		}
	GOTO       L_main59
L_main50:
;counter4.c,253 :: 		PORTB = get_digit(hh1);        //0
	MOVF       _hh1+0, 0
	MOVWF      FARG_get_digit__data+0
	CALL       _get_digit+0
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;counter4.c,254 :: 		PORTA.B0 = 1;        //A0 - common hh1
	BSF        PORTA+0, 0
;counter4.c,255 :: 		DELAY_MS(3);
	MOVLW      4
	MOVWF      R12+0
	MOVLW      228
	MOVWF      R13+0
L_main60:
	DECFSZ     R13+0, 1
	GOTO       L_main60
	DECFSZ     R12+0, 1
	GOTO       L_main60
	NOP
;counter4.c,256 :: 		PORTA.B0 = 0;
	BCF        PORTA+0, 0
;counter4.c,257 :: 		PORTB = get_digit(hh0);        //1
	MOVF       _hh0+0, 0
	MOVWF      FARG_get_digit__data+0
	CALL       _get_digit+0
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;counter4.c,258 :: 		PORTC.B5 = 1;        //C5 - common hh0
	BSF        PORTC+0, 5
;counter4.c,259 :: 		DELAY_MS(3);
	MOVLW      4
	MOVWF      R12+0
	MOVLW      228
	MOVWF      R13+0
L_main61:
	DECFSZ     R13+0, 1
	GOTO       L_main61
	DECFSZ     R12+0, 1
	GOTO       L_main61
	NOP
;counter4.c,260 :: 		PORTC.B5 = 0;
	BCF        PORTC+0, 5
;counter4.c,261 :: 		PORTB = get_digit(mm1);        //2
	MOVF       _mm1+0, 0
	MOVWF      FARG_get_digit__data+0
	CALL       _get_digit+0
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;counter4.c,262 :: 		PORTC.B6 = 1;        //C6 - common mm1
	BSF        PORTC+0, 6
;counter4.c,263 :: 		DELAY_MS(3);
	MOVLW      4
	MOVWF      R12+0
	MOVLW      228
	MOVWF      R13+0
L_main62:
	DECFSZ     R13+0, 1
	GOTO       L_main62
	DECFSZ     R12+0, 1
	GOTO       L_main62
	NOP
;counter4.c,264 :: 		PORTC.B6 = 0;
	BCF        PORTC+0, 6
;counter4.c,265 :: 		PORTB = get_digit(mm0);        //3
	MOVF       _mm0+0, 0
	MOVWF      FARG_get_digit__data+0
	CALL       _get_digit+0
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;counter4.c,266 :: 		PORTC.B7 = 1;        //C7 - common mm0
	BSF        PORTC+0, 7
;counter4.c,267 :: 		DELAY_MS(3);
	MOVLW      4
	MOVWF      R12+0
	MOVLW      228
	MOVWF      R13+0
L_main63:
	DECFSZ     R13+0, 1
	GOTO       L_main63
	DECFSZ     R12+0, 1
	GOTO       L_main63
	NOP
;counter4.c,268 :: 		PORTC.B7 = 0;
	BCF        PORTC+0, 7
;counter4.c,269 :: 		}
L_main59:
L_main49:
L_main39:
;counter4.c,270 :: 		if (button_flag==1 && portc.b2 == 0 && portc.b0 == 0 && portc.b1 == 0)
	MOVF       _button_flag+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main66
	BTFSC      PORTC+0, 2
	GOTO       L_main66
	BTFSC      PORTC+0, 0
	GOTO       L_main66
	BTFSC      PORTC+0, 1
	GOTO       L_main66
L__main67:
;counter4.c,272 :: 		button_flag=0;
	CLRF       _button_flag+0
;counter4.c,273 :: 		EEPROM_24C512_WrSingle(10, hours);
	MOVLW      10
	MOVWF      FARG_EEPROM_24C512_WrSingle_wAddr+0
	MOVF       _hours+0, 0
	MOVWF      FARG_EEPROM_24C512_WrSingle_wData+0
	CALL       _EEPROM_24C512_WrSingle+0
;counter4.c,274 :: 		EEPROM_24C512_WrSingle(2, minutes);
	MOVLW      2
	MOVWF      FARG_EEPROM_24C512_WrSingle_wAddr+0
	MOVF       _minutes+0, 0
	MOVWF      FARG_EEPROM_24C512_WrSingle_wData+0
	CALL       _EEPROM_24C512_WrSingle+0
;counter4.c,276 :: 		}
L_main66:
;counter4.c,278 :: 		}
	GOTO       L_main28
;counter4.c,279 :: 		}//main()
L_end_main:
	GOTO       $+0
; end of _main
