import processing.sound.*;
SoundFile blip;

int blockNum = 282;
int GhostNum = 3;
int TubeNum = 5;
int TurNum = 5;
int winLength = 4000;
int JumpSpeed = 1;
int FallSpeed = 2;
Mario mario1;
Ghost ghost1;
Win win1;
Block[] base = new Block[blockNum];//////////////////////////////////////////45
Tube[] tube = new Tube[TubeNum];
Ghost[] someGho = new Ghost[GhostNum];
Turtle[] someTur = new Turtle[TurNum];///////////////////////////////////////////////////////
int Turdir[];

int mazeWidth = 12000;
int [][]maze = new int[mazeWidth][1200];

int jumpState = 0;
int cntNum = 0;
int dir = 0;
int turDir[] = {1,1,1,1,1,1,1,1,1};
int gameState = 0;

PImage img;
PImage img1;
PImage img3;
PImage img4;
PImage img5;
PImage img6;
PImage img7;
PImage img8;
PImage img9;
PImage img10;
PImage img11;
PImage img12;
PImage imgBlood;
PImage tubeImage;
PImage Movement0,Movement1,Movement2,Movement3,Movement4,Movement5,Movement6,Movement7,Movement8,Movement9,Movement10,Movement11,Movement12,Movement13; 
//stop:0 jump:1 left:2~6 right:7~11 left-dash:12 right-dash:13
PFont bloodStr;

int marioRightend = 450;
int imageCount = 0;
int Move = 0; //stop:0 jump:1 left:2 right:3 left-dash:4 right-dash:5
int bound[] = {0,8,16,24,32,40};
int speed = 0;

void setup(){
 frameRate(450);
 size( 800, 400 );
 
 win1 = new Win( winLength, 65 );
 mario1 = new Mario( 120, 60);
 mario1.setBlood( 5 );
 
 generateMap();
       
  loadImage();
  bloodStr = createFont("SourceCodePro-Regular.ttf", 24);
  textFont(bloodStr);
  blip = new SoundFile( this, "blip.mp3" );
  blip.play();
}
void draw(){
  stroke(0);
  image(img3, 0, 0);
  if( gameState == 0 ){
    image(img6, 250, 250, 300, 50);
    if( mouseX >= 250 && mouseX <= 550 && mouseY >= 250 && mouseY <= 300 )
      image(img7, 250, 250, 300, 50);
    if( mousePressed ){
      if( mouseX >= 250 && mouseX <= 550 && mouseY >= 250 && mouseY <= 300 )
        gameState = 1;
    }
  }
  
  
  if( gameState == 1 ){
    showBlood();
    mario1.display();
    if( mario1.getX() >= marioRightend ){
      translate(marioRightend - mario1.getX(), 0);
    }
    if( mario1.getX() <= 100 ){
      translate(100-mario1.getX(), 0);
    }
    for( int cnt = 0; cnt < TurNum; cnt ++ )/////////////////////////////2///////////////////////
     someTur[cnt].display();
    for( int cnt = 0; cnt < GhostNum; cnt ++ )/////////////////////////////3
     someGho[cnt].display();
    for( int cnt = 0; cnt < TubeNum; cnt ++ )/////////////////////////////45
     tube[cnt].display();
    for( int cnt = 0; cnt < blockNum; cnt ++ )/////////////////////////////45
     base[cnt].display();

    win1.display();
    
    
    if( keyPressed )
    {
      if( keyCode == UP && cntNum == 1 ){
        jumpState = 1;
        Move = 1;
      }
      if( keyCode == CONTROL ){
        if( dir == 1 ){
          if( canLeft() == 1 )
            mario1.runLeft();
            Move = 4;
        }
        else if( dir == 2 ){
          if( canRight() == 1 )
            mario1.runRight();
            Move = 5;
        }
        else
         ;
      }
      if( keyCode == LEFT ){
        if( canLeft() == 1 ){
          mario1.moveLeft();
          Move = 2;
          imageCount+=1;
          dir = 1;
        }
      }
      if( keyCode == RIGHT ){
        if( canRight() == 1 ){
          mario1.moveRight();
          Move = 3;
          imageCount+=1;
          dir = 2;
        }
      }
    }
    if( !keyPressed )
      dir = 0;
      
    if( jumpState == 1 ){//jumpppppppppppppppppppp
      if( dir == 1 && keyCode == UP )
        mario1.moveLeft();
      else if( dir == 2 && keyCode == UP )
        mario1.moveRight();
      else
        ;
      mario1.tempJump += JumpSpeed;    
      mario1.setY( mario1.getY() - 1 );
      if( mario1.tempJump >= 90 ){
        jumpState = 0;
        mario1.tempJump = 0;
      }
      if(maze[mario1.getX()+20][mario1.getY()-1]==1)
        {
          mario1.fall();
        }
    }
  
    // check if object can fall still
    cntNum = 0; 
    for( int cnt = 0; cnt < 40; cnt++ ){
      if(mario1.getX()+cnt<=1)
      cntNum = 1;
      if( maze[mario1.getX() + cnt][mario1.getY() + 52 ] == 1 ){
        cntNum = 1;
        if( mario1.tempJump > 90 || mario1.tempJump == 0 ){ 
          mario1.setY( mario1.getY() );
          break;
        }
      }
    }
  
    // perform falling
    if( cntNum == 0 && jumpState == 0 ){
      mario1.fall(); 
    }
    GhostChase();
  
    TurtleMove();
    if( mario1.getX() >= win1.getX() ){
      gameState = 3;
    }
  }
  
  if( gameState == 2 ){
    image(imgBlood, 100, 25, 50, 50);
    textSize( 36 );
    if( mario1.getBlood() == 5 )
      text("* 5", 165, 30, 75, 75);
    else if( mario1.getBlood() == 4 )
      text("* 4", 165, 30, 75, 75);
    else if( mario1.getBlood() == 3 )
      text("* 3", 165, 30, 75, 75);
    else if( mario1.getBlood() == 2 )
      text("* 2", 165, 30, 75, 75);
    else if( mario1.getBlood() == 1 )
      text("* 1", 165, 30, 75, 75);
    else
      text("* 0", 165, 30, 75, 75);
      image(img8, 250, 250, 300, 50);
    if( mouseX >= 250 && mouseX <= 550 && mouseY >= 250 && mouseY <= 300 )
      image(img9, 250, 250, 300, 50);
    if( mousePressed ){
      if( mouseX >= 250 && mouseX <= 550 && mouseY >= 250 && mouseY <= 300 )
        gameState = 1;
    } 
    image(img10, 250, 320, 300, 50);
    if( mouseX >= 250 && mouseX <= 550 && mouseY >= 320 && mouseY <= 370 )
      image(img11, 250, 320, 300, 50);
    if( mousePressed ){
      if( mouseX >= 250 && mouseX <= 550 && mouseY >= 320 && mouseY <= 370 )
        mario1.setBlood( 5 );
        for( int cnt = 0; cnt < 3; cnt++ ){
          someGho[cnt].setX( 300 + cnt * 600 );
          someGho[cnt].setY( 300 );
        }
        gameState = 0;
    }
  }
  if( gameState == 3 ){
    image(img10, 250, 250, 300, 50);
    if( mouseX >= 250 && mouseX <= 550 && mouseY >= 250 && mouseY <= 300 )
      image(img11, 250, 250, 300, 50);
    if( mousePressed ){
      if( mouseX >= 250 && mouseX <= 550 && mouseY >= 250 && mouseY <= 300 )
        mario1.setBlood( 5 );
        mario1.setX(180);
        mario1.setY(100);
        for( int cnt = 0; cnt < 3; cnt++ ){
          someGho[cnt].setX( 300 + cnt * 600 );
          someGho[cnt].setY( 300 );
        }
        gameState = 0;
    }
  }
}

