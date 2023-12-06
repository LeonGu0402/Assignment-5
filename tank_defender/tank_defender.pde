//global varibles
boolean up;
boolean down;
boolean start;
boolean end;
boolean coolDown;
boolean remove;
boolean show;
int score;
int health;
int enemiesNumber;
int coolDownTime;
int bulletIndex;
int imageShowTime;
int destoryX;
int destoryY;
PImage explosion;

//objects
Player player;

//array of enemies
int totalNumber = 10;
Enemy enemiesList[] = new Enemy[totalNumber];

//arraylist of bullets
ArrayList <Bullet> bulletsList;

void setup() {
  size(800, 400);
  frameRate(60);
  rectMode(CORNERS);
  //initillizing varibles
  score = 0;
  health = 120;
  enemiesNumber = 2;
  coolDownTime = 0;
  imageShowTime = 0;
  up = false;
  down = false;
  start = true;
  end = false;
  coolDown = false;
  remove = false;
  show = false;
  explosion = loadImage("explosion.png");
  imageMode(CENTER);

  //initilization objects
  player = new Player(40, 200);

  //creates new enemey
  for (int i = 0; i < enemiesNumber; i += 1) {
    enemiesList[i] = new Enemy();
  }

  //initilization bullet arraylist
  bulletsList = new ArrayList();
}

void draw() {
  background(113, 188, 225);

  //draw the land
  land();
  //draw the health bar
  healthBar();
  //draw the score bar
  scoreBar();

  //draw and update enemies, detects collision
  for (int i = 0; i < enemiesNumber; i += 1) {
    enemiesList[i].display();
    enemiesList[i].update();
  }

  //call the fire and cooldown fuction
  fire();
  cooldown();

  //call hit detector and show destory image 
  hit();
  explosionImage();
  showDestory();



  //draw and update bullets
  for (Bullet bullet : bulletsList) {
    bullet.update();
    bullet.display();
  }

  //sceen switch
  if (start == true && end == false) {
    startPage();
  }
  if (start == false && end == true) {
    endPage();
  }
  if (start == false && end == false && health <= 0) {
    end = true;
  }

  //game states drawing
  if (start == false && end == false) {
    //call player drawing, always facing front
    player.updates();
  }
}
