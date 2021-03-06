
var currentScene = 1;
var scoreEnemy = 30;
var scorePlayer = 4;

var getScoreAfterReset = 20;
var howManySecondsGetPointForEnemy = 2;
var howManySecondsLosePointForEnemy = 4;


var nX = 250, nY = 250;
var playerSpeed = 12;
var gameKeyCode = 1;
var wayS = 5;
const colTab = [];
var frane = 0;
var gameElemnts = true;
var gameEnemyMove = true;
var numberEn = 1;
var click = false;
var showSpeedPoint = false;
var tSecond = 0;
var m, nA, nB ; //helpful virables: draw, scene2 

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
    //rect(this.posX, this.posY, this.size, this.size);
	image(IPlayerP, this.posX, this.posY, this.size, this.size);
	
	
	
	colTab[0] = [this.posX, this.posY, this.size];
	
		if(frane%2 === 0){
		for(var a = 0 ; a<= colTab.length-1; a++){
		if(a != this.colNum){
		if(this.posX > colTab[a][0] && this.posX < colTab[a][0] + colTab[a][2] && this.posY > colTab[a][1] && this.posY < colTab[a][1] + colTab[a][2]) currentScene = 4;
		else if(this.posX+this.size > colTab[a][0] && this.posX+this.size < colTab[a][0] + colTab[a][2] && this.posY > colTab[a][1] && this.posY < colTab[a][1] + colTab[a][2]) currentScene = 4;
		else if(this.posX > colTab[a][0] && this.posX < colTab[a][0] + colTab[a][2] && this.posY+this.size > colTab[a][1] && this.posY+this.size < colTab[a][1] + colTab[a][2]) currentScene = 4;
		else if(this.posX+this.size > colTab[a][0] && this.posX+this.size < colTab[a][0] + colTab[a][2] && this.posY+this.size > colTab[a][1] && this.posY+this.size < colTab[a][1] + colTab[a][2]) currentScene = 4;
			
		}
			
	} }
	
	if (showSpeedPoint){
		textFont(PixelFont,15);
		text(playerSpeed, this.posX +10, this.posY -10);
	}
	
};

PPlayer.prototype.config = function (){
	if(wayS == 2 && this.size <65 ){
		this.size++;
		scorePlayer += 4;
		wayS = 99;
	}
	
	if(wayS == 4 && scorePlayer >= 4 && this.size >= 10){
		this.size--;
		scorePlayer -= 4;
		wayS = 99;
	}
	
	if(wayS == 1 && scorePlayer >= 4 && playerSpeed >= 2){
		playerSpeed--;
		scorePlayer -= 4;
		wayS = 99;
	}
	
	if(wayS == 3 && playerSpeed <= 25){
		playerSpeed++;
		scorePlayer += 4;
		wayS = 99;
	}
}

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
	//rect(this.posX, this.posY, this.size, this.size);
	image(IEnemyL, this.posX, this.posY, this.size, this.size);
	textFont(PixelFont,15);
	if (showSpeedPoint){
		text(this.speed, this.posX +10, this.posY -10);
		if(nX>this.posX && nX<this.posX+this.size && nY>this.posY && nY<this.posY+this.size && click === true && mouseButton == LEFT && scoreEnemy >= 5){
			this.speed++;
			click = false;
			scoreEnemy -=5;
		}
	
	}
}

PEnemy.prototype.waySide = function (){

if(gameEnemyMove == true){

	this.way = wayS; //get way side from global virable
	colTab[this.colNum] = [this.posX, this.posY, this.size]; //get coolision info for table
	

if(frane%3 === 0){
			if(this.posX <= 1) this.posX = 2;
			else if(this.posX + this.size >= 499)this.posX = 498 - this.size;
			if(this.posY <= 1) this.posY = 2;
			else if(this.posY + this.size >= 499) this.posY = 498 - this.size;
		
		}
	
	
	if( this.way === 1){ // move this object
		this.posX += this.speed;
	} else if ( this.way === 2){
		this.posY -= this.speed;
	} else if ( this.way === 3){
		this.posX -= this.speed;
	} else if ( this.way === 4){
		this.posY += this.speed;
	}
}}
}

}	