// return 1 if can move left, otherwise return 0
int canLeft()
{
  int cntNum1 = 1;
   if(mario1.getX() - 1<=1)
   {
      cntNum1 = 0;
      return cntNum1;
   }
  for( int cnt = 0; cnt < 50; cnt++ ){
    if( maze[mario1.getX() - 1][mario1.getY() + cnt ] == 1 ){
      cntNum1 = 0;
    }
  }
  return cntNum1;
}

// return 1 if can move left, otherwise return 0
int canRight()
{
  int cntNum2 = 1;
  for( int cnt = 0; cnt < 50; cnt++ ){
    if( maze[mario1.getX() + 40][mario1.getY() + cnt ] == 1 ){
      cntNum2 = 0;
    }
  }
  return cntNum2;
}

// return 1 if can move left, otherwise return 0
int turCanLeft( int num )
{
  int cntNum3 = 1;
  for( int cnt = 0; cnt < 30; cnt++ ){
    if( maze[( int )someTur[num].getX() - 1][( int )someTur[num].getY() + cnt ] == 1 ){
      cntNum3 = 0;
    }
  }
  return cntNum3;
}

// return 1 if can move left, otherwise return 0
int turCanRight( int num )
{
  int cntNum4 = 1;
  for( int cnt = 0; cnt < 30; cnt++ ){
    if( maze[( int )someTur[num].getX() + 30][( int )someTur[num].getY() + cnt ] == 1 ){
      cntNum4 = 0;
    }
  }
  return cntNum4;
}

