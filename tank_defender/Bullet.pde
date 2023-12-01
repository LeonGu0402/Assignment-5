class Bullet {
  //speed
  int speed = 6;
  //position vector
  PVector position = new PVector();
  //speed vector
  PVector velocity = new PVector(speed, 0);

  //constructor
  Bullet(float x, float y) {
    position = new PVector(x, y);
  }

  //bullet move
  void update() {
    position.add(velocity);
  }

  //draw the bullet
  void display() {
    strokeWeight(2);
    fill(50);
    rect(position.x - 3, position.y - 3, position.x + 10, position.y + 3);
    triangle(position.x + 10, position.y - 3, position.x + 10, position.y + 3, position.x + 15, position.y);
    fill(211, 108, 23);
    triangle(position.x - 3, position.y - 3, position.x - 3, position.y + 3, position.x - random(30, 40), position.y);
  }
}