{ //declarate ojects
var Player = new PPlayer (2500, 2500);
var En1 = new PEnemy (2000, 30, 5, 1); 
var En2 = new PEnemy (5000, 50, 5, 2); 
var En3 = new PEnemy (4000, 400, 5, 3);
var En4 = new PEnemy (4000, 400, 5, 4);
var En5 = new PEnemy (4000, 400, 5, 5);
var En6 = new PEnemy (4000, 400, 5, 6);
var En7 = new PEnemy (4000, 400, 5, 7);
var En8 = new PEnemy (4000, 400, 5, 8);
var En9 = new PEnemy (4000, 400, 5, 9);
var En10 = new PEnemy (4000, 400, 5, 10);
}

{ //declarate images and font
   PImage IPlayerP;
   IPlayerP = loadImage("images/PlayerP.png");
   
   PImage IPlayerL;
   IPlayerL = loadImage("images/PlayerL.png");
   
   PImage IEnemyL;
   IEnemyL = loadImage("images/EnemyL.png");
   
   PImage IDeus1;
   IDeus1 = loadImage("images/deus1.png");
   
   PImage IDeus2;
   IDeus2 = loadImage("images/deus2.png");
   
   PImage IReset;
   IReset = loadImage("images/reset.png");
   

   PFont PixelFont = loadFont("Pixeled.ttf");
	//textFont(Pixela, 32);
		text("elo", 23, 159);
   
}
  


  
void draw(){
	
	if (++frane >=11) frane = 0;

	if(m != second()){
		tSecond++;
		m = second();
	}	
	


  
    if (currentScene === 1) {
        drawScene1();
	} else if (currentScene === 2) {
		drawScene2();
	} else  if (currentScene === 3) {
		drawScene3();
	} else  if (currentScene === 4) {
		drawScene4();
	} else  if (currentScene === 5) {
		drawScene5();
	} else {}
	
	
 if(gameElemnts === true){
	 
 Player.draw();

   
   
switch(numberEn){
	
  case 10:
   En10.draw();
   En10.waySide();
   
  case 9:
   En9.draw();
   En9.waySide();
   
  case 8:
   En8.draw();
   En8.waySide();	
	
  case 7:
   En7.draw();
   En7.waySide();
	
  case 6:
   En6.draw();
   En6.waySide();
   
  case 5:
   En5.draw();
   En5.waySide();
   
  case 4:
   En4.draw();
   En4.waySide();	
	
  case 3:
   En3.draw();
   En3.waySide();
   
  case 2:
   En2.draw();
   En2.waySide();
   
  case 1:
   En1.draw();
   En1.waySide();
   break;
   
   default:
   break;
}}}




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

void mouseClicked (){
	click = true;
}




var drawScene1 = function() { //start
gameElemnts = false;
background( 200, 100, 50 );
/*
fill(30, 67, 200);
rect(200, 200, 100, 100);
fill(250, 250, 250);
text("Sart", 245, 250);
*/

image(IDeus1, 125, 200, 250, 83);



if(nX>=125 && nX<=375 && nY >= 200 && nY <= 283 && click === true){
 currentScene = 3;	
 image(IDeus2, 125, 200, 250, 83);
 click = false;
}
};

