
 float xPos,yPos;
 float eyeX, eyeY;
 float mouth=0;
 float open = 0.05;
 int radius = 50;
 final int ballSize =20;
 //final int numBalls = 150;
 final int numRect = 5;
 float ballX, ballY;
 float [] rectX = new float [numRect];
 float [] rectY= new float [ numRect]; 
 //float [] ballX= new float[numBalls];
 ///float [] ballY= new float[numBalls];
 int score = 0;
 int col;
 int row;
 int speed;
 int speed2;
 void setup() {
   size(600,600);
   xPos= 30;
   yPos= 550;
   eyeX = 42;
   eyeY= 535;
   //for(int i= 0; i<numBalls; i++){
     //ballX[i]= random(30,580);
     //ballY[i]= random (30,550);
     for (int i=0; i<numRect; i++)
     {
     rectX [i]= random(30,570);
     rectY[i] = random (50,570);
     }
     speed= 1;
     speed2= 1;
  
   //}
 }

 
void keyPressed() {
//if(key==CODED) 
//{
  if(key =='w'){
   // pushMatrix();
    //translate(xPos, yPos);
    //rotate(degrees(90));
  
     //fill(#FFFF00);
 //mouth += open;
  //if (mouth > .6 || mouth < .05) {
   // open = open * -1;}
    
   
  
   //arc(xPos, yPos, radius, radius, mouth, TWO_PI - mouth);
      //fill(0);
  // ellipse(eyeX,eyeY,8,8);
 // popMatrix();
  yPos= yPos -10;
  eyeY= eyeY-10;
}
  
  else if(key =='s'){
    yPos= yPos+10;
    eyeY= eyeY+10;}
  
  else if(key =='d'){
    xPos= xPos+10;
    eyeX= eyeX+10;}
  
  else if(key =='a'){
    xPos= xPos-10;
    eyeX= eyeX-10;}
  
  }
  
//}
   
 void draw(){
   background(0);
   fill(255,0,0);
   textSize(20);
   text("Score:",490,50);
      text(score, 550,50);
   //fill(255,255,0);
   //noStroke ();
   //ellipse(30,550,50,50);
   
   //fill(0);
   //triangle(30,550,200,500,200,600);
   
   //fill(0);
  // ellipse(42,535,8,8);

  fill(255);
  //for(int i= 0; i<numBalls; i++){ 
    for(int row= 0; row<15; row=row+1)
    {
      for (int col=0; col<15; col = col+1)
    {
   ballX= 20+col*40;
    ballY= 20 +row*40;
    
    circle(ballX, ballY, ballSize);
    //if (xPos == ballX|| yPos==ballY){
     //score= score+1;
      //fill(0);
      //circle(ballX+col*40, ballY+row*40, ballSize);
    //}
    //else{
      //circle(ballX+col*40, ballY+row*40, ballSize);
   // }
      eat(ballX,ballY);
    }

    }
    for (int i=0; i<numRect; i++)
     {
       fill(255,0,0);
       rect(rectX[i],rectY[i],30,30);
       fill (0);
       circle(rectX[i]+10, rectY[i]+10,10);
       circle(rectX[i]+22,rectY[i]+10,10);
       line(rectX[i]+5, rectY[i]+22,rectX[i]+27, rectY[i]+22);
       rectX[i]= rectX[i] + speed;
       rectY[i]= rectY[i]+ speed2;
       if( rectX[i] > 570){
         speed= -speed;
         
       }
       
     if( rectX[i] < 30){
         speed= -speed;
      
     }
     if (rectY[i]>570){
       speed2= -speed2; 
     }
     
     if (rectY[i]<30){
       speed2= -speed2; 
     }
        collision(rectX[i], rectY[i]);
     }
 

   
  //fill(255);
  //for (int i = 20; i < width; i += 40) {
    //if(xPos + radius / 2 < i) {
      //ellipse(i,60,10,10);
    //}
 //}
   fill(#FFFF00);
 mouth += open;
  if (mouth > .6 || mouth < .05) {
    open = open * -1;}
    
   
  
   arc(xPos, yPos, radius, radius, mouth, TWO_PI - mouth);
      fill(0);
   ellipse(eyeX,eyeY,8,8);
   

   
  //if (xPos==ballX && yPos==ballY){
    //fill(0);

    //circle(ballX,ballY,ballSize);
    //score= score + 1;
    //println (score);
  //}
  
      
   }
   
void collision(float x , float y){
  //if /dist(xPos, yPos, x, y) < radius|| dist(xPos, yPos, x, y) < TWO_PI -mouth){
    if(dist(xPos, yPos, x, y) < TWO_PI -mouth+15){
   fill(255,0,0);
   textSize(100);
      textAlign(CENTER, CENTER);
      text("GAME OVER!", width/2, height/2);
      frameRate(0);
      
  }
  }
void eat(float x, float y){
    if(dist(xPos, yPos, x, y) < TWO_PI -mouth+ ballSize){
     score= score+1;
      fill(0);
     //circle(ballX,ballY,ballSize);
     //circle(ballX+col*40, ballY+row*40, ballSize);
    }
    
}
