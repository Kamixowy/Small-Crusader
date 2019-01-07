
var currentScene = 2;
var nX, nY;
var playerSpeed = 10;
var gameKeyCode = 1;
var wayS = 5;
const colTab = [];
var frane = 0;

void setup(){
  size( 500, 500 );
 // strokeWeight( 10 );
  frameRate( 30 );

}
{// Object

	{ //player
var PPlayer = function (poX, poY){
	this.posX = poX;
	this.posY = poY;
	this.size = 40;
	this.swordSide = 4;
	
};

PPlayer.prototype.draw = function(){
	fill(30, 150, 200);
    rect(this.posX, this.posY, this.size, this.size);
	
	
	
	
	colTab[0] = [this.posX, this.posY, this.size];
};

PPlayer.prototype.hit = function(){
	/*if (this.swordSide === 1){  //right
		fill(10, 10, 10);
		rect(this.posX+40, this.posY+20, 30, 10);
		
	} else if (this.swordSide === 2){  //up
		fill(10, 10, 10);
		rect(this.posX+20, this.posY-30, 10, 30);
		
	} else if (this.swordSide === 3){  //left
		fill(10, 10, 10);
		rect(this.posX-30, this.posY+10, 30, 10);
		
	} else if (this.swordSide === 4){  //down
		fill(10, 10, 10);
		rect(this.posX+10, this.posY+40, 10, 30);
		
	} else{
		println('error ');
	} */
} 
}
	{// Enemy
var PEnemy = function (poX, poY, spee, coNum){
	this.posX = poX;
	this.posY = poY;
	this.size = 25;
	this.way;
	this.speed = spee;
	this.colNum = coNum;
	colTab[this.colNum] = [this.posX, this.posY, this.size];

}

PEnemy.prototype.draw = function (){ //drawing function
	fill(30, 67, 200);
	rect(this.posX, this.posY, this.size, this.size);
}

PEnemy.prototype.waySide = function (){
	this.way = wayS; //get way side from global virable
	colTab[this.colNum] = [this.posX, this.posY, this.size]; //get coolision info for table
	
	if(frane%3 === 0){
	for(var a = 0 ; a<= 2; a++){
		if(a != this.colNum){
		if(this.posX > colTab[a][0] && this.posX < colTab[a][0] + colTab[a][2] && this.posY > colTab[a][1] && this.posY < colTab[a][1] + colTab[a][2]) println("auuuu");
		else if(this.posX+this.size > colTab[a][0] && this.posX+this.size < colTab[a][0] + colTab[a][2] && this.posY > colTab[a][1] && this.posY < colTab[a][1] + colTab[a][2]) println("auuuu");
		else if(this.posX > colTab[a][0] && this.posX < colTab[a][0] + colTab[a][2] && this.posY+this.size > colTab[a][1] && this.posY+this.size < colTab[a][1] + colTab[a][2]) println("auuuu");
		else if(this.posX+this.size > colTab[a][0] && this.posX+this.size < colTab[a][0] + colTab[a][2] && this.posY+this.size > colTab[a][1] && this.posY+this.size < colTab[a][1] + colTab[a][2]) println("auuuu");
			
		}
			
	} }
	
	
	if( this.way === 1){ // move this object
		this.posX += this.speed;
	} else if ( this.way === 2){
		this.posY -= this.speed;
	} else if ( this.way === 3){
		this.posX -= this.speed;
	} else if ( this.way === 4){
		this.posY += this.speed;
	}
}
}

}	



var Player = new PPlayer (15, 15);
var En1 = new PEnemy (20, 30, 5, 1); 
var En2 = new PEnemy (50, 50, 7, 2); 

void draw(){
	
	if (++frane >=11) frane = 0;

  
    if (currentScene === 1) {
        drawScene1();
	} else if (currentScene === 2) {
		drawScene2();
	}

	
 
 Player.draw();
 Player.hit();
 Player.posX += (nX-Player.posX-20)/playerSpeed;//Speed player
 Player.posY += (nY-Player.posY-20)/playerSpeed;
   
   
   En1.draw();
   En1.waySide();
   
   En2.draw();
   En2.waySide();
}


void mouseMoved(){
  nX = mouseX;
  nY = mouseY;  
}

void keyPressed (){
	
	gameKeyCode = keyCode;
	println(gameKeyCode);
	
	if (gameKeyCode === 68) {
		//Player.swordSide = 1;
		wayS = 1;
		
		gameKeyCode = 1;
	} else if (gameKeyCode === 87) {
		//Player.swordSide = 2;
		wayS = 2;
		
		gameKeyCode = 1;
	} else if (gameKeyCode === 65) {
		//Player.swordSide = 3;
		wayS = 3;
		
		gameKeyCode = 1;
	} else if (gameKeyCode === 83) {
		//Player.swordSide = 4;
		wayS = 4;
		
		gameKeyCode = 1;
	} else {
		wayS = 5;
	}
	
}



var drawScene1 = function() {
background( 200, 100, 50 );
fill(30, 67, 200);
rect(200, 200, 100, 100);
fill(250, 250, 250);
text("Sart", 245, 250);
};

var drawScene2 = function() {
background( 10, 255, 10 );



};

//license beerware
//Author Kamixowy

var drawScene3 = function() {
background( 10, 255, 10 );



};

var drawScene3 = function() {
background( 10, 255, 10 );



};



