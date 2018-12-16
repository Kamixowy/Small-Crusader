
var currentScene = 2;

var nX, nY;
var playerSpeed = 10;


void setup(){
  size( 500, 500 );
 // strokeWeight( 10 );
  frameRate( 30 );

}
{// Object
var PPlayer = function (poX, poY){
	this.posX = poX;
	this.posY = poY;
};

PPlayer.prototype.draw = function(){
	fill(30, 67, 200);
    rect(this.posX, this.posY, 40, 40);
};
}




var Player = new PPlayer (15, 15);



void draw(){
  
    if (currentScene === 1) {
        drawScene1();
	} else if (currentScene === 2) {
		drawScene2();
	}

 // background( 10, 255, 10 );
  
 Player.draw();
 Player.posX += (nX-Player.posX-20)/playerSpeed;//Speed player
 Player.posY += (nY-Player.posY-20)/playerSpeed;
 println(nX);     
}



void mouseMoved(){
  nX = mouseX;
  nY = mouseY;  
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

