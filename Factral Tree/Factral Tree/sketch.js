	
var angle
var L=100;
var x=230;
var y=230;
	
	
function setup() 
{
	createCanvas(460, 460);
	pixelDensity(1);
	angle=PI/4;
	//branch(x,y,L,10,0);
}

  
function draw() 
{
	background(255);
	line(230,230,230,460);
	branch(x,y,L,10,0);
	angle=(mouseX/width)*PI;
	println(mouseX);
}

function branch(x0,y0,Length,branchNum,delta)
{
	if(branchNum==0)
	{
		return;
	}
	
	
	var x1=Length*sin(delta+angle)+x0;
	var y1=-Length*cos(delta+angle)+y0;
	
	var x2=Length*sin((delta-angle))+x0;
	var y2=-Length*cos(delta-angle)+y0;
	//println(branchNum+" x1 "+x1+" y1 "+y1+" delta "+delta+" angle "+angle);
	//println(branchNum+" x2 "+x2+" y2 "+y2+" delta "+delta+" angle "+angle);
	
	//strokeWeight(4);
	line(x0,y0,x1,y1);
	//strokeWeight(2);
	line(x0,y0,x2,y2);
	
	branchNum--;
	
	
	Length=Length/1.5;
	
	branch(x1,y1,Length,branchNum,delta+angle);
	branch(x2,y2,Length,branchNum,delta-angle);
	
}