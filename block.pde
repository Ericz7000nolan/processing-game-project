class Block{
public
  Block( int tempX, int tempY ){
    x = tempX;
    y = tempY;
    cnt++;
  }
  void setBlock( int tempX, int tempY ){
    x = tempX;
    y = tempY;
  }
  void display(){
   image(img1, x, y, 50, 25);
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