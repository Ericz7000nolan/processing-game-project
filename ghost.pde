class Ghost{
public  
  Ghost( int tempX, int tempY ){
    x = tempX;
    y = tempY;
  }
  void display(){
    image(img4, x, y, 30, 30);
  }
  void setX( float tempX ){
    x = tempX;
  }
  void setY( float tempY ){
    y = tempY;
  }
  float getX(){
    return x;
  }
  float getY(){
    return y;
  }
private
   float x;
   float y;
}