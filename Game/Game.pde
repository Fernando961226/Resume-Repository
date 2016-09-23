int x=100;
int y=100;
int x3=340;
int y3=60;
int w=25;
int h=40; 
int health=1000;
int lockDamage=0;
int lockMove=0;
String LoseMessage="Sorry you Lost \nPlease press t to restart the game";
String WinMessage="Congratulations! You Won! \nPress t to restart the game ";
String healthText="Health: "+str(health)+"/1000";
int HED; 
int countLevel=-1;
int [][] xywalls= {{ 0 , 0 , 680, 20, 0 , 0 , 20, 480, 680, 480, 660, 0, 680, 0, 680,460,0,480,680,460, 20, 220, 280, 260, 320,20,360,180, 400,220,660,260,  320, 300,360,460},
                   {0 , 0 , 680, 20, 0 , 0 , 20, 480, 680, 480, 660, 0, 680, 0, 680,460,0,480,680,460, 20,220, 280, 260, 400,220,660,260},
                   { 0 , 0 , 680, 20, 0 , 0 , 20, 480, 680, 480, 660, 0, 680, 0, 680,460,0,480,680,460,20,20,310,210,660,20,370,210,20,460,310,270, 370,270,660,460},
                 {200,200,250,250,300,100,350,150,300,200,350,250,300,300,350,350,400,200,450,250, 0 , 0 , 680, 20, 0 , 0 , 20, 480, 680, 480, 660, 0, 680, 0, 680,460,0,480,680,460},
                 {0 , 0 , 680, 20, 0 , 0 , 20, 480, 680, 480, 660, 0, 680, 0, 680,460,0,480,680,460, 275,175,315,305,315,305,405,265,405,265,365,175,365,175,275,215}};
                 
//                x   y   x2  y2/ 2x  2y 2x2 2y2/3x  3y  3x2 3y2/4x  4y 4x2 4y2/ 5x 5y  5x2  5y2d 6x  6y  6x2, 6y2 7x  7y  7x2  7y2  8x  8y    9x  9y  
//                0   1   2   3   4   5   6   7   8   9   10  11  12  13  14  15 16 17  18   19   20  21  22   23  24  25  26  27   28  29   30  31  32   33 34   35


//200,200,250,250,300,100,350,150,300,200,350,250,300,300,350,350,400,200,450,250, 0 , 0 , 680, 20, 0 , 0 , 20, 480, 680, 480, 660, 0, 680, 0, 680,460,0,480,680,460

Walls [] wall= new Walls[xywalls[0].length/4];


int [][] xyEnemies={{100,200},
           {100,400,200,400,300,400},
           {40,240,640,240,340,430},
   {100,200,500,400,500,100,500,200,100,400},
 {340,240}};
Enemy [] enemies= new Enemy[xyEnemies[0].length/2];
//500,400,500,100,500,200,100,400
int EnemyCount=0;

Arrow[] arrows=new Arrow[100];
 int ArrowCount=0;
color c=color(255,0,0);
char direction='s';

boolean Menu=true;
PImage back;
PImage front;
PImage rigth;
PImage left;
PImage Darkback;
PImage Darkfront;
PImage Darkright;
PImage Darkleft;
PImage upSword;
PImage downSword;
PImage rightSword;
PImage leftSword;
PImage MenuImage;
PFont sampleFont;

void setup()
{
 
  
  frameRate(60);
size(850,480);
smooth();
back = loadImage("backguy.png");
front= loadImage("frontguy.png");
rigth = loadImage("rightsideguy.png");
left = loadImage("leftsideguy.png");

Darkback=loadImage("DarkBack.png");
Darkfront=loadImage("DarkFront.png");
Darkright=loadImage("DarkRightSide.png");
Darkleft=loadImage("DarkLeftSide.png");

upSword= loadImage("SwordUp.png");
downSword= loadImage("SwordDown.png");
rightSword= loadImage("SwordRight.png");
leftSword= loadImage("SwordLeft.png");
MenuImage=loadImage("Menu.png");

 sampleFont=loadFont("AngsanaNew-Bold-48.vlw");
 textFont(sampleFont);
 textAlign(CENTER,CENTER);
}

