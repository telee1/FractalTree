private double fractionLength = .8; 
private int smallestBranch = 5; 
private double branchAngle = .2; 

public void setup() 
{   
	size(640,480);    
	noLoop(); 
} 
public void draw() 
{   
	background(0);   
	// stroke(139,69,19);  
	stroke(139,69,19); 
	line(320,480,320,420);   
	drawBranches(320,420,100,3*Math.PI/2);  //will add later 

} 
public void drawBranches(int x,int y, double branchLength, double angle) 
{   
	
	double angle1 = angle + branchAngle;
	double angle2 = angle - branchAngle;
	branchLength = branchLength * fractionLength;
	int endX1 = (int)(branchLength*Math.cos(angle1) + x);
	int endY1 = (int)(branchLength*Math.sin(angle1) + y);
	int endX2 = (int)(branchLength*Math.cos(angle2) + x);
	int endY2 = (int)(branchLength*Math.sin(angle2) + y);
	stroke(139,69,19);
	line(x,y,endX1,endY1);
	line(x,y,endX2,endY2);

	if(branchLength>smallestBranch)
	{
		stroke(139,69,19);
		drawBranches(endX1,endY1,branchLength,angle1);
		drawBranches(endX2,endY2,branchLength,angle2);
	}
	

	if (endX2%2==0 && endY2%2==0 && endY2>100)
	{
		noStroke();
		fill(255,182,193);
		ellipse(endX2,endY2,10,10);
		ellipse(endX1,endY1,10,10);
	}

	if (endX2%4==2 && endY2%4==2 && endY2<100)
	{
		noStroke();
		fill(255,182,193);
		ellipse(endX2,endY2,10,10);
		ellipse(endX1,endY1,10,10);
	}



} 
