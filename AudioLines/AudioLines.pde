import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

int linesQuantity = 19;

Minim minim;
AudioInput audioInput;
FFT fftMix;

AudioLine audioLines[];

void setup() {
  smooth();
  size(640, 480, P2D);

  minim = new Minim(this);
  audioInput = minim.getLineIn(Minim.STEREO, 1024);
  fftMix = new FFT(audioInput.bufferSize(), audioInput.sampleRate());

  audioLines = new AudioLine[linesQuantity];

  for (int i=0; i<linesQuantity; i++) {
    int lineVerticalPosition;
    
    if (i<3){
      lineVerticalPosition = i*10;
    }else{
      int positionModifier = int(pow(i-3,2));
      lineVerticalPosition = (i*10)+positionModifier;
    }

    AudioLine anAudioLine = new AudioLine(lineVerticalPosition, 10, i);
    audioLines[i] = anAudioLine;
  }
}

void draw() {
  background(255);
  fftMix.forward(audioInput.mix);
  
  for (int i=0; i<linesQuantity; i++) {    
    AudioLine anAudioLine = audioLines[linesQuantity-i-1];
    anAudioLine.setVectorsWithFftAndOffset(fftMix, i*7);
    anAudioLine.update();
  }
}

