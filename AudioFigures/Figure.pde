class Figure {
  float _x;
  float _y;
  float _xSpeed;
  float _ySpeed;
  int _xDirection;
  int _yDirection;
  color _fillColor;
  boolean _hidden;

  Figure(float aXPosition, float aYPosition) {
    _x = aXPosition;
    _y = aYPosition;

    int randomRed = int(random(0, 255));
    int randomGreen = int(random(0, 255));
    int randomBlue = int(random(0, 255));
    _fillColor = color(randomRed, randomGreen, randomBlue);
    _hidden = false;
    
    _xSpeed = 0.08;
    _ySpeed = 0.02;
    
    int xRandomDirection = int(random(0,1));
    if (xRandomDirection == 1){
      _xDirection = 1;
    }else{
      _xDirection = -1;
    }
    
    int yRandomDirection = int(random(0,1));
    if (yRandomDirection == 1){
      _yDirection = 1;
    }else{
      _yDirection = -1;
    }
  }

  void updateDirection(){
  }
  
  void update() {
    noStroke();
    fill(_fillColor);
  }
  
  void updateWithIntensity(float anIntensity){
    update();
  }

  void setPosition(float aXPosition, float aYPosition) {
    _x = aXPosition;
    _y = aYPosition;
  }
  
  void setHidden(boolean hidden){
    _hidden = hidden;
  }
  
  boolean isHidden (){
    return _hidden;
  }
  
  void setColor(color aColor){
    _fillColor = aColor;
  }
}

