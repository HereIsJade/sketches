
var startX=0;
var startY;
var x,y;

function setup() {
  createCanvas(displayWidth, displayHeight);
  // noCursor();
  startY=height/3;
  x=startX;
  y=startY;


}

function draw() {
  background(0);
  push();
  stroke(3, 66, 62,190);
  strokeWeight(10);
  line(startX,startY,x,y);

  stroke(3, 66, 62,120);
  strokeWeight(15);
  line(startX,startY,x,y);

  stroke(0,255,255);
  strokeWeight(2);
  line(startX,startY,x,y);
  pop();

  x+=0.5;
  y+=0.1;

}
