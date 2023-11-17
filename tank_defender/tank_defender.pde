//global varibles
boolean up = false;
boolean down = false;

//objects
Player player;

void setup() {
  size(800, 400);
  frameRate(60);
  rectMode(CORNERS);

  //initilization objects
  player = new Player(40, 200);
}

void draw() {
  background(113, 188, 225);

  land();
  //call player drawing, always facing front
  player.updates();
  

}


//draw the land
void land() {
  strokeWeight(3);
  fill(52, 140, 49);
  rect(-10, 60, 810, 410);
}


//direction detection
void keyPressed() {
  switch(key) {
    //when player presses W
  case 'W':
  case 'w':
    player.upMove();
    up = true;
    break;
    //when player presses S
  case 'S':
  case 's':
    player.downMove();
    down = true;
    break;
  }
}
//also detection
void keyReleased() {
  switch(key) {
    //when player presses W
  case 'W':
  case 'w':
    up = false;
    break;
    //when player presses S
  case 'S':
  case 's':
    down = false;
    break;
  }
}
