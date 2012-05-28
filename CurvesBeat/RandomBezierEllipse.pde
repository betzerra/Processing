class RandomBezierEllipse extends BezierEllipse{
  float[] _randomDeformation;
  float _deltaDeformation = 50;
  
  RandomBezierEllipse (float centerX, float centerY, int pointsQuantity, int aSize){
    super(centerX, centerY, pointsQuantity, aSize);
  }

// fill up arrays with ellipse coordinate data
void setEllipse(float radius, float controlRadius){
  _px = new float[_points];
  _py = new float[_points];
  _cx = new float[_points];
  _cy = new float[_points];
  _cx2 = new float[_points];
  _cy2 = new float[_points];
  
  _randomDeformation = new float[_points];
  
  float minDeformation = - _size * _deltaDeformation / 100;
  float maxDeformation = _size * _deltaDeformation / 100;
  
  for ( int i=0; i<_points; i++){
    _randomDeformation[i] = random(minDeformation, maxDeformation);
  }
  
  float angle = 360.0/_points;
  float controlAngle1 = angle/3.0;
  float controlAngle2 = controlAngle1*2.0;
  for ( int i=0; i<_points; i++){
    _px[i] = _centerX+cos(radians(angle))*radius;
    _py[i] = _centerY+sin(radians(angle))*radius;
    _cx[i] = _centerX+cos(radians(angle+controlAngle1))* 
      (controlRadius + _randomDeformation[i])/cos(radians(controlAngle1));
    _cy[i] = _centerY+sin(radians(angle+controlAngle1))* 
      (controlRadius + _randomDeformation[i])/cos(radians(controlAngle1));
    _cx2[i] = _centerX+cos(radians(angle+controlAngle2))* 
      (controlRadius + _randomDeformation[i])/cos(radians(controlAngle1));
    _cy2[i] = _centerY+sin(radians(angle+controlAngle2))* 
      (controlRadius + _randomDeformation[i])/cos(radians(controlAngle1));

    //increment angle so trig functions keep chugging along
    angle+=360.0/_points;
  }
}
}
