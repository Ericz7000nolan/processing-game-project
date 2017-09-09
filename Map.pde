void generateMap()
{
  for( int cnt = 0; cnt < 30; cnt++ ){
   base[cnt] = new Block( 90 + cnt * 50, 365 );
 }
 for( int cnt = 30; cnt < 32; cnt++ ){
   base[cnt] = new Block( 1450+(cnt-30)*50, 300 );
 }
 for( int cnt = 32; cnt < 195; cnt++ ){
   base[cnt] = new Block( 90 + cnt * 50, 365 );
 }
 for( int cnt = 201; cnt < 230; cnt++ ){
   base[cnt] = new Block( 90 + cnt * 50, 365 );
 }
 for( int cnt = 230; cnt < 236; cnt++ ){
   base[cnt] = new Block( 1200 + (cnt-230)*50, 150 );
 }

 for( int cnt = 0; cnt < 3; cnt++ ){
   someGho[cnt] = new Ghost( 300 + cnt * 600, 300 );
 }
 for( int cnt = 0; cnt < 2; cnt++ ){////////////////////////////////////////////////////
   someTur[cnt] = new Turtle( 600 + 200 * cnt, 330 );
 } 
 someTur[2] = new Turtle( 1000, 330 );
 someTur[3] = new Turtle( 1800, 330 );
 someTur[4] = new Turtle( 2300, 330 );
 
 base[195] = new Block( 240, 280);/////////////////////////////////////45
 base[196] = new Block( 390, 220);/////////////////////////////////////45
 base[197] = new Block( 540, 160);/////////////////////////////////////45
 base[198] = new Block( 540, 340);
 base[199] = new Block( 840, 340);
 base[200] = new Block( 40,340);
 
 for( int cnt = 236; cnt < 241; cnt++ ){
    base[cnt] = new Block( 2200+(cnt-236)*50,340-(cnt-236)*25);
 }
 for( int cnt = 241; cnt < 246; cnt++ ){
    base[cnt] = new Block( 2550+(cnt-241)*50,240+(cnt-241)*25);
 }
 
 for( int cnt = 246; cnt < 247; cnt++ ){
    base[cnt] = new Block( 2900,340);
 }
 for( int cnt = 247; cnt < 249; cnt++ ){
    base[cnt] = new Block( 2950,340-(cnt-247)*25);
 }
 for( int cnt = 249; cnt < 252; cnt++ ){
    base[cnt] = new Block( 3000,340-(cnt-249)*25);
 }
 for( int cnt = 252; cnt < 256; cnt++ ){
    base[cnt] = new Block( 3050,340-(cnt-252)*25);
 }
 for( int cnt = 256; cnt < 261; cnt++ ){
    base[cnt] = new Block( 3150,340-(cnt-256)*25);
 }
 for( int cnt = 261; cnt < 267; cnt++ ){
    base[cnt] = new Block( 3200,340-(cnt-261)*25);
 }
 for( int cnt = 267; cnt < 274; cnt++ ){
    base[cnt] = new Block( 3250,340-(cnt-267)*25);
 }
 for( int cnt = 274; cnt < 282; cnt++ ){
    base[cnt] = new Block( 3350,340-(cnt-274)*25);
 }

 
 

 
 tube[0] = new Tube(1000,280);
 tube[1] = new Tube(1100,280);
 tube[2] = new Tube(1200,280);
 tube[3] = new Tube(1700,280);
 tube[4] = new Tube(1900,280);
 for( int cnt = 0; cnt < mazeWidth ; cnt++ )
   for( int cnt1 = 0; cnt1 < 1200; cnt1++ )
     maze[cnt][cnt1] = 0;
     
 for( int cnt = 0; cnt < blockNum; cnt++ ){//////////////////////////////////45
   generateBlock(base[cnt].getX(),base[cnt].getY(),50,25);}
   
    for( int cnt = 0; cnt < TubeNum; cnt++ ){//////////////////////////////////45
   generateBlock(tube[cnt].getX(),tube[cnt].getY(),75,100);}
       
}
void generateBlock(int x,int y,int w,int h)
{
  for(int i =x;i<x+w;i++)
    for(int j=y;j<y+h;j++)
       maze[i][j] = 1;
}   