void loadImage()
{
  img = loadImage("040704.png");
  img1 = loadImage("040602.png");
  img3 = loadImage("040603.png");
  img4 = loadImage("040703.png");
  img5 = loadImage("040716.png");
  img6 = loadImage("040709.png");
  img7 = loadImage("040710.png");
  img8 = loadImage("040711.png");
  img9 = loadImage("040712.png");
  img10 = loadImage("040713.png");
  img11 = loadImage("040714.png");
  img12 = loadImage("040715.png");
  Movement0 = loadImage("stop.png");
  Movement1 = loadImage("jump.png");
  Movement2 = loadImage("left1.png");
  Movement3 = loadImage("left2.png");
  Movement4 = loadImage("left3.png");
  Movement5 = loadImage("left4.png");
  Movement6 = loadImage("left5.png");
  Movement7 = loadImage("right1.png");
  Movement8 = loadImage("right2.png");
  Movement9 = loadImage("right3.png");
  Movement10 = loadImage("right4.png");
  Movement11 = loadImage("right5.png");
  Movement12 = loadImage("left-dash.png");
  Movement13 = loadImage("right-dash.png");
  imgBlood = loadImage("040706.png");
  tubeImage = loadImage("tube.png");
}


void showBlood()
{
  image(imgBlood, 100, 25, 50, 50);
    textSize( 36 );
    if( mario1.getBlood() == 5 )
      text("* 5", 165, 30, 75, 75);
    else if( mario1.getBlood() == 4 )
      text("* 4", 165, 30, 75, 75);
    else if( mario1.getBlood() == 3 )
      text("* 3", 165, 30, 75, 75);
    else if( mario1.getBlood() == 2 )
      text("* 2", 165, 30, 75, 75);
    else if( mario1.getBlood() == 1 )
      text("* 1", 165, 30, 75, 75);
    else
      text("* 0", 165, 30, 75, 75);
}

void TurtleMove()
{
      // turtle move
    for( int cnt1 = 0; cnt1 < TurNum; cnt1++ ){///////////////////////// this part might be closed, it will affect the mario 
      if(turDir[cnt1] == 1)
      {
      if( turDir[cnt1] == 1 && turCanLeft( cnt1 ) == 1 )
      {
        someTur[cnt1].setX( someTur[cnt1].getX() - 1);
            for( int cnt = 0; cnt < 30; cnt++ ){
        if( mario1.getX() <= someTur[cnt1].getX() + 39 && mario1.getX() + 19 >= someTur[cnt1].getX() && mario1.getY() <= someTur[cnt1].getY() + 49 && mario1.getY() + 19 >= someTur[cnt1].getY() ){
          mario1.setBlood( mario1.getBlood() - 1 );
          println("\n", mario1.getBlood());
          mario1.setX(180);
          mario1.setY(100);
          break;   
          }
      }
      }
      else
      {
        turDir[cnt1] = 2; 
        
      }
      }
      if(turDir[cnt1] == 2)
      {
      if( turDir[cnt1] == 2 && turCanRight( cnt1 ) == 1 )
      {
        someTur[cnt1].setX( someTur[cnt1].getX() + 1);
            for( int cnt = 0; cnt < 30; cnt++ ){
        if( mario1.getX() <= someTur[cnt1].getX() + 39 && mario1.getX() + 19 >= someTur[cnt1].getX() && mario1.getY() <= someTur[cnt1].getY() + 49 && mario1.getY() + 19 >= someTur[cnt1].getY() ){
          mario1.setBlood( mario1.getBlood() - 1 );
          println("\n", mario1.getBlood());
          mario1.setX(180);
          mario1.setY(100);
          break;   
          }
      }
      }
      else
      {
        turDir[cnt1] = 1; 
      }
      }////////////////////////////////////////////////////////////
    }

    
}
void GhostChase()
{
  // ghost chase
    for( int cnt1 = 0; cnt1 < GhostNum; cnt1++ ){
      if( someGho[cnt1].getX() > mario1.getX() )
        someGho[cnt1].setX( someGho[cnt1].getX() - random( 0.1 * ( cnt1 + 1 ) ) );
      if( someGho[cnt1].getX() < mario1.getX() )
        someGho[cnt1].setX( someGho[cnt1].getX() + random( 0.1 * ( cnt1 + 1 ) ) );
      if( someGho[cnt1].getY() > mario1.getY() )
        someGho[cnt1].setY( someGho[cnt1].getY() - random( 0.1 * ( cnt1 + 1 ) ) );
      if( someGho[cnt1].getY() < mario1.getY() )
        someGho[cnt1].setY( someGho[cnt1].getY() + random( 0.1 * ( cnt1 + 1 ) ) );
      for( int cnt = 0; cnt < 30; cnt++ ){
        if( mario1.getX() <= someGho[cnt1].getX() + 29 && mario1.getX() + 9 >= someGho[cnt1].getX() && mario1.getY() <= someGho[cnt1].getY() + 29 && mario1.getY() + 9 >= someGho[cnt1].getY() ){//////////////( 39, 19 ), ( 49, 19 ) >> ( 29, 9 ), ( 29, 9 )
          mario1.setBlood( mario1.getBlood() - 1 );
          mario1.setX(180);
          mario1.setY(100);
          gameState = 2;
          break;   
        }
      }
    }
}