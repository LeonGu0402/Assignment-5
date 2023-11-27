//global varibles
boolean up;
boolean down;
boolean start;
boolean end;
int score;
int health;
int enemiesNumber;

//objects
Player player;

//arraylist of enemies
int totalNumber = 10;
Enemy enemiesList[] = new Enemy[totalNumber];

void setup() {
  size(800, 400);
  frameRate(60);
  rectMode(CORNERS);
  //initillizing varibles
  score = 0;
  health = 120;
  enemiesNumber = 2;
  up = false;
  down = false;
  start = true;
  end = false;

  //initilization objects
  player = new Player(40, 200);

  //creates new enemey
  for (int i = 0; i < enemiesNumber; i += 1) {
    enemiesList[i] = new Enemy();
  }
}

void draw() {

  background(113, 188, 225);

  //draw the land
  land();
  //draw the health bar
  healthBar();
  //draw the score bar
  scoreBar();
  
  //draw and update enemies, detects collisiom
  for (int i = 0; i < enemiesNumber; i += 1){
    enemiesList[i].display();
    enemiesList[i].update();
  }

  //sceen switch
  if (start == true && end == false) {
    startPage();
  }
  if (start == false && end == true) {
    endPage();
  }

  //game states drawing
  if (start == false && end == false) {
    //call player drawing, always facing front
    player.updates();
  }
  

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


//the health bar
void healthBar() {
  //red part
  strokeWeight(3);
  fill(255, 51, 51);
  rect(0, 0, 120, 20);

  //green part
  strokeWeight(3);
  fill(51, 255, 51);
  rect(0, 0, health, 20);

  textSize(20);
  fill(0);
  text("Health", 3, 16);
}
//the score bar
void scoreBar() {
  strokeWeight(3);
  fill(150);
  rect(700, 0, 800, 20);

  textSize(20);
  fill(0);
  text("Score:", 703, 16);
  textSize(20);
  text(score, 760, 16);
}


//start page
void startPage() {
  background(80, 183, 325);
  textSize(100);
  fill(0);
  text("Tank Defender", 100, 140);
  textSize(20);
  text("Use W and S to move up and down", 245, 220);
  text("press space to shoot", 245, 250);
  text("stop enemies", 245, 280);
  textSize(30);
  text("Click right mouse to start", 225, 350);
}
//end page
void endPage() {
  background(0);
  textSize(100);
  fill(255, 0, 0);
  text("Game Over", 160, 180);
  textSize(50);
  text("You scored: " + score, 245, 260);
  textSize(30);
  text("Click right mouse to restart", 220, 330);
}


//start and reset function
void mousePressed() {
  //from start page to game
  if (start == true && end == false) {
    start = false;
  }
  //from game to end page
  if (start == false && end == true) {
    setup();
  }

  //this is test for lose condition, remove later
  if (start == false && end == false && health == 10) {
    end = true;
  }
  if (start == false && end == false) {
    health = health - 10;
  }
}
