public static int SQUARE_WIDTH = 80;
public static int SQUARE_HEIGHT = 80;
PGraphics canvas;
PImage img1,img2;
void setup() {
  size(400,400);
  canvas = createGraphics(width, height);
  img1 = loadImage("finder.png");
  img2 = loadImage("AR1.jpg");
  image(img1,0,0);
}
void draw() {
  image(img1,0,0);
  fadeGraphics(canvas, 2);
 
  canvas.beginDraw();
  canvas.copy(img2, 
              constrain(mouseX-SQUARE_WIDTH/2,0,width), 
              constrain(mouseY-SQUARE_HEIGHT/2,0,height), 
              SQUARE_WIDTH,SQUARE_HEIGHT, 
              constrain(mouseX-SQUARE_WIDTH/2,0,width), 
              constrain(mouseY-SQUARE_HEIGHT/2,0,height), 
              SQUARE_WIDTH,SQUARE_HEIGHT);
  //canvas.rect(mouseX, mouseY, 60, 60);
  canvas.endDraw();
 
  image(canvas, 0, 0);
  
//if(mousePressed) 
//      copy(img2, 
//              constrain(mouseX-SQUARE_WIDTH/2,0,width), 
//              constrain(mouseY-SQUARE_HEIGHT/2,0,height), 
//              SQUARE_WIDTH,SQUARE_HEIGHT, 
//              constrain(mouseX-SQUARE_WIDTH/2,0,width), 
//              constrain(mouseY-SQUARE_HEIGHT/2,0,height), 
//              SQUARE_WIDTH,SQUARE_HEIGHT);
}

void fadeGraphics(PGraphics c, int fadeAmount) {
  c.beginDraw();
  c.loadPixels();
 
  // iterate over pixels
  for (int i =0; i<c.pixels.length; i++) {
 
    // get alpha value
    int alpha = (c.pixels[i] >> 24) & 0xFF ;
 
    // reduce alpha value
    alpha = max(0, alpha-fadeAmount);
 
    // assign color with new alpha-value
    c.pixels[i] = alpha<<24 | (c.pixels[i]) & 0xFFFFFF ;
  }
 
  canvas.updatePixels();
  canvas.endDraw();
}