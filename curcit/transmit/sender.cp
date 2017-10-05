#line 1 "C:/Users/ahmed m/Desktop/curcit/transmit/sender.c"
char x;

void main() {
pcon.f3=1;
CMCON=0x07;TRISA=255;TRISB=0;portb=0;
#line 10 "C:/Users/ahmed m/Desktop/curcit/transmit/sender.c"
 while (1) {
 if (porta.f0==1) {portb.f3=0;delay_us(9200);
 portb.f3=1;delay_us(4500);
 for(x=0;x<8;x++){
 portb.f3=0;delay_us(600);portb.f3=1;delay_us(500); }

 for(x=0;x<8;x++){
 portb.f3=0;delay_us(600);portb.f3=1;
 delay_us(1600);
 }

 for(x=0;x<3;x++){
 portb.f3=0;delay_us(600);portb.f3=1;delay_us(500); }

 for(x=0;x<2;x++){
 portb.f3=0;delay_us(600);portb.f3=1;
 delay_us(1600);}

 for(x=0;x<3;x++){
 portb.f3=0;delay_us(600);portb.f3=1;delay_us(500); }


 for(x=0;x<3;x++){
 portb.f3=0;delay_us(600);portb.f3=1;
 delay_us(1600);}
 for(x=0;x<2;x++){
 portb.f3=0;delay_us(600);portb.f3=1;delay_us(500); }

 for(x=0;x<4;x++){
 portb.f3=0;delay_us(600);portb.f3=1;
 delay_us(1600);}

 }
 }

 }
