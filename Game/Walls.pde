class Walls
{
 int x;
 //x coordinate for the first point
 int y;
 //y coordinate for the first point
// the first point is the upper left corner of the rectangle  
 int x2;
 //x coordinate for the second point
 int y2;
 //y coordinate for the second point
 color colour;
 // the colour of the wall that is going to be display
 
 // no arguments constructure 
 Walls()
{
colour=color(255,255,255);
x=0;
y=0;
x2=0;
y2=0;

} 
// the second constructure that accepts arguments
 Walls(int xp,int yp,int xp2, int yp2,color c)
{

  colour =c;
  // this if statments arrenge the x and y coordinate to the right variables
  //  to create the wall we are going to need coordinates the top left corner of the wall and the low right corner.
  // however the program migth enter the coordinates of other corners of the wall (not the ones that the programs needs in order to create the wall).
  // the if statements use the information of the x and y points given by the program to find the x and y coordinates of the right corners 
  // (this only happens if the program did not give the class the ones it needs)
  //  by first puting the lowest x  and y coordinate in the x and y variables
  // and it puts the highest x and y coordinates in the x2 nad y2 variables. 
  // this creates the two points that the program needs in order to create the wall.
  
  //if xp is less than xp2 x=xp, and x2=xp2
if(xp<xp2)
{
 x=xp;
 x2=xp2;
}
// else, x=xp2, and x2=xp
else
{
x=xp2;
x2=xp;
}

// if yp is less than yp2, y=yp, and y2=yp2
if(yp<yp2)
{
y=yp;
y2=yp2;
}
// else y=yp2, and y2=yp
else
{
y=yp2;
y2=yp;
}
} 
// this is so your can change where is the wall created once you have already created your object
void setRect(int xp, int yp,int xp2, int yp2,color c)
{
  colour =c;
  // this if statments arrenge the x and y coordinate to the right variables
  //  to create the wall we are going to need coordinates the top left corner of the wall and the low right corner.
  // however the program migth enter the coordinates of other corners of the wall (not the ones that the programs needs in order to create the wall).
  // the if statements use the information of the x and y points given by the program to find the x and y coordinates of the right corners 
  // (this only happens if the program did not give the class the ones it needs)
  // the class thus this by first puting the lowest x  and y coordinate in the x and y variables
  // and it puts the highest x and y coordinates in the x2 nad y2 variables. 
  // this creates the two points that the program needs in order to create the wall.
  
  //if xp is less than xp2 x=xp, and x2=xp2
if(xp<xp2)
{
 x=xp;
 x2=xp2;
}
// else, x=xp2, and x2=xp
else
{
x=xp2;
x2=xp;
}

// if yp is less than yp2, y=yp, and y2=yp2
if(yp<yp2)
{
y=yp;
y2=yp2;
}
// else y=yp2, and y2=yp
else
{
y=yp2;
y2=yp;
}
}

// this is used to see if your character is inside the wall, if it is it will send a true value.
boolean getLocation(int xp, int yp,int w, int h)
{
  // xp and yp variables are the x and y coordinates of the object that should not pass the wall
 // the w and h variables are the width and height of the object that should not pass the wall 
  // initialize the variable location to false;
  boolean location= false;
  // this if statement checks to see if the object is inside the wall.
  // this first if statement check to see if it is inisde the range of x values.
  // if the xp if inisde x to x2 , notice that we add and subract w/2 to xp this to account for the width of the object.
  // so it stops right at the border of the object.
if(xp+w/2>x&&xp-w/2<x2)
{
  // this if statement does the exact same thing as the other one but with the y values.
  // it checks to see if yp is iniside y to y2
  // we add and subtract 
  if(yp+h/2>y&&yp-h/2<y2)
  {
    // if both are if statements are true then, location = true;
  location = true;
  } 
}
// we retun location.
return location;
}
// displays the wall created
void displayRect()
{
rectMode(CORNERS);
fill(colour);
rect(x,y,x2,y2);

}



}