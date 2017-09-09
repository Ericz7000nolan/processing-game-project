class Mario{
public
  Mario( int tempX, int tempY ){
   x = tempX;
   y = tempY;
  }
  void display(){
    
    
   if( x <= 100 )
   {
     imageJudge( 100, y, 40, 50); //rect( 60, y , 25, 50 );// rect( 60, y - jumpNum, 25, 50 ); 
   }
   else if( x >= marioRightend )
   {
     imageJudge( marioRightend, y, 40, 50);//rect( 340, y , 25, 50 );// rect( 340, y - jumpNum, 25, 50 );
   }
   else
   {
     imageJudge( x, y, 40, 50);//rect( x, y , 25, 50 ); //rect( x, y - jumpNum, 25, 50 ); 
   }
  }
  
  void imageJudge(int x,int y,int w,int h)
  {
    if(Move == 0)
    image(Movement0,x,y,w,h);
    else if(Move == 1)
    image(Movement1,x,y,w,h);
    else if(Move == 2)
    {
      if(imageCount<=bound[1])
      image(Movement2,x,y,w,h);
      else if(imageCount>bound[1] && imageCount<=bound[2])
      image(Movement3,x,y,w,h);
      else if(imageCount>bound[2] && imageCount<=bound[3])
      image(Movement4,x,y,w,h);
      else if(imageCount>bound[3] && imageCount<=bound[4])
      image(Movement5,x,y,w,h);
      else if(imageCount>bound[4] && imageCount<=bound[5])
      image(Movement6,x,y,w,h);
      else
      imageCount = 0;
    }
    else if(Move == 3)
    {
      if(imageCount<=bound[1])
      image(Movement7,x,y,w,h);
      else if(imageCount>bound[1] && imageCount<=bound[2])
      image(Movement8,x,y,w,h);
      else if(imageCount>bound[2] && imageCount<=bound[3])
      image(Movement9,x,y,w,h);
      else if(imageCount>bound[3] && imageCount<=bound[4])
      image(Movement10,x,y,w,h);
      else if(imageCount>bound[4] && imageCount<=bound[5])
      image(Movement11,x,y,w,h);
      else
      imageCount = 0;
    }
  }
  
  void moveRight(){
   x += 2; 
  }
  void moveLeft(){
    x -= 2; 
  }
  void runRight(){
   x += 3; 
  }
  void runLeft(){
    x -= 3; 
  }
  void fall(){
    
    y += FallSpeed;
    if( x <= 0 || x >= mazeWidth-1000 || y >= 500 ){
      x = 180 + ( int )random( 100 );
      y = 100;
      blood-=1;
    }
  }
  void setX( int tempX ){
    x = tempX;
  }
  void setY( int tempY ){
    y = tempY;
  }
  void setBlood( int tempB ){
    blood = tempB;
  }
  int getX(){
    return x; 
  }
  int getY(){
    return y; 
  }
  int getBlood(){
    return blood; 
  }
  int tempJump;
  //int jumpNum;
private 
  int x;
  int y;
  int blood;
}