
var currentScene = 2;

var nX, nY;
var playerSpeed = 10;
var gameKeyCode = 1;


void setup(){
  size( 500, 500 );
 // strokeWeight( 10 );
  frameRate( 30 );

}
{// Object
var PPlayer = function (poX, poY){
	this.posX = poX;
	this.posY = poY;
	this.swordSide = 4;
};

PPlayer.prototype.draw = function(){
	fill(30, 67, 200);
    rect(this.posX, this.posY, 40, 40);
};

PPlayer.prototype.hit = function(){
	if (this.swordSide === 1){  //right
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
	}
}
}




var Player = new PPlayer (15, 15);



void draw(){
  
    if (currentScene === 1) {
        drawScene1();
	} else if (currentScene === 2) {
		drawScene2();
	}

	
  
 Player.draw();
 Player.hit();
 Player.posX += (nX-Player.posX-20)/playerSpeed;//Speed player
 Player.posY += (nY-Player.posY-20)/playerSpeed;
   
}



void mouseMoved(){
  nX = mouseX;
  nY = mouseY;  
}

void keyPressed (){
	
	gameKeyCode = keyCode;
	println(gameKeyCode);
	
	if (gameKeyCode === 68) {
		Player.swordSide = 1;
		gameKeyCode = 1;
	} else if (gameKeyCode === 87) {
		Player.swordSide = 2;
		gameKeyCode = 1;
	} else if (gameKeyCode === 65) {
		Player.swordSide = 3;
		gameKeyCode = 1;
	} else if (gameKeyCode === 83) {
		Player.swordSide = 4;
		gameKeyCode = 1;
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

