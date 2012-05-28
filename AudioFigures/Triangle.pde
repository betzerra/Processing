class Triangle extends Figure {
  float _size;

  Triangle(float aXPosition, float aYPosition, float aSize) {
    super(aXPosition, aYPosition);
    _size = aSize;
  }

  void update() {
    if (!isHidden()) {

      super.update();
      
      _x = _x + (_xSpeed * _xDirection);
      _y = _y + (_ySpeed * _yDirection);
      
      triangle(_x-(_size/2), _y-(_size/2), _x, _y+(_size/2), _x+(_size/2), _y-(_size/2));
      updateDirection();
    }
  }

  void updateWithIntensity(float anIntensity) {
    if (!isHidden()) {

      super.updateWithIntensity(anIntensity);

      _x = _x + (_xSpeed * _xDirection);
      _y = _y + (_ySpeed * _yDirection);

      float intensitySize = _size * anIntensity;
      triangle(_x-(intensitySize/2), 
      _y-(intensitySize/2), 
      _x, _y+(intensitySize/2), 
      _x+(intensitySize/2), 
      _y-(_size/2));
      
      updateDirection();
    }
  }
  
  void updateDirection(){
    if (_x > width-_size || _x < 0){
      _xDirection *= -1;
    }
    
    if (_y > height-_size || _y < 0){
      _yDirection *= -1;
    }
  }  
}