void draw()
{
  if(Menu)
  {
  imageMode(CENTER);
  image(MenuImage,340,240,680,480);
  }
  else if(health<=0)
  {
  Lose();
  }
  
  else{
  
  
  if(EnemyCount==0)
  {
    LoadLevel();

  }
  
  
  
background(255);

if(countLevel==4)
  {
  Win();
  }

for(int i=0; i<wall.length;i++)
{
wall[i].displayRect();
}
square();


if(lockMove>0)
 {
 hitMove();
 lockMove--;
 }
 else
 {
 move();
 }


for(int i=0; i<enemies.length;i++)
{
enemies[i].display();
enemies[i].move(x,y);
 if(lockDamage==0)
 {
 health-=enemies[i].enemyDamage(x,y);
 }
ArrowCount=enemies[i].throwArrow(ArrowCount);
}
 
 if(ArrowCount>99)
 {
   ArrowCount=0;
 }
 
 for(int i=0; i<arrows.length;i++)
 {
   
 arrows[i].display();
 arrows[i].move();
  if(lockDamage==0)
 {
  health-=arrows[i].hitByArrow(x,y,w,h);
 
 }

 }
 

 if(lockDamage>0)
 {
 lockDamage--;
 }
 
 attack();


  }
  fill(#3FF049);
  rectMode(CORNERS);
  rect(680,0,850,480);
  healthText="Health: "+str(health)+"/1000";
   textSize(20);
   fill(#050000);
 text(healthText,765,40);
}

void square()
{
  imageMode(CENTER);
  if(lockDamage==0)
  {
 if(direction=='w')
 {
 image(back, x, y);
 }
 else if(direction=='s')
 {
  image(front, x, y);
 }
  else if(direction=='a')
 {
  image(left, x, y);
 }
  else if(direction=='d')
 {
  image(rigth, x, y);
 }
  }
else
{
if(direction=='w')
 {
 image(Darkback, x, y);
 }
 else if(direction=='s')
 {
  image(Darkfront, x, y);
 }
  else if(direction=='a')
 {
  image(Darkleft, x, y);
 }
  else if(direction=='d')
 {
  image(Darkright, x, y);
 }

}
}

void move()
{
  
if(key=='w'&&keyPressed)
 {
  y-=2;
  direction='w';
   while(checkwall())
   {
     
   y++;
   }
 }
 if(key=='s'&&keyPressed)
 {
   y+=2;
   direction='s';
   while(checkwall())
   {
     
   y--;
   }
 }
 if(key=='a'&&keyPressed )
 {
 x-=2;
 direction='a';
   while(checkwall())
   {
     
   x++;
   }
 }
 if(key=='d'&&keyPressed)
 {
 x+=2;
 direction='d';
  while(checkwall())
  {
   
  x--;
  }
 }
}

boolean checkwall()
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

void hit(int dE)
{
lockDamage=30;//lock damage
lockMove=10; //lock movement
HED=dE;
}

void hitArrow()
{
lockDamage=30;
}
void hitMove()
{
 if(HED==0)
 {
 x-=5;
 if(checkwall())
   {
   x+=5;
   }
 }
 if(HED==1)
 {
 y-=5;
 if(checkwall())
   {
   y+=5;
   }
 }
 if(HED==2)
 {
 y+=5;
 if(checkwall())
   {
   y-=5;
   }
 }
 if(HED==3)
 {
 x+=5;
 if(checkwall())
   {
   x-=5;
   }
 }
}

void attack()
{
  if(keyPressed&&key=='k')
  {
for(int i=0; i<enemies.length;i++)
{
  if (direction=='d')
enemies[i].getDamage((x-25/2),(y-15),(x+1.5*25),(y+15),direction);

else if(direction=='a')
enemies[i].getDamage((x+25/2),(y-15),(x-1.5*25),(y+15),direction);
else if(direction=='w')
enemies[i].getDamage((x+25/2),(y+15),(x-25/2),(y-60),direction);
else 
enemies[i].getDamage((x+25/2),(y-15),(x-25/2),(y+60),direction);
}
if(direction=='w')
{
  imageMode(CENTER);
image(upSword,x,y-45);
}
else if(direction=='s')
{
image(downSword,x,y+45);
}
else if(direction=='a')
{
image(leftSword,x-25,y);
}
else if(direction=='d')
{
image(rightSword,x+25,y);
}

}
}

boolean shield(int xp, int yp,int i)
{
   boolean shield=false;
   if(keyPressed && key=='l')
   {
     
 if(xp-x>0&&-1*(xp-x)<(yp-y)&&(yp-y)<(xp-x))
   { if(direction=='d')
    {
     enemies[i].hitByShield('d');
     shield=true;
     lockMove=2;
     HED=0;
    }
   }
  else if(xp-x<0&&-1*(xp-x)>(yp-y)&&(yp-y)>(xp-x))
  {if(direction=='a')
   {
  enemies[i].hitByShield('a');
  shield=true;
  lockMove=2;
  HED=3;
   }
  }
 else if(yp-y<0 &&(yp-y)<(xp-x)&&(xp-x)<-1*(yp-y))
 {if(direction=='w')
  {
  enemies[i].hitByShield('w');
  shield=true;
  lockMove=2;
  HED=2;
  }
 }
  
  else if(direction=='s')
   {
   enemies[i].hitByShield('s');
   shield= true;
   lockMove=2;
   HED=1;
   }
   }
  
  
  return shield;
  
}

boolean shieldArrow(int xp, int yp )
{
boolean shield=false;
   if(keyPressed && key=='l')
   {
     
 if(xp-x>0&&-1*(xp-x)<(yp-y)&&(yp-y)<(xp-x))
   { if(direction=='d')
    {
     shield=true;
    }
   }
  else if(xp-x<0&&-1*(xp-x)>(yp-y)&&(yp-y)>(xp-x))
  {if(direction=='a')
   {
  shield=true;
   }
  }
 else if(yp-y<0 &&(yp-y)<(xp-x)&&(xp-x)<-1*(yp-y))
 {if(direction=='w')
  {
  shield=true;
  }
 }
  
  else if(direction=='s')
   {
   shield= true;
   }
   }
  
  
  return shield;
  

}
void reduceEnemyCount()
{
EnemyCount-=1;
println("reduce");
}

void LoadLevel()
{
   countLevel++;
   
wall= new Walls[xywalls[countLevel].length/4];
 enemies= new Enemy[xyEnemies[countLevel].length/2];
for(int i=0; i<xywalls[countLevel].length;i+=4) 
{
 wall[i/4]= new Walls(xywalls[countLevel][i],xywalls[countLevel][i+1],xywalls[countLevel][i+2],xywalls[countLevel][i+3],c);
 }
 
for (int i=0;i < xyEnemies[countLevel].length;i+=2)
 {
enemies[i/2]= new Enemy(xyEnemies[countLevel][i],xyEnemies[countLevel][i+1],i/2);
 }
 
 for(int i=0;i < arrows.length;i++)
 {
 arrows[i]=new Arrow();
 }
 if(countLevel==2)
 {
   x=x3;
   y=y3;
 }
 else
 {
 x=100;
 y=100;
 }
 EnemyCount=xyEnemies[countLevel].length/2;

}
void Lose()
{ rectMode(CENTER);
fill(#0728F2);
 rect(340,240,400,80);
   textSize(40);
   fill(#050000);
 text(LoseMessage,340,240);
}
void Win()
{

 
   textSize(40);
   fill(#050000);
 text(WinMessage,340,340);
}
void resetGame()
{
 countLevel=-1;
 health=1000;
 EnemyCount=0;
 lockDamage=0;
 lockMove=0;
}

void keyPressed()
{
 if(key=='m')
 {
 Menu=!Menu;
 
 }
 if(key=='t'&&(health<=0||countLevel==4))
 {
  resetGame();
 }


}





