import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

int figuresQuantity = 192;
int maxIntensity = 8;

Minim minim;
BeatDetect beatDetect;
FFT fftMix;
AudioInput audioInput;

Rectangle aRectangle;
Circle  aCircle;
Triangle aTriangle;
Figure randomFigure;

ArrayList figures;
ArrayList colors;

void setup() {
  size(640, 480, P2D);  

  minim = new Minim(this);
  audioInput = minim.getLineIn(Minim.STEREO, 512);
  fftMix = new FFT(audioInput.bufferSize(), audioInput.sampleRate());
  beatDetect = new BeatDetect();  

  colors = new ArrayList();
  colors.add(new RandomColor(89,234,19,191,81,218));
  colors.add(new RandomColor(255,255,239,244,0,83));
  colors.add(new RandomColor(87,148,132,225,150,255));
  colors.add(new RandomColor(173,255,21,29,68,88));    
  
  figures = new ArrayList();

  for (int i=0; i<figuresQuantity; i++) {
    Figure aFigure = randomFigure();
    
    RandomColor aColor = getRandomColorObject();
    aFigure.setColor(aColor.getRandomColor());
    
    figures.add(aFigure);
  }
}

void draw() {
  background(0);
  
  fftMix.forward(audioInput.mix);
  beatDetect.detect(audioInput.mix);
  beatDetect.setSensitivity(1000);
  
  if (beatDetect.isOnset()){
    randomizeFiguresPositions();
  }
  
  for (int i=0; i<figuresQuantity; i++){
    Figure aFigure = (Figure)figures.get(i);
    float anIntensity = fftMix.getBand(i);
    if (anIntensity > maxIntensity){
      anIntensity = maxIntensity;
    }
    aFigure.updateWithIntensity(anIntensity);
  }
}

void randomizeFiguresPositions(){
  for (int i=0; i<figuresQuantity; i++){
    Figure aFigure = (Figure)figures.get(i);
    aFigure.setPosition(random(0,width), random(0,height));
    
    int r = int(random(0,4));
    if (r==0){
      aFigure.setHidden(true);
    }else{
      aFigure.setHidden(false);
    }
  }
}

Figure randomFigure() {
  float minSize = 5;
  float maxSize = 20;
  Figure retVal = null;

  int r = int(random(0, 3));

  switch(r) {
  case 0:
    float aSize = random(minSize, maxSize);
    retVal = new Rectangle(random(0, width), random(0, height), aSize, aSize); 
    break;
  case 1:
    retVal = new Circle(random(0, width), random(0, height), random(minSize, maxSize));
    break;
  case 2:
  default:
    retVal = new Triangle(random(0, width), random(0, height), random(minSize, maxSize));
    break;
  }

  return retVal;
}

RandomColor getRandomColorObject(){
  int randomIndex = int(random(0, colors.size()));
  RandomColor retVal = (RandomColor)colors.get(randomIndex);
  return retVal;
}

