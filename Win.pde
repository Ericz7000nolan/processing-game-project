class Win{
public
  Win( int tempX, int tempY ){ 
    x = tempX;
    y = tempY;
  }
  void display(){
    image( img12, x, y, 300, 300 ); 
  }
  int getX(){
    return x;
  }
  int getY(){
    return y;
  }
private
  int x;
  int y; 
}