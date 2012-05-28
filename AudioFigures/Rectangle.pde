class Rectangle extends Figure {
  float _width;
  float _height;

  Rectangle(float aXPosition, 
  float aYPosition, 
  float aWidth, 
  float aHeight) {

    super(aXPosition, aYPosition);

    _width = aWidth;
    _height = aHeight;
  }

  void update() {
    if (!isHidden()) {
      super.update();
      
      _x = _x + (_xSpeed * _xDirection);
      _y = _y + (_ySpeed * _yDirection);
      
      rect(_x-(_width/2), _y-(_height/2), _width, _height);
      updateDirection();
    }
  }

  void updateWithIntensity(float anIntensity) {
    if (!isHidden()) {
      super.updateWithIntensity(anIntensity);
      
      _x = _x + (_xSpeed * _xDirection);
      _y = _y + (_ySpeed * _yDirection);
      
      rect(_x-(_width*anIntensity/2), _y-(_height*anIntensity/2), _width * anIntensity, _height * anIntensity);
      updateDirection();
    }
  }
  
  void updateDirection(){
    if (_x > width-_width || _x < 0){
      _xDirection *= -1;
    }
    
    if (_y > height-_height || _y < 0){
      _yDirection *= -1;
    }
  }  
}
