	

var grid=[]; // the grid that will hold each cell (each square that will be used in the maze)
var w=40;  // the width of the square

var current; // this variable will hold the current cell in which we are working.

var stack=[]; 
var c; // the total amount of columns
var r; // the total amount of rows
var MazeFinished=false;
var gameFinished=false;
var LongestPath=0;
var exit;
var instructions=true;
	
function setup() 
{
	createCanvas(800, 800);
	
	 c= floor(width/w); // fill in the columns
	 r =floor(height/w); // fill in the rows
	
	
	// creating a new object call cell using the Cell class
	// entering the location of each cell byt using the current column and rows (i,j)
	//pushing that cell into the the array grid.
	
	
	for (var j=0; j<r; j++){
		for(var i=0; i<c; i++){
			var cell= new Cell(i,j);
			grid.push(cell);
		}
	}

	
	current = grid[0];
	exit=current;
}

  
function draw() 
{
	background(51);// black background
	
	
	// showing each cell
	for(var i=0;i<grid.length;i++){
		grid[i].show();
	}
	showExit();
	if(!MazeFinished)
	{
		
		current.visited = true; 
		current.highlight();
		var next = current.checkNeighbors() // add the the random choosen unvisited neighbor to next
	
		// if next is defined then make visited true and make current = next
		if(next)
		{
			next.visited=true;
		
			stack.push(current);
		
			removeWalls(current,next);
			current=next;
		}
		else if(stack.length>0)
		{
			if(stack.length>LongestPath)
			{
				LongestPath=stack.length;
				exit=current;
			}
			current=stack.pop();
		}
		else
		{
			MazeFinished=true;
			instructions=true;
		}
		if(instructions){
			waitForMaze();
		}
		
	}
	else
	{
		
		showExit()
		current.highlight();
		if(instructions){
		showInstructions();
		}
		if(gameFinished)
		{
			showEndGameText();
		}
		
	}
}

function showEndGameText()
{
	instructions=false;
	fill(255);
	textSize(30);
	textFont("Georgia");
	rect(width/4,height/4,2*(width/4),height/4+30)
	fill(0);
	text("Congratulations, You solved the Maze!!", width/4,height/4,2*(width/4),height/4+30);
	
}

function showInstructions ()
{
	
	fill(255);
	textSize(30);
	textFont("Georgia");
	rect(width/4,height/4,2*(width/4),height/4+30)
	fill(0);
	text("use the keys \"a,w,s,d\" to move around the maze. you objective is to get to the green square. Press t to remove the instructions", width/4,height/4,2*(width/4),height/4+30);
	
}
function waitForMaze()
{
	fill(255);
	textSize(30);
	textFont("Georgia");
	rect(width/4,height/4,2*(width/4),height/4+30)
	fill(0);
	text("Please wait until the maze is finish building. Press t to hide this message.", width/4,height/4,2*(width/4),height/4+30);
	
}

function showExit() {
	
	var x= exit.column*w;
	var y= exit.row*w;
	noStroke();
	fill(0,255,0);
	rect(x+w*0.25,y+w*0.25,w*0.5,w*0.5);
	
	
}



