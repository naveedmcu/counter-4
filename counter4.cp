#line 1 "C:/Documents and Settings/naveed ahmad mcu/Desktop/5/counter4.c"

sbit Soft_I2C_Scl at RC3_bit;
sbit Soft_I2C_Sda at RC4_bit;
sbit Soft_I2C_Scl_Direction at TRISC3_bit;
sbit Soft_I2C_Sda_Direction at TRISC4_bit;

unsigned char hours=0, minutes=0, hh0=0, hh1=0, mm0=0,mm1=0, i=0,button_flag=0;
unsigned char display [10] = {0xFB,0x18,0xED,0xBD,0x1E,0xB7,0xF7,0x99,0xFF,0xBF};



char get_digit(char _data)
{
 if (_data==0)
 {
 return display [0];
 }
 else if(_data==1)
 {
 return display [1];
 }
 else if(_data==2)
 {
 return display [2];
 }
 else if(_data==3)
 {
 return display [3];
 }
 else if(_data==4)
 {
 return display [4];
 }
 else if(_data==5)
 {
 return display [5];
 }
 else if(_data==6)
 {
 return display [6];
 }
 else if(_data==7)
 {
 return display [7];
 }
 else if(_data==8)
 {
 return display [8];
 }
 else if(_data==9)
 {
 return display [9];
 }
}

void EEPRom_init(){
 soft_I2C_Init();
 }


void EEPROM_24C512_WrSingle(unsigned char wAddr, unsigned short wData)
 {
 soft_I2C_Start();

 while(soft_I2C_Write(0xA0)!=0) soft_I2C_Start();


 while(soft_I2C_Write(wAddr)!=0);

 while(soft_I2C_Write(wData)!=0);

 soft_I2C_Stop();

 }

unsigned short EEPROM_24C512_RdSingle(unsigned char rAddr)
 {
 unsigned short reslt;
 soft_I2C_Start();
 while(soft_I2C_Write(0xA0)!=0) soft_I2C_Start();


 soft_I2C_Write(rAddr);

 soft_I2C_Start();
 soft_I2C_Write(0xA1);


 reslt = soft_I2C_Read(0);


 soft_I2C_Stop();

 return reslt;
 }

void main(){
 TRISA = 0;
 TRISB = 0;
 TRISC = 0;
 PORTC = 0;
 PORTA = 0;
 TRISC = 0x07;

 EEPRom_init();
 delay_ms(10);
#line 115 "C:/Documents and Settings/naveed ahmad mcu/Desktop/5/counter4.c"
 hours = EEPROM_24C512_RdSingle(10);
 minutes = EEPROM_24C512_RdSingle(2);




 hh0 = hours % 10;
 hh1 = hours / 10;
 mm0 = minutes % 10;
 mm1 = minutes / 10;
#line 158 "C:/Documents and Settings/naveed ahmad mcu/Desktop/5/counter4.c"
 while (1)
 {
 if (portc.b1 == 1)
 {
 button_flag=1;

 if (--minutes <= 00)
 minutes = 59;
 mm0 = minutes % 10;
 mm1 = minutes / 10;
 for (i=0; i<=25; i++)
 {
 PORTB = get_digit(hh1);
 PORTA.B0 = 1;
 DELAY_MS(3);
 PORTA.B0 = 0;
 PORTB = get_digit(hh0);
 PORTC.B5 = 1;
 DELAY_MS(3);
 PORTC.B5 = 0;
 PORTB = get_digit(mm1);
 PORTC.B6 = 1;
 DELAY_MS(3);
 PORTC.B6 = 0;
 PORTB = get_digit(mm0);
 PORTC.B7 = 1;
 DELAY_MS(3);
 PORTC.B7 = 0;
 }
 }
 else
 if (portc.b0 == 1)
 {

 button_flag=1;

 if (++hours >= 13)
 hours = 1;
 hh0 = hours % 10;
 hh1 = hours / 10;
 for (i=0; i<=25; i++)
 {
 PORTB = get_digit(hh1);
 PORTA.B0 = 1;
 DELAY_MS(3);
 PORTA.B0 = 0;
 PORTB = get_digit(hh0);
 PORTC.B5 = 1;
 DELAY_MS(3);
 PORTC.B5 = 0;
 PORTB = get_digit(mm1);
 PORTC.B6 = 1;
 DELAY_MS(3);
 PORTC.B6 = 0;
 PORTB = get_digit(mm0);
 PORTC.B7 = 1;
 DELAY_MS(3);
 PORTC.B7 = 0;
 }
 }

 else
 if (portc.b2 == 1)
 {

 button_flag=1;
 if (++minutes >= 60)
 minutes = 00;
 mm0 = minutes % 10;
 mm1 = minutes / 10;
 for (i=0; i<=25; i++)
 {
 PORTB = get_digit(hh1);
 PORTA.B0 = 1;
 DELAY_MS(3);
 PORTA.B0 = 0;
 PORTB = get_digit(hh0);
 PORTC.B5 = 1;
 DELAY_MS(3);
 PORTC.B5 = 0;
 PORTB = get_digit(mm1);
 PORTC.B6 = 1;
 DELAY_MS(3);
 PORTC.B6 = 0;
 PORTB = get_digit(mm0);
 PORTC.B7 = 1;
 DELAY_MS(3);
 PORTC.B7 = 0;
 }
 }



 else
 {
 PORTB = get_digit(hh1);
 PORTA.B0 = 1;
 DELAY_MS(3);
 PORTA.B0 = 0;
 PORTB = get_digit(hh0);
 PORTC.B5 = 1;
 DELAY_MS(3);
 PORTC.B5 = 0;
 PORTB = get_digit(mm1);
 PORTC.B6 = 1;
 DELAY_MS(3);
 PORTC.B6 = 0;
 PORTB = get_digit(mm0);
 PORTC.B7 = 1;
 DELAY_MS(3);
 PORTC.B7 = 0;
 }
 if (button_flag==1 && portc.b2 == 0 && portc.b0 == 0 && portc.b1 == 0)
 {
 button_flag=0;
 EEPROM_24C512_WrSingle(10, hours);
 EEPROM_24C512_WrSingle(2, minutes);

 }

 }
}
