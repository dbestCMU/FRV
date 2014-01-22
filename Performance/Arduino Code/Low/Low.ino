// (define statements) 
//Written by Limor Fried/Ladyada & Phil Burgess/PaintYourDragon
// for Adafruit Industries.
// BSD license, all text above must be included in any redistribution.
#include <Adafruit_GFX.h>   // Core graphics library
#include <RGBmatrixPanel.h> // Hardware-specific library

// If your 32x32 matrix has the SINGLE HEADER input,
// use this pinout:
#define CLK 8  // MUST be on PORTB!
#define OE  9
#define LAT 10
#define A   A0
#define B   A1
#define C   A2
#define D   A3

//drawing design 1 frame, circles outward pulsing
RGBmatrixPanel matrix(A, B, C, D, CLK, LAT, OE, false);

void drawCirc(uint16_t color, uint16_t x, uint16_t y){
      matrix.fillRect(x+1,y,2,4, color);
      matrix.fillRect(x,y+1,4,2, color);
}

/**Loops are being counted outward, the higher the number, the larger the loop**/
void drawLoop0(int color){
   drawCirc(color,14,14);
}

void drawLoop1(int color){
    drawCirc(color,8,14);
    drawCirc(color,20,14);
    drawCirc(color,14,9);
    drawCirc(color,14,19);
}

void drawLoop2(int color){
    drawCirc(color,2,14);
    drawCirc(color,5,18);
    drawCirc(color,5,10);
    drawCirc(color,8,22);
    drawCirc(color,8,6);
    drawCirc(color,14,4);
    drawCirc(color,14,24);
    drawCirc(color,20,6);
    drawCirc(color,20,22);
    drawCirc(color,23,10);
    drawCirc(color,23,18);
    drawCirc(color,26,14);
}

void drawLoop3(int color){
    drawCirc(color,5,2);
    drawCirc(color,2,6);
    drawCirc(color,23,2);
    drawCirc(color,26,6); 
    drawCirc(color,26,22);
    drawCirc(color,23,26);
    drawCirc(color,5,26);
    drawCirc(color,2,22); 
    
    //edge cases
    //top 5 middle
    matrix.fillRect(15,0,2,3, color);
    matrix.fillRect(14,0,4,2, color);
    //top 4 left green
    matrix.fillRect(8,0,4,1, color);
    matrix.fillRect(9,0,2,2, color);
    //top 6
    matrix.fillRect(20,0,4,1, color);
    matrix.fillRect(21,0,2,2, color);
   //green right hand side case, top
    matrix.fillRect(29,11,3,2, color);
    matrix.fillRect(30,10,2,4, color);
    //green right hand side case, bottom
    matrix.fillRect(29,18,3,2, color);
    matrix.fillRect(30,17,2,4, color);
   //bottom 4 left green
    matrix.fillRect(8,31,4,1, color);
    matrix.fillRect(9,30,2,2, color);
    //bottom 6
    matrix.fillRect(20,31,4,1, color);
    matrix.fillRect(21,30,2,2, color);
   //bottom 5 middle
    matrix.fillRect(15,29,2,3, color);
    matrix.fillRect(14,30,4,2, color);
   //green left hand side case, top
    matrix.fillRect(0,11,3,2, color);
    matrix.fillRect(0,10,2,4, color);
    //green left hand side case, bottom
    matrix.fillRect(0,18,3,2, color);
    matrix.fillRect(0,17,2,4, color);
 }

void drawLoop4(int color){
  //top 1
    matrix.fillRect(0,2,2,4, color);
    matrix.fillRect(0,3,3,2, color);
  //top 2
    matrix.fillRect(2,0,4,1, color);
    matrix.fillRect(3,0,2,2, color);
   //top 3
    matrix.fillRect(26,0,4,1, color);
    matrix.fillRect(27,0,2,2, color);
    //top 4
    matrix.fillRect(31,2,2,4, color);
    matrix.fillRect(30,3,3,2, color);
    //bottom 4
    matrix.fillRect(31,25,2,4, color);
    matrix.fillRect(30,26,3,2, color);
    //bottom 3
    matrix.fillRect(26,31,4,1, color);
    matrix.fillRect(27,30,2,2, color);
    //bottom 2
    matrix.fillRect(2,31,4,1, color);
    matrix.fillRect(3,30,2,2, color);
    //bottom 1
    matrix.fillRect(0,26,2,4, color);
    matrix.fillRect(0,27,3,2, color);
}

void setup() {
  matrix.begin();
  Serial.begin(9600);
}

void loop(){
  
 char Color[15];
  if (Serial.available()) {
    Serial.readBytesUntil('/n',Color,15);
    drawLoop4(matrix.Color444(Color[0]-'0',Color[1]-'0',Color[2]-'0'));
    drawLoop3(matrix.Color444(Color[3]-'0',Color[4]-'0',Color[5]-'0'));
    drawLoop2(matrix.Color444(Color[6]-'0',Color[7]-'0',Color[8]-'0'));
    drawLoop1(matrix.Color444(Color[9]-'0',Color[10]-'0',Color[11]-'0'));
    drawLoop0(matrix.Color444(Color[12]-'0',Color[13]-'0',Color[14]-'0'));
    
}
}
