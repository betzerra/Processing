class Circle extends Figure {
  float _size;

  Circle(float aXPosition, float aYPosition, float aSize) {
    super(aXPosition, aYPosition);

    _size = aSize;
  }

  void updateDirection(){
    if (_x > width-_size || _x < 0){
      _xDirection *= -1;
    }
    
    if (_y > height-_size || _y < 0){
      _yDirection *= -1;
    }
  }

  void update() {
    if (!isHidden()) {
      super.update();
      
      _x = _x + (_xSpeed * _xDirection);
      _y = _y + (_ySpeed * _yDirection);
      
      ellipse(_x+_size/2, _y+_size/2, _size, _size);
    }
  }

  void updateWithIntensity(float anIntensity) {
    if (!isHidden()) {
      super.updateWithIntensity(anIntensity);
      
      _x = _x + (_xSpeed * _xDirection);
      _y = _y + (_ySpeed * _yDirection);
      
      ellipse(_x+_size/2, _y+_size/2, _size * anIntensity, _size * anIntensity);
      updateDirection();
    }
  }
}

