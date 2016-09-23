class Arrow
{
int x;
int y;
int w=20;
int h=10;
int direction;
boolean hit;
PImage upArrow;
PImage downArrow;
PImage rightArrow;
PImage leftArrow;

Arrow(int xp, int yp, int d)
 {
 x=xp;
 y=yp;
 direction=d;
 upArrow=loadImage("ArrowUp.png");
 downArrow=loadImage("ArrowDown.png");
 rightArrow=loadImage("ArrowRight.png");
 leftArrow=loadImage("ArrowLeft.png");
 hit=false;
 }
 
 Arrow()
 {
 x=-100;
 y=-100;
 direction=1;
 upArrow=loadImage("ArrowUp.png");
 downArrow=loadImage("ArrowDown.png");
 rightArrow=loadImage("ArrowRight.png");
 leftArrow=loadImage("ArrowLeft.png");
 hit=true;
 }
 
 void display()
 {  
   if(!hit)
   { 
    
 if(direction==0)
 {
 image(leftArrow,x,y);
 }
 else if(direction==1)
 { 
 image(upArrow,x,y);
 }
 else if(direction==2)
 { 
 image(downArrow,x,y);
 }
 else if(direction==3)
 { 
 image(rightArrow,x,y);
 }
   }
 }
 
 void move()
 {
   if(!hit)
   {
 if (direction==0)
 {
 x-=4;
 if(arrowCheckwall())
  {
   hit=true;
  }
 }
 
 if (direction==1)
 {
 y-=4;
 if(arrowCheckwall())
  {
   hit=true;
  }
 }
 
 if (direction==2)
 {
 y+=4;
 if(arrowCheckwall())
  {
   hit=true;
  }
 }
 
 if (direction==3)
 {
 x+=4;
 if(arrowCheckwall())
  {
   hit=true;
  }
 }
   }
 }
 
 
 boolean arrowCheckwall()
{
boolean check= false;
for(int i=0; i<wall.length;i++)
{
if(wall[i].getLocation(x,y,w,h))
 {
 check =true;
 }
}
return check;
}
 
int hitByArrow(int xp, int yp, int wp, int hp)
{
  if (!hit)
  {
if(x+(wp+w)/2>xp&&x-(wp+w)/2<xp)
{
if(y+(hp+h)/2>yp&&y-(hp+h)/2<yp)
{
hit=true;
if(!shieldArrow(x,y))
{
 hitArrow();
 return 25;
}
}

}
  }
return 0;
}

 
 


}


