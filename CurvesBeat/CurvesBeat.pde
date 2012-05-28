import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;




Minim minim;
BeatDetect beatDetect;
AudioInput audioInput;
FFT fftMix;

AudioBezierEllipse aBezierEllipse;
AudioBezierEllipse aBezierEllipse2;
AudioBezierEllipse aBezierEllipse3;
AudioBezierEllipse aBezierEllipse4;
AudioBezierEllipse aBezierEllipse5;

color controlPtCol = #222222;
color anchorPtCol = #BBBBBB;

void setup() {
  size(640, 480, P2D);

  minim = new Minim(this);
  audioInput = minim.getLineIn(Minim.STEREO, 256);
  fftMix = new FFT(audioInput.bufferSize(), audioInput.sampleRate());

  beatDetect = new BeatDetect();
  println ("BufferSize: " + audioInput.bufferSize() + " SampleRate: " + audioInput.sampleRate());  

  aBezierEllipse = new AudioBezierEllipse(width/2, height/2, 64, 160);
  aBezierEllipse.enableTangentLinesAndNode(false);
  aBezierEllipse.setStrokeColor(color(255, 255, 255));
  aBezierEllipse.setFillColor(color(255, 0, 0));
  aBezierEllipse.enableFullFill(false);
  aBezierEllipse.enableFill(false);
  aBezierEllipse.setStrokeWeight(4);

  aBezierEllipse2 = new AudioBezierEllipse(width/2, height/2, 64, 100);
  aBezierEllipse2.enableTangentLinesAndNode(false);
  aBezierEllipse2.setStrokeColor(color(255, 255, 255));
  aBezierEllipse2.enableFullFill(false);
  aBezierEllipse2.enableFill(false);
  aBezierEllipse2.setStrokeWeight(2);
  
  aBezierEllipse3 = new AudioBezierEllipse(width/2, height/2, 64, 30);
  aBezierEllipse3.enableTangentLinesAndNode(false);
  aBezierEllipse3.setStrokeColor(color(255, 255, 255));
  aBezierEllipse3.setFillColor(color(0, 0, 255));
  aBezierEllipse3.enableFullFill(false);
  aBezierEllipse3.enableFill(false);
  aBezierEllipse3.setStrokeWeight(1);

  aBezierEllipse4 = new AudioBezierEllipse(width/2, height/2, 64, 140);
  aBezierEllipse4.enableTangentLinesAndNode(false);
  aBezierEllipse4.setStrokeColor(color(255, 255, 255));
  aBezierEllipse4.enableFullFill(false);
  aBezierEllipse4.enableFill(false);
  aBezierEllipse4.setStrokeWeight(2);  

  aBezierEllipse5 = new AudioBezierEllipse(width/2, height/2, 64, 120);
  aBezierEllipse5.enableTangentLinesAndNode(false);
  aBezierEllipse5.setStrokeColor(color(255, 255, 255));
  aBezierEllipse5.enableFullFill(false);
  aBezierEllipse5.enableFill(false);
  aBezierEllipse5.setStrokeWeight(2);

  smooth();
  frameRate(30);
}

void draw() {
  background(0);
  fftMix.forward(audioInput.mix);
  beatDetect.detect(audioInput.mix);

  if (beatDetect.isOnset()) {
    //  Do something
  }
  pushMatrix();
  translate(width/2, height/2);
  pushMatrix();
  rotate(frameCount*0.01);
  translate(-width/2, -height/2);
  aBezierEllipse.update(fftMix);
  aBezierEllipse2.update(fftMix);
  aBezierEllipse3.update(fftMix);
  aBezierEllipse4.update(fftMix);  
  aBezierEllipse5.update(fftMix);    
  popMatrix();
  popMatrix();
}

