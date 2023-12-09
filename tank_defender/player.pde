class Player {
  //speed
  int speed = 10;
  //position vector
  PVector position;
  //speed vector
  PVector velocity;

  //constructor
  Player(int posX, int posY) {
    position = new PVector(posX, posY);
    velocity = new PVector(0, speed);
  }

  //updates
  void updates() {
    if (up == true) {
      upDisplay();
    }
    if (down == true) {
      downDisplay();
    }
    if (down == false && up == false){
      idleDisplay();
    }
  }

  //direction movements
  //going up
  void upMove() {
    if (position.y >= 90) {
      position.sub(velocity);
    }
  }
  //going down
  void downMove() {
    if (position.y <= 360) {
      position.add(velocity);
    }
  }

  //draw the three forms of tank
  //not moving
  void idleDisplay() {
    strokeWeight(2);
    fill(70, 130, 180);
    ellipse(position.x, position.y - 10, 28, 13);
    fill(0, 0, 128);
    rect(position.x - 15, position.y - 10, position.x + 15, position.y + 10);
    fill(28, 28, 28);
    rect(position.x - 20, position.y + 10, position.x + 30, position.y + 25, 90);
    fill(79, 79, 79);
    rect(position.x - 16, position.y + 14, position.x + 26, position.y + 21, 90);
    fill(170, 169, 173);
    circle(position.x - 11, position.y + 18, 8);
    circle(position.x - 1, position.y + 18, 8);
    circle(position.x + 9, position.y + 18, 8);
    circle(position.x + 20, position.y + 18, 8);
    fill(155, 155, 155);
    rect(position.x + 8, position.y - 3, position.x + 40, position.y + 3);
    fill(0);
    circle(position.x + 40, position.y, 6);
  }
  //moving up, facing up
  void upDisplay() {
    strokeWeight(3);
    fill(28, 28, 28);
    rect(position.x - 20, position.y - 25, position.x - 10, position.y + 15);
    rect(position.x + 20, position.y - 25, position.x + 10, position.y + 15);
    fill(155, 155, 155);
    rect(position.x - 3, position.y - 35, position.x + 3, position.y);
    fill(0);
    ellipse(position.x, position.y - 35, 6, 4);
    fill(70, 130, 180);
    ellipse(position.x, position.y - 10, 28, 13);
    fill(0, 0, 128);
    rect(position.x - 15, position.y - 10, position.x + 15, position.y + 10);
  }
  //moving down, facing down
  void downDisplay() {
    strokeWeight(3);
    fill(28, 28, 28);
    rect(position.x - 20, position.y - 15, position.x - 10, position.y + 25);
    rect(position.x + 20, position.y - 15, position.x + 10, position.y + 25);
    fill(70, 130, 180);
    ellipse(position.x, position.y - 10, 28, 13);
    fill(0, 0, 128);
    rect(position.x - 15, position.y - 10, position.x + 15, position.y + 10);
    fill(155, 155, 155);
    rect(position.x - 3, position.y + 30, position.x + 3, position.y + 3);
    fill(0);
    ellipse(position.x, position.y + 30, 6, 4);
  }
}
