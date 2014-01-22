//Based on various examples page of performance.
import processing.serial.*;
import java.io.*;
import ddf.minim.*;
int mySwitch=0;
String [] highColors;
String [] midColors;
String [] lowColors;
Serial highPort;
Serial midPort;
Serial lowPort;
int Counter=0;

Minim minim;
AudioPlayer player;

void setup(){
  mySwitch = 1;
  highPort = new Serial(this, "COM4",9600);
  midPort = new Serial(this, "COM5",9600);
  lowPort =  new Serial(this, "COM6",9600);
  highPort.bufferUntil('\n');
  lowPort.bufferUntil('\n');
}

void draw(){
  if (mySwitch>0){
    if(Counter==0){
      readDataHigh("C:/Users/Vector/Desktop/Processing/Songs/Reason/High.txt");
      readDataMid("C:/Users/Vector/Desktop/Processing/Songs/Reason/Mid.txt");
      readDataLow("C:/Users/Vector/Desktop/Processing/Songs/Reason/Bass.txt");
      mySwitch = 0;
      minim = new Minim(this);
     player = minim.loadFile("C:/Users/Vector/Desktop/Processing/Songs/Reason/Reason.mp3");
     player.play();
    }
   
   if(Counter==1){
      readDataHigh("C:/Users/Vector/Desktop/Processing/Songs/Applause/High.txt");
      readDataMid("C:/Users/Vector/Desktop/Processing/Songs/Applause/Mid.txt");
      readDataLow("C:/Users/Vector/Desktop/Processing/Songs/Applause/Bass.txt");
      mySwitch = 0;
      minim = new Minim(this);
     player = minim.loadFile("C:/Users/Vector/Desktop/Processing/Songs/Applause/Applause.mp3");
     player.play();
    }
    
    if(Counter==2){
      readDataHigh("C:/Users/Vector/Desktop/Processing/Songs/Come With Me/High.txt");
      readDataMid("C:/Users/Vector/Desktop/Processing/Songs/Come With Me/Mid.txt");
      readDataLow("C:/Users/Vector/Desktop/Processing/Songs/Come With Me/Bass.txt");
      mySwitch = 0;
      minim = new Minim(this);
     player = minim.loadFile("C:/Users/Vector/Desktop/Processing/Songs/Come With Me/Come With Me.mp3");
     player.play();
    }
    
    if(Counter==3){
      readDataHigh("C:/Users/Vector/Desktop/Processing/Songs/Count On Me/High.txt");
      readDataMid("C:/Users/Vector/Desktop/Processing/Songs/Count On Me/Mid.txt");
      readDataLow("C:/Users/Vector/Desktop/Processing/Songs/Count On Me/Bass.txt");
      mySwitch = 0;
      minim = new Minim(this);
     player = minim.loadFile("C:/Users/Vector/Desktop/Processing/Songs/Count On Me/Count On Me.mp3");
     player.play();
    }
    
    if(Counter==4){
      readDataHigh("C:/Users/Vector/Desktop/Processing/Songs/Dance To It/High.txt");
      readDataMid("C:/Users/Vector/Desktop/Processing/Songs/Dance To It/Mid.txt");
      readDataLow("C:/Users/Vector/Desktop/Processing/Songs/Dance To It/Bass.txt");
      mySwitch = 0;
      minim = new Minim(this);
     player = minim.loadFile("C:/Users/Vector/Desktop/Processing/Songs/Dance To It/Dance To It.mp3");
     player.play();
    }
    
    if(Counter==5){
      readDataHigh("C:/Users/Vector/Desktop/Processing/Songs/Do What U Want/High.txt");
      readDataMid("C:/Users/Vector/Desktop/Processing/Songs/Do What U Want/Mid.txt");
      readDataLow("C:/Users/Vector/Desktop/Processing/Songs/Do What U Want/Bass.txt");
      mySwitch = 0;
      minim = new Minim(this);
     player = minim.loadFile("C:/Users/Vector/Desktop/Processing/Songs/Do What U Want/Do What U Want.mp3");
     player.play();
    }
    
    if(Counter==6){
      readDataHigh("C:/Users/Vector/Desktop/Processing/Songs/Earthquake/High.txt");
      readDataMid("C:/Users/Vector/Desktop/Processing/Songs/Earthquake/Mid.txt");
      readDataLow("C:/Users/Vector/Desktop/Processing/Songs/Earthquake/Bass.txt");
      mySwitch = 0;
      minim = new Minim(this);
     player = minim.loadFile("C:/Users/Vector/Desktop/Processing/Songs/Earthquake/Earthquake.mp3");
     player.play();
    }
      
     
  }
  for(int index = 0; index< highColors.length; index++){
    highPort.write(highColors[index]);
    midPort.write(midColors[index]);
    lowPort.write(lowColors[index]);
    delay(100);
  }
  mySwitch=0;
  Counter++;
}

void readDataHigh(String myFileName){
 
 File file=new File(myFileName);
 BufferedReader br=null;
 
 try{
 br=new BufferedReader(new FileReader(file));
 String text=null;
 
 /* keep reading each line until you get to the end of the file */
 while((text=br.readLine())!=null){
 /* Spilt each line up into bits and pieces using a comma as a separator */
 highColors = splitTokens(text,",");
 }
 }catch(FileNotFoundException e){
 e.printStackTrace();
 }catch(IOException e){
 e.printStackTrace();
 }finally{
 try {
 if (br != null){
 br.close();
 }
 } catch (IOException e) {
 e.printStackTrace();
 }
 }
}

void readDataLow(String myFileName){
 
 File file=new File(myFileName);
 BufferedReader br=null;
 
 try{
 br=new BufferedReader(new FileReader(file));
 String text=null;
 
 /* keep reading each line until you get to the end of the file */
 while((text=br.readLine())!=null){
 /* Spilt each line up into bits and pieces using a comma as a separator */
 lowColors = splitTokens(text,",");
 }
 }catch(FileNotFoundException e){
 e.printStackTrace();
 }catch(IOException e){
 e.printStackTrace();
 }finally{
 try {
 if (br != null){
 br.close();
 }
 } catch (IOException e) {
 e.printStackTrace();
 }
 }
}

void readDataMid(String myFileName){
 
 File file=new File(myFileName);
 BufferedReader br=null;
 
 try{
 br=new BufferedReader(new FileReader(file));
 String text=null;
 
 /* keep reading each line until you get to the end of the file */
 while((text=br.readLine())!=null){
 /* Spilt each line up into bits and pieces using a comma as a separator */
 midColors = splitTokens(text,",");
 }
 }catch(FileNotFoundException e){
 e.printStackTrace();
 }catch(IOException e){
 e.printStackTrace();
 }finally{
 try {
 if (br != null){
 br.close();
 }
 } catch (IOException e) {
 e.printStackTrace();
 }
 }
}
    