function keyPressed() {
	println("-----------------------------------");
	println(gameFinished);
	println(current);
	println(exit);
  if (key === "W" && !current.walls[0]) {
	   
	   current=grid[index(current.column,current.row-1)]; 
	   
	   if(current.column==exit.column && current.row==exit.row)
	   {
		   gameFinished=true;
	   }
	   
  } else if (key==="S" && !current.walls[2])
  {
	 current=grid[index(current.column,current.row+1)]; 
	 
	 if(current.column==exit.column && current.row==exit.row)
	   {
		   gameFinished=true;
	   }
	 
  } else if (key ==="A" && !current.walls[1])
  {
	 current=grid[index(current.column-1,current.row)];
	 
	 if(current.column==exit.column && current.row==exit.row)
	   {
		   gameFinished=true;
	   }
	 
  }else if( key==="D" && !current.walls[3]){
	  
	 current=grid[index(current.column+1,current.row)];

	 if(current.column==exit.column && current.row==exit.row)
	   {
		   gameFinished=true;
	   }
	 
	 
  }else if( key==="T" ){
	  
	 instructions=!instructions; 
	 
  }
}
// bases on the postion of the cell in columns and rows get the index (this is in order to get the variable out of the 1-d array grid)
function index(i,j)
{
	// if i or j is outside the bounderies of grid then return -1
	if(i<0 || i>c-1 || j<0 || j>r-1)
	{
		return -1;
	}
	else // if i && j are inside the bounderies then return the index
	{
	var index = i + j*c;
	return index;	
	}
	
	
}
function removeWalls(a,b)
{
	DiffI=a.column - b.column;
	DiffJ=a.row - b.row;
	
	if(DiffI==-1)
	{
		a.walls[3]=false;
		b.walls[1]=false;
	}
	else if(DiffI==1)
	{
		a.walls[1]=false;
		b.walls[3]=false;
	}
	else if(DiffJ==-1)
	{
		a.walls[2]=false;
		b.walls[0]=false;
	}
	else
	{
		a.walls[0]=false;
		b.walls[2]=false;
	}
	
}

// <-------------- Starting the Cell Class -------------------->


//Constructor method 
// input the location of the cell in columsn and rows
function Cell (i,j)
{
	this.column=i; // the colums of the cell
	this.row=j; // the row of the the cell
	this.visited = false; // have you been on this cell
	this.walls=[true,true ,true   ,true]; // the active walls of the cell
	//          top ,right,bottom,left
}


Cell.prototype.highlight=function()
{
	var x= this.column*w;
	var y= this.row*w;
	noStroke();
	fill(0,0,255);
	rect(x,y,w,w);
	
}

// show this particular cell
Cell.prototype.show=function()
{	
	
	stroke(255);
	strokeWeight(1.1);
	// the x and y cordinates are the top left corner of the cell
	var x= this.column*w;
	var y= this.row*w;
	
	
	 // display the active walls
	if(this.walls[0]){
	line(x,y,x+w,y);// top
	}
	
	if(this.walls[1]){
	line(x,y,x,y+w);// right
	}
	
	if(this.walls[2]){
	line(x,y+w,x+w,y+w); //bottom
	}
	
	if(this.walls[3]){
	line(x+w,y,x+w,y+w); //left
	}
	
	// change the color of the cell if it has been visited
	if(this.visited){
	noStroke();
	fill(0, 191, 255);
	rect(x,y,w,w);
	}
}

// return a random unvisited neigbor cell
Cell.prototype.checkNeighbors=function()
{
	var neighbors = []; // store the unvisited neigbors of the cell
	var i= this.column; // the column of the cell
	var j= this.row; // the row of the cell
	
	
	//top
	var top=grid[index(i,j-1)]; // add the top neigbor cell to the var top
	
	//right
	var right=grid[index(i-1,j)]; // add the right neigbor cell to the var right

	//bottom
	var bottom=grid[index(i,j+1)]; // add the bottom neigbor cell to the var bottom
	
	//left
	var left=grid[index(i+1,j)]; // add the left neigbor cell to the var left
	
	
	// the top neigbor is not undefined and it has not been visited added the the array neigbors
	if(top && !top.visited)
	{
		neighbors.push(top);
	}
	// the bottom neigbor is not undefined and it has not been visited added the the array neigbors
	if(right && !right.visited)
	{
		neighbors.push(right);
	}
	// the bottom neigbor is not undefined and it has not been visited added the the array neigbors
	if(bottom && !bottom.visited)
	{
		neighbors.push(bottom);
	}
	// the left neigbor is not undefined and it has not been visited added the the array neigbors
	if(left && !left.visited)
	{
		neighbors.push(left);
	}
	
	// if there is at least one variable inside the array call neigbors the choose one of the cells inside it and return it
	if(neighbors.length > 0)
	{
		var r =floor(random(0,neighbors.length)); 
		return neighbors[r];
		
	}
	else // if the neigbors is empty return undefined
	{
		return undefined;
	}
}
// <------------------- Ending the Cell Class --------------->