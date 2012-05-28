class BezierEllipse {
  float _centerX;
  float _centerY;
  int _size;
  float _strokeWeight;
  color _strokeColor;
  color _fillColor;

  int _points;
  float[] _px, _py, _cx, _cy, _cx2, _cy2;
  boolean _isTangentLinesAndNodesEnabled;
  boolean _isFillEnabled;
  boolean _isFullFillEnabled;

  BezierEllipse (float centerX, float centerY, int pointsQuantity, int aSize) {
    _centerX = centerX;
    _centerY = centerY;
    _points = pointsQuantity;
    _isTangentLinesAndNodesEnabled = false;
    _size = aSize;
    _strokeColor = color(255, 255, 255);
    _isFillEnabled = false;
    _isFullFillEnabled = false;
    _fillColor = color(255, 255, 255);
    _strokeWeight = 1.125;    
    setEllipse(_size, _size);
  }

  void enableTangentLinesAndNode (boolean aBoolean) {
    _isTangentLinesAndNodesEnabled = aBoolean;
  }

  void enableFill (boolean aBoolean) {
    _isFillEnabled = aBoolean;
  }

  void enableFullFill (boolean aBoolean) {
    _isFullFillEnabled = aBoolean;
  }  

  void setFillColor (color aColor) {
    _fillColor = aColor;
  }

  void setStrokeColor (color aColor) {
    _strokeColor = aColor;
  }
  
  void setStrokeWeight (float aWeight){
    _strokeWeight = aWeight;
  }

  // fill up arrays with ellipse coordinate data
  void setEllipse(float radius, float controlRadius) {
    _px = new float[_points];
    _py = new float[_points];
    _cx = new float[_points];
    _cy = new float[_points];
    _cx2 = new float[_points];
    _cy2 = new float[_points];
    float angle = 360.0/_points;
    float controlAngle1 = angle/3.0;
    float controlAngle2 = controlAngle1*2.0;
    for ( int i=0; i<_points; i++) {
      _px[i] = _centerX+cos(radians(angle))*radius;
      _py[i] = _centerY+sin(radians(angle))*radius;
      _cx[i] = _centerX+cos(radians(angle+controlAngle1))* 
        controlRadius/cos(radians(controlAngle1));
      _cy[i] = _centerY+sin(radians(angle+controlAngle1))* 
        controlRadius/cos(radians(controlAngle1));
      _cx2[i] = _centerX+cos(radians(angle+controlAngle2))* 
        controlRadius/cos(radians(controlAngle1));
      _cy2[i] = _centerY+sin(radians(angle+controlAngle2))* 
        controlRadius/cos(radians(controlAngle1));

      //increment angle so trig functions keep chugging along
      angle+=360.0/_points;
    }
  }

  void update() {
    drawEllipse();
    setEllipse(_size, _size);
  }

  void drawEllipse() {
    strokeWeight(_strokeWeight);
    stroke(_strokeColor);

    if (_isFillEnabled || _isFullFillEnabled) {
      fill(_fillColor);
      if (_isFullFillEnabled) {
        ellipse(_centerX, _centerY, _size*2, _size*2);
      }
    }
    else {
      noFill();
    }

    // create ellipse
    for (int i=0; i<_points; i++) {
      if (i==_points-1) {
        bezier(_px[i], _py[i], _cx[i], _cy[i], _cx2[i], _cy2[i], _px[0], _py[0]);
      }
      else {
        bezier(_px[i], _py[i], _cx[i], _cy[i], _cx2[i], _cy2[i], _px[i+1], _py[i+1]);
      }
    }
    strokeWeight(.75);
    stroke(0);
    rectMode(CENTER);

    // control handles and tangent lines
    if (_isTangentLinesAndNodesEnabled) {
      for ( int i=0; i< _points; i++) {
        if (i==_points-1) {  // last loop iteration-close path
          line(_px[0], _py[0], _cx2[i], _cy2[i]);
        }
        if (i>0) {
          line(_px[i], _py[i], _cx2[i-1], _cy2[i-1]);
        }
        line(_px[i], _py[i], _cx[i], _cy[i]);
      }

      for ( int i=0; i< _points; i++) {
        fill(controlPtCol);
        noStroke();
        //control handles
        ellipse(_cx[i], _cy[i], 4, 4);
        ellipse(_cx2[i], _cy2[i], 4, 4);

        fill(anchorPtCol);
        stroke(0);
        //anchor points
        rect(_px[i], _py[i], 5, 5);
      }
    }
  }
}

