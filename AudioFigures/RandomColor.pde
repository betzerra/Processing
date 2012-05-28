class RandomColor {
  int _minRed;
  int _maxRed;
  int _minGreen;
  int _maxGreen;
  int _minBlue;
  int _maxBlue;

  RandomColor (int aMinRed, int aMaxRed, int aMinGreen, int aMaxGreen, int aMinBlue, int aMaxBlue) {
    _minRed = aMinRed;
    _maxRed = aMaxRed;
    _minGreen = aMinGreen;
    _maxGreen = aMaxGreen;
    _minBlue = aMinBlue;
    _maxBlue = aMaxBlue;
  }
  
  color getRandomColor(){
    color retVal;
    int randomRed = int(random(_minRed, _maxRed));
    int randomBlue = int(random(_minBlue, _maxBlue));
    int randomGreen = int(random(_minGreen, _maxGreen));
    
    retVal = color(randomRed,randomBlue,randomGreen);
    return retVal;
  }
}

