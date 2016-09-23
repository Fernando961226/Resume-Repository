class Enemy
{
int x; // x position of the enemy
int y; // y position of the enemy
int w=25; // width of the enemy
int h=40; // height of the enemy
int direction; // the direction that the enemy is facing. 0 left 3 right 1 up 2 bottom
int health; // health of the enemy
int amount=0;  //amount is the amount of pixels the enemy has to move in one direction
 int count=0; // this variables is used so the enemy can path fine the main player. it will be explain later.
PImage back; // the variable for the image of the back of the enemy
PImage front; // the variable for the image of the front of the enemy
PImage rigth; // the variable for the image of the right side of the enemy
PImage left; // the variable for the image of the left side of the enemy

int lockDamage=0;// makes so the enemy cant take damage for a certain time
                // example if lockDamage=30 then the enemy can't take damage for half a second
int lockMove=0;// this lock movement for a certain time. 
               //example if lockMove=30 then the enemy can't take move for half a second
               
char playerDirection;// this field hold the direction which the player is facing

int countI;// countI is a number, this number is tells which enym this is.
           // all the enemies are hold in the array Enemy [] enemies. countI is the position in the array in which the enemy is hold
           // example if countI = 0 then the program is refering to the first enemy in the array and if countI= 5 is refering to the 6 enemy in my array 

// constructor method for the enemy
Enemy(int xp,int yp, int ip)
{
 x=xp; // xp is the x position of the enemy, which is transfer to x
 y=yp; // yp is the y position of the enemy, which is transfer to yc
 health =2000; // the amount of health the enemy has
 countI=ip;// ip is the position of the enemy in the array Enemy[] enemies
 back = loadImage("DarknutBackSide.png"); // load the image of the back of the enemy
front= loadImage("DarknutFrontSide.png"); // load the image of the front of the enemy
rigth = loadImage("DarknutRightSide.png"); // load the image of the right side of the enemy
left = loadImage("DarknutLeftSide.png"); // load the image of the left side of the enemy
}

// method that moves the enemy
void move(int xp, int yp)
{ 
   if(health>0)// if health is less or equal to zero then the enemy can't move
   {
   
    //lockMove is bigger than zero then the enemy will not move
  if(lockMove<1)
  {
  // if the distance between the enemy and the main character is less than 200 pixels
  // the enemy will start to chase the hero.
  if(dist(xp,yp,x,y)<200)
  {
    
   // x-xp is the difference in x values between the main character and the enemy.
  // example if the main character is at (200,300) and the enemy at (500,300)
 // x-xp equals 500-200= 300. therefore the enemy is 300 pixels to the right of main character 
 // it is to the right since x-xp is positive if it was negative it would be to the left.
 // if x-xp does not equal zero count =0 else count =1
  if ((x-xp)!=0)
  {count=0;}
    else
  count=1;
  // if x-xp is bigger than zero the enemy is to the right of the main character
  // therefore the enemy has to move left if it wants to chase the main character
  if ((x-xp)>0)
  {
  x--;// move the enemly left
  direction=0; // changes the direction that the enemy is facing to the left
  
   if (checkwalls()) // if check walls is true, the enemy has enter a wall
        {
        x++; // we move the enemy right to get it out of the wall
        count=1; // we make counter one, this makes it so the y movement of the enemy is activated
                 // so instead of moving in the x plane it moves int the y plane until it doesnt crashes into a wall
        }
  }
  else if(x-xp<0)
  {
    x++; //if x-xp is less than zero the enemy is to the left of the main character
  // therefore the enemy has to move right if it wants to chase the main character
    direction=3; // changes the direction that the enemy is facing to the right
    
   if (checkwalls()) // if check walls is true, the enemy has enter a wall
        {
        x--; // we move the enemy right to get it out of the wall
        count=1; // we make counter one, this makes it so the y movement of the enemy is activated
        }            // so instead of moving in the x plane it moves int the y plane until it doesnt crashes into a wall
  }
   // if count = 1 these mean that the enemy is exactly on top or below the enemy becuase their differences in the x values is zero
   // or the enemy is crashing into a wall thus it can not keep moving in the x plane, thus it will move in the y plane
   // y-yp is the difference is in the y value of the enemy and the main character.
   // example if enemy is at (200,300) and the main character is at (100,100)
   // y-yp equals 300-100= 200 thus the enemy is 200 pixels below the main character
   // if y-yp is positive the enemy is below the main character and if it is positive it is above the main character.
   // since the y-yp is positive the enemy has to move up in order to get to the main character
   if(y-yp>0&&count==1) 
   {
    y--; // move the enemy up
    direction=1; // change the direction that the enemy is facing to be facing up
   if (checkwalls()) // if checkwalls() is true the enemy has gone into a wall
        {
        y++; // move the enemy down to get him out of the wall
        }
  }
  // since y-yp is negative the enemy is on top of the character.
  else if(y-yp<0&&count==1)
  {
  y++;// move the enemy down 
  direction=2;// change the direction that the enemy is facing to be looking down
   if (checkwalls()) // if checkwalls() is true the enemy gone into a wall
        {
        y--; //move the enemy down so it is out of the wall.
       }
  }
}
  
  
  // if the distance between the main character and the enemy is more than 200 pixels, then the enemy will move randomly.
  else
  {
    // if amount is less or equal to zero, a new amount is chosen 
    // this can vary from 50 to 100
    // also a new direction is chosen of movement is chosen
    // example amount = 50 and direction =0; 
    //the enemy will move 50 pixels to the left and when it is done it will chose an new amount and a new direction
 if(amount<=0)
 {
   // randome goes from 50 to 101 but in really the biggest number it can produce is 100
   // same with random 0 to 4 the biggest number is 3
 amount=int(random(50,101));
 direction=int(random(0,4));
 }
 // if amount is bigger than 0
  if(amount>0)
  {
    // if direction equals 0 then move the enemy one pixel left
    if (direction==0)
    {
     x--; // move enemy left
     
     // if chechwall() is true the enemy is inside a wall
     // thus the enemy has to change direction and amount again
      if (checkwalls()) 
        {
        x++; // move the enemy right so it is outside the wall
        amount=0; // we force the program to chose a new amount and direction by making amount =0;
        } 
   }
    // if direction equals 1 then move the enemy one pixel up
   else if(direction==1)
   {
    y--;// move enemy up
     // if chechwall() is true the enemy is inside a wall
     // thus the enemy has to change direction and amount again
      if (checkwalls())
        {
        y++; // move the enemy down so it is outside the wall
        amount=0; // we force the program to chose a new amount and direction by making amount =0;
        } 
   }
     // if direction equals 2 then move the enemy one pixel down
    else if(direction==2)
   {
    y++;// move enemy down
    // if chechwall() is true the enemy is inside a wall
     // thus the enemy has to change direction and amount again
      if (checkwalls())
        {
        y--; // move the enemy up so it is outside the wall
        amount=0; // we force the program to chose a new amount and direction by making amount =0;
        } 
   }
   // if direction equals 2 then move the enemy one pixel right
    else if(direction==3)
   {
    x++; // move enemy right
    // if chechwall() is true the enemy is inside a wall
     // thus the enemy has to change direction and amount again
      if (checkwalls())
        {
        x--; // move the enemy left so it is outside the wall
        amount=0; // we force the program to chose a new amount and direction by making amount =0;
        } 
   }
   amount--; // reduce amount by one since the enemy has move one pixel
   }
 }
}
// if the program got to this else this means lockMove is bigger than Zero
else 
{
  // calls the method hitMove
  // this method just moves the enemy 10 pixel away of the sword of the main character
  hitMove();
  // reduce lockMove by one since we already move the enemy and one frame has already happen
  //basically lockMove is going to lcok movement for a certain amount of frame if lockMove is 30 the is going to lock it for 30 frames
  // thus we have to reduce lockMove every time that one frame has happen
lockMove--;
}
}
}

// displays the enemy
void display()
{
  // if healt is less or equal zero then the enemy is not going to be display
  if(health>0) 
  {
  
  // changes the imageMode to center
imageMode(CENTER);
// if direction equals 1 the back image will be display.
 if(direction==1)
 {
 image(back, x, y);
 }
 // if direction equal 2 the front image will be display
 else if(direction==2)
 {
  image(front, x, y);
 }
 // if direction equals 0 the left image will be display
  else if(direction==0)
 {
  image(left, x, y);
 }
 // if direction equals 3 the right image will be display
  else if(direction==3)
 {
  image(rigth, x, y);
 }
  }
}

// this method checks to see if the enemy has gotten in side any wall.
// if this is the case, it send the variable check as true
// if the enemy is not inside the wall, it send check as false.

boolean checkwalls()
{
  // variable that will be send.
boolean check= false;

// this for loop run  as many times as there are walls.
// example if there are 20 walls it will ran 20 times.
for(int i=0; i<wall.length;i++)
{
  // the getLocation method is a method inside the class Walls, 
  // that determines if the enemy is inside a particular wall
  
if(wall[i].getLocation(x,y,w,h)) 
 { 
check =true;
 }
}
// if any in any of the times the for loop ran getLocation was true
// check will become true. if all of the times it ran were false
// check will remain false.

// send check;
return check;
}

// this method gives damage to the player when the main character
// is hit by an enemy

int enemyDamage(int xp, int yp)
{
   int damage=0;
   // xp, and yp are the x and y poisition of the main character
   
   // again if health is less or equal to zero then the enemy would not be able to give damage to the player because the next
   // code will not be able to run
  if(health>0)
  {
 
// the next 2 if statmenet check to see
// if the main character is touching the enemy.
 
 // this checks to see if xp inside the ranges of x+w and x-w nothing more. x-w<xp<x+w
 // we add or subtract width to x since we are countign the width of the enemy, so we should add or subtract w/2
 // however we also need to countenemyDamage( the width of the main character, thus we need to add or subtract w/2. 
 // thus we add or subtract w since w/2 + w/2=w
 if(x+w>xp && x-w<xp)
 {
   // we do the exact same thing for the y values.
   // we check to se if yp is inside the ranges of y+h and y-h. y-h<yp<y+h
   // like in the other if statement we add or subtract height 
   // since we are counting on the height of both objects.
  if(y+h>yp&&y-h<yp)
  {
  
  
  // the previous if statement check to see if the enemy hit the player but before we must check if the player shield the attack
  // the program calls the shield method and if it return true then the enemy hit the shield and the player doesn't recieve damage
   if( !shield(x,y,countI))
 {
  // if the player did not use the shield then we give 100 damage to the player
  // remeber that inroder for the shield to work it has to be facing the enemy
  damage=100;
  
  
  // the next pair of if statment check to see from where the attack happen
  // the the enemy hit me fromt the right side or from the top?
  // imagine an gigiant x which its arms extend to infinity
  // the center of the x is at the x and y position of the main character
  // the next if statment check to se if x and y position of the enemy is in between
  // the top left arm of the x and the bottom left arm to the x
  // in other words at the left side of the x.
  // we can create this x by creating the graphs y=x and y=-x;
  // then to see if the enemy is at left of the x
  // we plug  it x value into both equaltions and we see if the y value is in between the values that the 
  // equations  gives us. 
  // example (-10,3) y=x y=-10 y=-x y=10 3 is in between 10 and -10 thus it is on the left side of the x
  
  // however the x and y values of the enemy have to be relative to the x and y values of the main character
  // thus we subtract them to get the difference 
  //just to make this more simple x-xp will be the x values of the enemy and y-yp will be the y value of the enemy
  // the x will always be at (0,0)
  // the next if statement says if x>0 && -x<y && x>y
  // basically check to see if the enemy is at the right of main character
  // let go by an example x=10 and y =3
  // since x is bigger than 0 the enemy is at the right of the main character, but it could still be on top or at the bottom of him
  // just a little bit to the right
  // but since   -x<y<x -10<3<10 the program knows that the enemy hit the character from the rigth
  if(x-xp>0&&-1*(x-xp)<(y-yp)&&(y-yp)<(x-xp))
   {
     // we call the hit method and send 0
     // zero is the direction to the left
     // we send this direction since the main character is going to be moved to the left.
     hit(0);
 }
 
 // this if statmenst is like the other one but checks to see if the attack came from the left.
 // if x<0 && -x>y && x<y
 // example -10,3
 // -10<0 && 10>3 && -10<3 therefore the attack came from the left
   else if(x-xp<0&&-1*(x-xp)>(y-yp)&&(y-yp)>(x-xp))
   {
   // we call the hit method and send 3
     // 3 is the direction to the right
     // we send this direction since the main character is going to be moved to the right
   hit(3);
   }
   
  // this if statmenst is like the other one but checks to see if the attack came from the top.
  // y<0 && y<x && -y>x
  // example -25,5
  // y<0 -25<0 thus the enemy is on top of the main character
  //  y<x && -y<x -25<5 && 25>5 thus the attack came from  the top
   else if(y-yp<0 &&(y-yp)<(x-xp)&&(x-xp)<-1*(y-yp))
   {
     // we call the hit method and send 2
     // 2 is the down direction 
     // we send this direction since the main character is going to be moved down
     hit(2);
   }
   // if is not any of the cases above then the attack has to come from the bottom
   else
   {
     // we call the hit method and send 1
     // 1 is the up direction 
     // we send this direction since the main character is going to be moved up
     hit(1);
   }
  }
 }
 }
 
 
  }
 // we return damage to the main
 return damage;
}

// hitMove() move the enemy when it is hit. 
// playerDirection is the direction  from where the enemy was hit
// if playerDirection = a the direction of the hit came from the right
// thus the enemy must move left
// but not move into the wall
void hitMove()
{
  // if health is less or equal to zero then the hitMove method wil not do nothing
  if(health>0)
  {
    
//if playerDirection==a move the enemy left
if(playerDirection=='a')
 {
   // move the enemy left
 x-=5;
 // checkwalls check to see if the enemy is inside the wall
 // if it enemy is inside the wall, then we move it right to get it out
 while(checkwalls())
   {
  // move right the enemy, until it is out of the wall
   x+=5;
   }
 }
 // if playerDirection==w move the enemy down
 if(playerDirection=='w')
 {
   // move the enemy down
 y-=5;
 // checkwalls check to see if the enemy is inside the wall
 // if it enemy is inside the wall, then we move it down to get it out
 while(checkwalls())
   {
     // move up the enemy, until it is out of the wall
   y+=5;
   }
 }
 // if playerDirection== s
 if(playerDirection=='s')
 {
   // move the enemy uo
 y+=5;
 while(checkwalls())
   {
    // move down the enemy, until it is out of the wall   
   y-=5;
   }
 }
 // if playerDirection == d move enemy 
 if(playerDirection=='d')
 {
 x+=5;
 while(checkwalls())
  {
        
   x-=5;
   }
 }


  }
}

void getDamage(float xp, float yp, float xp2, float yp2,char d)
{
  if(health>0)
  {
  
  float t;
    
if(xp>xp2)
{
t=xp;
xp=xp2;
xp2=t;
}

// if yp is less than yp2, y=yp, and y2=yp2
if(yp>yp2)
{
  t=yp;
yp=yp2;
yp2=t;
}
    
 if(lockDamage<1)
 {
  if(x+w/2>xp&&x-w/2<xp2)
  {
   if(y+h/2>yp&&y-h/2<yp2)
   {
   health-=200;
   lockDamage=10;
   lockMove=10;
   playerDirection=d;
 
   }
  }
 }
 else if(lockDamage>0)
 {
 lockDamage--;
 }

 if(health<=0)
 {
   reduceEnemyCount();
 }

  }
}

int throwArrow(int count)
{
  if(health>0)
  {
//int(random(241))==1
if((int(random(241)))==1)
{
arrows[count]= new Arrow(x,y,direction);
count++;
}
  }
return count;
}


void hitByShield(char d)
{
playerDirection=d;
lockMove=10;

}



}
