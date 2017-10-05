#line 1 "G:/My Works/Electronics/protues projects/PA 100 hunter engineering company remote/curcit/RX/Recive.c"
sbit ir at RA1_bit;
sbit ir_direction at TRISA1_bit;
unsigned int count=0,x,i,j;
int address0,address1,command0,command1;
void interrupt()
{
 count++;
 intcon=0b00100000;
 TMR0=0;
}
 unsigned int time(){
 while(!ir);
 TMR0=count=0;
 while(ir);
 x=2*(TMR0+count*256);
 return x;

 }

 int get_byte(){ int byt=0;
 for(i=0;i<8;i++){
 x=time();
 byt <<=1;
 if (x >1000 && x < 2000) {byt+=1;}
 }
 return byt;
 }


 void start(){ x=time();
 if (x > 3500 && x < 5000){
 address0=get_byte(); address1=get_byte();
 if (address0==0b00000000&&address1==0b11111111)
 {command0=get_byte(); command1=get_byte();
 if (command0==0b00110000 && command1==0b11001111){portb.f0=1;delay_ms(500);}
 else if (command0==0b00011000 && command1==0b11100111){portb.f2=1;delay_ms(400);}
 else if (command0==0b01111010 && command1==0b10000101){portb.f3=1;delay_ms(400);}
 else if (command0==0b00010000 && command1==0b11101111){portb.f4=1;delay_ms(400);}
 else if (command0==0b00111000 && command1==0b11000111){portb.f5=1;delay_ms(400);}
 }
 }

 }

void main() {
 pcon.f3=1;
 TRISA=0x0F;
 TRISB=0;
 PORTB=0;
 PORTA=0;
 cmcon=7;
 option_reg=0b10000000;
 intcon=0b10100000;
 TMR0 = 0;
 while(1){ portb=0;
 loop:
 while(ir);
 start();

 }
 }
