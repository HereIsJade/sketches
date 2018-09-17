ArrayList<Particle> particles = new ArrayList<Particle>();
ArrayList<Particle> pool = new ArrayList<Particle>();
int MAX_PARTICLES=170;
color[] colors = {color(105,210,231), color(167,219,216), color(224,228,204), color(243,134,48), color(250,105,0), color(255,78,80),color(249,212,35)};

//VARIABLES
float wander1 = 0.5;
float wander2 = 2.0;
float drag1 = .9;
float drag2 = .99;
int force1 = 2;
int force2 = 8;
float theta1 = -0.5;
float theta2 = 0.5;
int size1 = 5;
int size2 = 60;
float sizeScalar = 0.97;

void setup() 
{
  size(800, 800);
  blendMode(ADD);
  //fullScreen();
}

void draw() { 
  update();
  background(0);
  for (int i = particles.size() - 1; i >= 0; i--) {
      particles.get(i).show();
      println(particles.size());
   }
} 

void mouseMoved(){
  moved();
  //Particle centerP=new Particle(mouseX,mouseY,30.0);
  //centerP.show();
}

void update(){
  //Particle p=new Particle(mouseX, mouseY, random(size1,size2));
  for ( int i = particles.size() - 1; i >= 0; i-- ) {
      Particle p = particles.get(i);
      if ( p.alive ) {
        p.move();
      } else {
        particles.remove(i);
        pool.add( particles.get(0));
      }
  }
}
  

class Particle{
  boolean alive=true;
  int x,y;
  float size=10.0;
  float wander=0.15;
  float theta=random(TWO_PI);
  float drag=0.92;
  color c= color(255,255,255);
  PVector velocity = new PVector(0.0, 0.0);
  PVector location = new PVector(0.0, 0.0);

  
  Particle(int px, int py, float psize) {
    x=px;
    y=py;
    size=psize;
    location=new PVector(x,y);
  }
  
  void move() {
    location.add(velocity);
    velocity.mult(drag);
    theta+=random(theta1,theta2)*wander;
    velocity.x+=sin(theta)*0.1;
    velocity.y += cos(theta) * 0.1;
    size *= sizeScalar;
    alive = size > 0.5;
  }
  
  void show(){
    fill(c);
    noStroke();
    ellipse(location.x,location.y, size, size);
    println("color: "+c);
  }
}

void spawn(int px, int py){
    if(particles.size()>=MAX_PARTICLES){
      pool.add(particles.get(0));
      particles.remove(0);   
    }
    
    Particle p=new Particle(mouseX, mouseY, random(size1,size2));
    p.wander= random( wander1, wander2 );
    int index = int(random(colors.length)); 
    p.c = colors[index];
    p.drag=random( drag1, drag2 );
    p.theta = random( TWO_PI );
    float force = random( force1, force2 );
    p.velocity.x = sin( p.theta ) * force;
    p.velocity.y = cos( p.theta ) * force;
    particles.add( p );
    //println(p.x,p.y);
  }
void moved(){
    int max= floor(random( 1, 5 ));
    for ( int i = 0; i < max; i++ ) {
      spawn( mouseX, mouseY );
    }
  } 