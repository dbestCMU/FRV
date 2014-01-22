// (define statements) 
//Written by Limor Fried/Ladyada & Phil Burgess/PaintYourDragon
// for Adafruit Industries.
// BSD license, all text above must be included in any redistribution.
#include <Adafruit_GFX.h>   // Core graphics library
#include <RGBmatrixPanel.h> // Hardware-specific library

#define CLK 8  // MUST be on PORTB! (Use pin 11 on Mega)
#define OE  9
#define LAT 10
#define A   A0
#define B   A1
#define C   A2
#define D   A3
RGBmatrixPanel matrix(A, B, C, D, CLK, LAT, OE, false);


void TriFillOne(int r,int g,int b){
  for(uint16_t height = 2; height<15;height++){
    for(uint16_t width = 1; width<height;width++){
      matrix.drawPixel(width,height, matrix.Color444(r,g,b));
    }
  }
}

void TriFillTwo(int r,int g,int b){
   for(uint16_t height = 1; height<15;height++){
      for(uint16_t width = height+2; width<15;width++){
      matrix.drawPixel(width,height,matrix.Color444(r,g,b));
    }
  }
}

void TriFillThree(int r,int g,int b){
   for(uint16_t height = 1; height<15;height++){
      for(uint16_t width = 17; width<(30-height);width++){
      matrix.drawPixel(width,height,matrix.Color444(r,g,b));
    }
  }
}

void TriFillFour(int r,int g,int b){
   for(uint16_t height = 2; height<15;height++){
    for(uint16_t width = 30; width>(29-(height-2));width--){
      matrix.drawPixel(width,height,matrix.Color444(r,g,b));
    }
  }
}

void TriFillFive(int r, int g, int b){
  for(uint16_t height = 17; height<30;height++){
    for(uint16_t width = height+1; width<31 ;width++){
      matrix.drawPixel(width,height,matrix.Color444(r,g,b));
    }
  }
}

void TriFillSix(int r, int g, int b){
   for(uint16_t height = 18; height<31;height++){
    for(uint16_t width = height-2; width>16;width--){
      matrix.drawPixel(width,height,matrix.Color444(r,g,b));
    }
  }
}

void TriFillSeven(int r, int g, int b){
  for(uint16_t height = 18; height < 31; height ++){
   for(uint16_t width = 14; width > 14-(height-18); width--){
     matrix.drawPixel(width,height,matrix.Color444(r,g,b));
      }
    }
}

void TriFillEight(int r, int g, int b){
  for(uint16_t height = 17; height<30;height++){
   for(uint16_t width = 13-(height-17); width > 0; width--){
     matrix.drawPixel(width,height,matrix.Color444(r,g,b));
   }
  }
}

void setup() {
  matrix.begin();
  Serial.begin(9600);
}


void loop(){
  char Color[24];
  if (Serial.available()) {
    Serial.readBytesUntil('/n',Color,24);
    TriFillOne(Color[0]-'0',Color[1]-'0',Color[2]-'0');
    TriFillTwo(Color[3]-'0',Color[4]-'0',Color[5]-'0');
    TriFillThree(Color[6]-'0',Color[7]-'0',Color[8]-'0');
    TriFillFour(Color[9]-'0',Color[10]-'0',Color[11]-'0');
    TriFillFive(Color[12]-'0',Color[13]-'0',Color[14]-'0');
    TriFillSix(Color[15]-'0',Color[16]-'0',Color[17]-'0');
    TriFillSeven(Color[18]-'0',Color[19]-'0',Color[20]-'0');
    TriFillEight(Color[21]-'0',Color[22]-'0',Color[23]-'0');
    }
  }


