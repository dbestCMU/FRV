// (define statements) 
//Written by Limor Fried/Ladyada & Phil Burgess/PaintYourDragon
// for Adafruit Industries.
// BSD license, all text above must be included in any redistribution.
#include <Adafruit_GFX.h>   // Core graphics library
#include <RGBmatrixPanel.h> // Hardware-specific library

#define CLK 8  // MUST be on PORTB!
#define OE  9
#define LAT 10
#define A   A0
#define B   A1
#define C   A2
#define D   A3

RGBmatrixPanel matrix(A, B, C, D, CLK, LAT, OE, false);

void drawCirc(uint16_t color, uint16_t x, uint16_t y){
      matrix.fillRect(x+1,y,2,4, color);
      matrix.fillRect(x,y+1,4,2, color);
}

void drawSec7(uint16_t color){
  for(int index=0;index<32;index+=4){
    drawCirc(color,28,index);
    drawCirc(color,index,0);
  }
}
void drawSec6(uint16_t color){
  for(int index=0;index<28;index+=4){
    drawCirc(color,index,4);
  }
  for(int index=4;index<32;index+=4){
    drawCirc(color,24,index);
  }
}

void drawSec5(uint16_t color){
  for(int index=0;index<24;index+=4){
    drawCirc(color,index,8);
  }
  for(int index=8;index<32;index+=4){
    drawCirc(color,20,index);
  }
}

void drawSec4(uint16_t color){
  for(int index=0;index<20;index+=4){
    drawCirc(color,index,12);
  }
  for(int index=12;index<32;index+=4){
    drawCirc(color,16,index);
  }
}

void drawSec3(uint16_t color){
  for(int index=0;index<16;index+=4){
    drawCirc(color,index,16);
  }
  for(int index=16;index<32;index+=4){
    drawCirc(color,12,index);
  }
}

void drawSec2(uint16_t color){
  for(int index=0;index<12;index+=4){
    drawCirc(color,index,20);
  }
  for(int index=20;index<32;index+=4){
    drawCirc(color,8,index);
  }
}

void drawSec1(uint16_t color){
  for(int index=0;index<8;index+=4){
    drawCirc(color,index,24);
  }
  for(int index=24;index<32;index+=4){
    drawCirc(color,4,index);
  }
}

void setup(){
  matrix.begin();
Serial.begin(9600);  
}

void loop(){
char Color[24];
  if (Serial.available()) {
    Serial.readBytesUntil('/n',Color,24);
    drawCirc(matrix.Color444(Color[0]-'0',Color[1]-'0',Color[2]-'0'),0,28);
    drawSec1(matrix.Color444(Color[3]-'0',Color[4]-'0',Color[5]-'0'));
    drawSec2(matrix.Color444(Color[6]-'0',Color[7]-'0',Color[8]-'0'));
    drawSec3(matrix.Color444(Color[9]-'0',Color[10]-'0',Color[11]-'0'));
    drawSec4(matrix.Color444(Color[12]-'0',Color[13]-'0',Color[14]-'0'));
    drawSec5(matrix.Color444(Color[15]-'0',Color[16]-'0',Color[17]-'0'));
    drawSec6(matrix.Color444(Color[18]-'0',Color[19]-'0',Color[20]-'0'));
    drawSec7(matrix.Color444(Color[21]-'0',Color[22]-'0',Color[23]-'0'));
  }

}


