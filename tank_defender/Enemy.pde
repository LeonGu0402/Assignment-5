class Enemy {
  //speed
  float speed = -1.5;
  //position vector
  PVector position;
  //speed vector
  PVector velocity;

  //constructor
  Enemy() {
    reset();
  }

  //make the enemy move
  void update() {
    position.add(velocity);
    //remove enemy and decrease health bar lengthwhen it is out of screen
    if (position.x < -40) {
      health = health - 10;
      reset();
    }
  }

  //draw the enemy
  void display() {
    strokeWeight(2);
    fill(60);
    beginShape();
    vertex(position.x - 10, position.y - 18);
    vertex(position.x + 10, position.y - 18);
    vertex(position.x + 15, position.y - 10);
    vertex(position.x - 15, position.y - 10);
    endShape(CLOSE);
    beginShape();
    vertex(position.x + 15, position.y - 10);
    vertex(position.x + 21, position.y - 5);
    vertex(position.x + 21, position.y + 5);
    vertex(position.x + 15, position.y + 10);
    endShape(CLOSE);
    fill(139,0,0);
    rect(position.x - 15, position.y - 10, position.x + 15, position.y + 10);
    fill(28, 28, 28);
    rect(position.x - 30, position.y + 10, position.x + 20, position.y + 25, 90);
    fill(79, 79, 79);
    rect(position.x - 26, position.y + 14, position.x + 16, position.y + 21, 90);
    fill(170, 169, 173);
    circle(position.x - 21, position.y + 18, 8);
    circle(position.x - 11, position.y + 18, 8);
    circle(position.x - 1, position.y + 18, 8);
    circle(position.x + 9, position.y + 18, 8);
    fill(60);
    rect(position.x - 8, position.y - 3, position.x - 40, position.y + 3);
    fill(0);
    circle(position.x - 40, position.y, 6);
  }
  
  //draw the destory image
  void destory(){
    strokeWeight(2);
    fill(0);
    circle(position.x, position.y, 50);
  }
  
  //reset the enemy location, the y location is limited so player can hit them
  void reset() {
    position = new PVector(random(860, 1200), int(random(8, 37)) * 10);
    velocity = new PVector(speed, 0);
  }
}
