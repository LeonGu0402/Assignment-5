class Particle {
  //position vector
  PVector position;
  //speed vector
  PVector velocity;
  
  //constructor
  Particle() {
    position = new PVector(destoryX, destoryY);
    velocity = PVector.random2D();
    velocity.mult(2);
  }
  
  //particle move
  void update(){
    position.add(velocity);
  }
  
  //draw particle
  void display(){
    strokeWeight(0);
    fill(255,165,0);
    circle(position.x, position.y, 3);
  }

}
