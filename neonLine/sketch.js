
var startX=-3;
var startY=-3;
var x,y;
var isPaused;

function setup() {
  createCanvas(displayWidth, displayHeight);
  // noCursor();

  isPaused=true;
  startY=height/3;
  x=startX;
  y=startY;

}

function keyTyped() {
  if (key === 'p') {
    isPaused=true;
  } else if (key === 's') {
    isPaused=false;
  }
}

function draw() {
  background(0);
  push();
  stroke(255, 255,255,150);
  strokeWeight(10);
  line(startX,startY,x-1,y-1);

  stroke(255, 255,255,80);
  strokeWeight(15);
  line(startX,startY,x-1,y-1);

  stroke(255);
  strokeWeight(4);
  line(startX,startY,x,y);
  pop();

  if(!isPaused){
    x+=0.5;
    y+=0.1;
  }

}
