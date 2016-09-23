var grid; // this grid will hold the current values of a & b for every pixel
var next; // this grid will hold the future values a & b for every pixel
var dA=1.0;
var dB=0.5;
var dt=1;

 var feed1=0.039; 
 var kill1=0.0649; 

// var feed1=0.055; 
// var kill1=0.062; 


//var feed1=0.021; waves
//var kill1=0.05; 



function setup() 
{
	createCanvas(200,200);
	pixelDensity(1); // setting the pixel desnity to 1 so we don't have to deal with pixels inside pixels
	// creating the grid that will contain the value of a and b for every pixel
	grid=[];
	next=[];
	for(var x = 0;x<width;x++)
	{	
		//creating array in every x pixel
		grid[x]=[];
		next[x]=[];
		for(var y = 0;y<height;y++)
		{
			// adding a literal javascript object that will hold the a and b values for every pixel
			grid[x][y]={a:1,b:0};
			next[x][y]={a:1,b:0};
		}
		
	}
	
	for (var i =90; i<120; i++){
		for(var j =100; j<110;j++){
			grid[i][j].b=1;
		}
	}
}

function draw() 
{
	
	
	// update the values of a and b of next base on grid
	updateNext();
	
	// load the pixels
	loadPixels();
	
	// change the colors of each pixel based on the values of a and b of next
	ChangePixelColor();
	
	// for(var x = 0;x<width;x++)
	// {	
		// for(var y = 0;y<height;y++)
		// {
			// // adding a literal javascript object that will hold the a and b values for every pixel
			// println(next[x][y].a +" "+next[x][y].b );
		// }
		
	// }
	
	
	
	// update the pixels
	updatePixels();
	
	
	
	swap();
}



function ChangePixelColor()
{
		
	for (var x = 0; x < width; x++) {
    for (var y = 0; y < height; y++) {
      var pix = (x + y * width) * 4;
      var a = next[x][y].a;
      var b = next[x][y].b;
      var c = floor((a - b) * 255);
      //c = constrain(c, 0, 255);
      pixels[pix + 0] = c;
      pixels[pix + 1] = c;
      pixels[pix + 2] = c;
      pixels[pix + 3] = 255;
    }
  }
  
	
  
}

function updateNext()
{
	
	// exclude the edges of the system.
	for (var x = 1; x < width - 1; x++) {
    for (var y = 1; y < height - 1; y++) {
      var a = grid[x][y].a;
      var b = grid[x][y].b;
	  //var feedR=lerp(feed1,feed2,(y/height));
	  //var killR=lerp(kill1,kill2,(x/width))
      next[x][y].a = a +(dA * laplaceA(x, y)) -(a * b * b) +(feed1 * (1 - a));
      next[x][y].b = b +(dB * laplaceB(x, y)) +(a * b * b) - (( kill1 + feed1) * b);

     
	  
	   next[x][y].a = constrain(next[x][y].a, 0, 1);
       next[x][y].b = constrain(next[x][y].b, 0, 1);
    }
  }

	
	
	
}

function laplaceA(x,y)
{
  var sumA = 0;
  sumA += grid[x][y].a * -1;
  sumA += grid[x - 1][y].a * 0.2;
  sumA += grid[x + 1][y].a * 0.2;
  sumA += grid[x][y + 1].a * 0.2;
  sumA += grid[x][y - 1].a * 0.2;
  sumA += grid[x - 1][y - 1].a * 0.05;
  sumA += grid[x + 1][y - 1].a * 0.05;
  sumA += grid[x + 1][y + 1].a * 0.05;
  sumA += grid[x - 1][y + 1].a * 0.05;
  return sumA;	
}



function laplaceB(x,y)
{
   var sumB = 0;
  sumB += grid[x][y].b * -1;
  sumB += grid[x - 1][y].b * 0.2;
  sumB += grid[x + 1][y].b * 0.2;
  sumB += grid[x][y + 1].b * 0.2;
  sumB += grid[x][y - 1].b * 0.2;
  sumB += grid[x - 1][y - 1].b * 0.05;
  sumB += grid[x + 1][y - 1].b * 0.05;
  sumB += grid[x + 1][y + 1].b * 0.05;
  sumB += grid[x - 1][y + 1].b * 0.05;
  return sumB;
}



function swap()
{
  var temp = grid;
  grid = next;
  next = temp;
	
}