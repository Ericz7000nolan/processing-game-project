class Tube{
public
  Tube( int tempX, int tempY ){
    x = tempX;
    y = tempY;
    cnt++;
  }
  void setTube( int tempX, int tempY ){
    x = tempX;
    y = tempY;
  }
  void display(){
   image(tubeImage, x, y, 75,100);
  // rect( x, y, 50, 25 ); 
  }
  int getX(){
    return x;
  }
  int getY(){
    return y;
  }
  int getCnt(){
    return cnt; 
  }
private
  int cnt; 
  int x;
  int y;
}