int r,g,b;
Particle [] Normal = new Particle[1000];
Particle [] Jumbo = new Particle[50]; 
Particle [] Odd = new Particle[50]; 
void setup()
{
  size(1000,1000);
  for(int a=0; a<Normal.length;a++){
    Normal[a] = new NormalParticle();
  }
  for(int a=0; a<Jumbo.length;a++){
   Jumbo[a] = new JumboParticle();
  }
  for(int a=0; a<Odd.length;a++){
   Odd[a] = new OddballParticle();
  }
}
//-----------------------------------------------------
void draw()
{
  background(0);
  for(int a=0; a<Normal.length;a++){
  Normal[a].move();
  Normal[a].show();
  }
  for(int a=0; a<Jumbo.length;a++){
  Jumbo[a].move();
  Jumbo[a].show();
  }
  for(int a=0; a<Odd.length;a++){
  Odd[a].move();
  Odd[a].show();
  }
}
//-------------------------------------------------------
interface Particle
{
  public void move();
  public void show();
}
//-----------------------------------------------------
class NormalParticle implements Particle
{
  double locX, locY, speed, sizeS, size, angle;
  NormalParticle(){
  locX = 500;
  locY = 500;
  angle = (Math.random()*360);
  speed = (Math.random()*5);
  sizeS = ((Math.random()*5)+10);
  size=sizeS;
  }
  public void move()
  {
   speed = speed - .025;
   size = size -.025;
   locX = locX + Math.cos(angle)*(speed);
   locY = locY + Math.sin(angle)*(speed); 
   if(locX<-250||locX>1250||locY<-250||locY>1250){
  locX = 500;
  locY = 500;
  angle = (Math.random()*360);
  speed = ((Math.random()*5)+2);
  size=sizeS;
   }
   
  }
  public void show()
  { 
  r=mouseX/4;
  g=mouseY/4;
  b=(mouseX*mouseY)/1000;
  stroke(r,g,b);
  fill(r,b,g,b);
  ellipse((float)locX,(float)locY,(float)size,(float)size);
  }
}
//-----------------------------------------------------
class OddballParticle implements Particle
{
  double locX, locY, speed, size, angle, rotNum;
  OddballParticle(){
  locX = 500;
  locY = 500;
  angle = (Math.random()*360);
  speed = (Math.random()*5);
  rotNum = 0;
  size = ((Math.random()*5)+10);
}
public void move()
  {
   speed = speed - .025;
   size = size -.025;
   locX = locX + Math.cos(angle)*(speed);
   locY = locY + Math.sin(angle)*(speed); 
   rotNum = rotNum+0.001;
   if(locX<-250||locX>1250||locY<-250||locY>1250){
  locX = 500;
  locY = 500;
  angle = (Math.random()*360);
  speed = ((Math.random()*5)+2);
  size=((Math.random()*5)+10);
   }
   
  }
  public void show()
  {  
  translate(500, 500);
  stroke(mouseX/4,mouseY/4,(mouseX*mouseY)/1000);
  fill(mouseX/4,(mouseX*mouseY)/4000,mouseY/4,(mouseX*mouseY)/1000);
  rotate((float)rotNum);
  ellipse(mouseX,mouseY,(float)size,(float)size);
  }
}
////-----------------------------------------------------
class JumboParticle extends NormalParticle
{
  JumboParticle(){
  sizeS = 50;
  }
}
