import processing.opengl.*;
import ddf.minim.*;
//import fullscreen.*; 


Minim minim;
AudioInput in;
Bar[] barsArray;
color[] colorsArray;
int audioSensibility;
//FullScreen fs; 

boolean isRefreshEnabled;
boolean isAudioInputEnabled;

int barsMax;
//void setup() se ejecuta una sola vez
void setup(){
  isRefreshEnabled = false;
  isAudioInputEnabled = true; 
  audioSensibility = 50000;
  frameRate(24);
  
  //Tamanio de la pantalla y se usa OPENGL para una mejor performance
  size(640,480, OPENGL); 
  
  minim = new Minim(this);
  in = minim.getLineIn(Minim.STEREO, 50);
  
//  fs = new FullScreen(this); 
//  fs.enter();

  background(0);
  smooth(); //Antialiasing a toda la pantalla
    
  colorsArray = new color[5];

  for (int i=0; i<colorsArray.length; i++){
    colorsArray[0] = #ffffff;
    colorsArray[1] = #fbe700;
    colorsArray[2] = #55c5e9;
    colorsArray[3] = #8fd400;
    colorsArray[4] = #e4678a;    
  }  
    
  barsArray = new Bar[50];
  
  int jColor = 0;
  
  for (int i=0; i<barsArray.length; i++){
    if (jColor > 4)
      jColor = 0;
      
    Bar auxBar = new Bar(i*20);
    auxBar.setColor(colorsArray[jColor]);
    barsArray[i] = auxBar;
    jColor++;
  }
  
} 

void draw(){
  if (isRefreshEnabled){
    background(0);
  }
 
  for (int i=0; i<barsArray.length;i++){
    if (isAudioInputEnabled){
      barsArray[i].setSize(in.left.get(i)*audioSensibility);
      barsArray[i].setColor(colorsArray[int(random(5))]);
    }
    
    barsArray[i].display();
  }
}

void keyPressed(){
 
 switch(key){
   
   case 'p':
     isRefreshEnabled = !isRefreshEnabled;
     break;
     
   case 'o':
     isAudioInputEnabled = !isAudioInputEnabled;
     if (!isAudioInputEnabled){
       for (int i=0; i<barsArray.length; i++){
         barsArray[i].setSize(10);
       }
     }
     break;
  
     
   case '1':
     if (audioSensibility > 10){
       audioSensibility -= 1000;
       println("Audio Sensibility: " + audioSensibility);
     }
     break;
     
   case '2':
     audioSensibility += 1000;
     println("Audio Sensibility: " + audioSensibility);
     break;     
 }  
}
