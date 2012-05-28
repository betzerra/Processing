class Bar{
  color barColor;
  
  float barSize;
  
  float originX;
  
  Bar(float x){
    originX = x;
    
    barSize = 100; 
    barColor = #ffffff;
  }
  
  void display(){
    noStroke();
    fill(barColor);      
    rect(originX,screen.height - barSize,20,barSize);
  }
  
  void setColor (color c){
    barColor = c; 
  }
  
  void setSize (float fSize){
      barSize = fSize;
  }
}