var drawScene2 = function() { //game
background( 10, 255, 10 );
textFont(PixelFont,25);
fill(0,0,0);
text(scoreEnemy, 450, 40);
text(scorePlayer, 20, 40);
text(tSecond, 245, 40);

if(tSecond%howManySecondsGetPointForEnemy === 0 && nA!=tSecond){
	scoreEnemy-=1;
	nA=tSecond;
}

if(tSecond%howManySecondsLosePointForEnemy === 0 && nB!=tSecond){
	scorePlayer+=1;
	nB=tSecond;
}

showSpeedPoint = false;
gameElemnts = true;
gameEnemyMove = true;


 Player.hit();
 Player.posX += (nX-Player.posX-20)/playerSpeed;//Speed player
 Player.posY += (nY-Player.posY-20)/playerSpeed;

 if (scoreEnemy <= 0) currentScene = 4;
 
};

var drawScene3 = function() { //set enemy
background( 10, 255, 100 );
gameElemnts = true;
gameEnemyMove = false;
gameKeyCode = keyCode = wayS = 12;
showSpeedPoint = true;
fill(0,0,0);
textFont(PixelFont,25);
text(scoreEnemy, 450, 40);


	
	switch(numberEn){
		
  case 10:
   En10.posX = nX;
   En10.posY = nY;
   break;		

   case 9:
   En9.posX = nX;
   En9.posY = nY;
   break;
   
  case 8:
   En8.posX = nX;
   En8.posY = nY;
   break;
   
  case 7:
   En7.posX = nX;
   En7.posY = nY;
   break;

   case 6:
   En6.posX = nX;
   En6.posY = nY;
   break;
   
  case 5:
   En5.posX = nX;
   En5.posY = nY;
   break;
   
  case 4:
   En4.posX = nX;
   En4.posY = nY;
   break;
		
   case 3:
   En3.posX = nX+5;
   En3.posY = nY+5;
   break;
   
  case 2:
   En2.posX = nX+5;
   En2.posY = nY+5;
   break;
   
  case 1:
   En1.posX = nX+5;
   En1.posY = nY+5;
   break;
   
   default:
   break;
	}
	
	if(scoreEnemy < 5) {
	currentScene = 5;
	scoreEnemy = 15;
	numberEn--;
	for(var a = 0; a<99999999; a++);
	 }
		
	if(click  === true && mouseButton == RIGHT && scoreEnemy >= 10){
	   if(scoreEnemy >= 10) numberEn++;
	   scoreEnemy -= 10;
	   click = false;
}
	

};

var drawScene4 = function() { //reset
gameElemnts = false;
background( 255, 50, 50 );


image(IReset, 125, 200, 250, 83);

{//reset enemy position
   En1.posX = 1000;
   En1.posY = 1000;
   En2.posX = 1000;
   En2.posY = 1000;
   En3.posX = 1000;
   En3.posY = 1000;
   En4.posX = 1000;
   En4.posY = 1000;
   En5.posX = 1000;
   En5.posY = 1000;
   En6.posX = 1000;
   En6.posY = 1000;
   En7.posX = 1000;
   En7.posY = 1000;
   En8.posX = 1000;
   En8.posY = 1000;
   En9.posX = 1000;
   En9.posY = 1000;
   En10.posX = 1000;
   En10.posY = 1000;

   En1.speed = En2.speed = En3.speed = En4.speed = En5.speed = En6.speed = En7.speed = En8.speed = En9.speed = En10.speed = 5;
   
   
	Player.posX = 2000;
	Player.posY = 2000;
}	
	
if(nX>=125 && nX<=375 && nY >= 200 && nY <= 283 && click === true){	
 click = false;
 numberEn = 1;
 currentScene = 3;
 scoreEnemy += getScoreAfterReset; 
 tSecond = 0;
}
};

var drawScene5 = function() { //set player
	background( 10, 255, 100 );
	gameElemnts = true;
	showSpeedPoint = true;
	gameEnemyMove = false;
	
	fill(0,0,0);
    textFont(PixelFont,25);
	text(scorePlayer, 20, 40);
	
	Player.posX = 240;
	Player.posY = 240;
	
	Player.config();
	
	if(gameKeyCode == 32){
		currentScene = 2;
		tSecond = 0;
	}

 
}

//license beerware
//Author Kamixowy


