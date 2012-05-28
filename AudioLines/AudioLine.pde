class AudioLine {
  int _id;
  int _y;
  PVector _points[];

  AudioLine(int yPosition, int pointsQuantity, int id) {
    this(yPosition, pointsQuantity);
    _id = id;
  }

  AudioLine(int yPosition, int pointsQuantity) {
    _y = yPosition;
    _points = new PVector[pointsQuantity+1];
    for (int i=0; i<=pointsQuantity; i++) {
      int xPosition = width / pointsQuantity * i;
      _points[i] = new PVector(xPosition, yPosition);
    }
  }

  void setVectorsWithFft (FFT aFft) {
    for (int i=0; i< _points.length; i++) {
      PVector aVector = _points[i];
      aVector.y = _y - aFft.getBand(i) * 5;
    }
  }

  void setVectorsWithFftAndOffset (FFT aFft, int offset) {
    for (int i=0; i< _points.length; i++) {
      PVector aVector = _points[i];
      aVector.y = _y - aFft.getBand(i+offset);
    }
  }

  void update() {
    PVector lastPoint = null;

    for (int i=0; i< _points.length; i++) {
      PVector aVector = _points[i];
      noStroke();
      fill(0, 0, 0);
      //ellipse(aVector.x, aVector.y, 5, 5); 
      strokeWeight(1.5);
      stroke(0, 0, 0);

      if (lastPoint != null) {
        line(lastPoint.x, lastPoint.y, aVector.x, aVector.y);
      }

      lastPoint = aVector;
    }
  }
}

