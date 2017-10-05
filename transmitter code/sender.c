char x;

void main() {
pcon.f3=1;
CMCON=0x07;TRISA=255;TRISB=0;portb=0;
/**PWM1_Init(38000);
PWM1_Set_Duty(255);
   **/

                   while (1) {
            if (porta.f0==1) {portb.f3=0;delay_us(9200);                    //button 1
                             portb.f3=1;delay_us(4500);
                              for(x=0;x<8;x++){            // 8zero
                                               portb.f3=0;delay_us(600);portb.f3=1;delay_us(500); }

                              for(x=0;x<8;x++){      // 8 oness
                                               portb.f3=0;delay_us(600);portb.f3=1;
                                               delay_us(1600);
                                               }
                                               ////////////////////////////////////
                              for(x=0;x<3;x++){            // 3zero
                                               portb.f3=0;delay_us(600);portb.f3=1;delay_us(500); }
                              
                              for(x=0;x<2;x++){      // 8 oness
                                               portb.f3=0;delay_us(600);portb.f3=1;
                                               delay_us(1600);}
                             
                             for(x=0;x<3;x++){            // 8zero
                                               portb.f3=0;delay_us(600);portb.f3=1;delay_us(500); }
                                               
                              
                             for(x=0;x<3;x++){      // 8 oness
                                               portb.f3=0;delay_us(600);portb.f3=1;
                                               delay_us(1600);}
                             for(x=0;x<2;x++){            // 8zero
                                               portb.f3=0;delay_us(600);portb.f3=1;delay_us(500); }
                             
                             for(x=0;x<4;x++){      // 8 oness
                                               portb.f3=0;delay_us(600);portb.f3=1;
                                               delay_us(1600);}
                                               
                             }
            }
                              
    }