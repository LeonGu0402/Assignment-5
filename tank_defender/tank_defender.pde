//global varibles
boolean up;
boolean down;
boolean start;
boolean end;
boolean coolDown;
boolean remove;
boolean show;
int score;
int scorecount;
int health;
int enemiesNumber;
int coolDownTime;
int bulletIndex;
int enemyIndex;
int imageShowTime;
int destoryX;
int destoryY;
PImage explosion;
PImage house1;
PImage house2;

//objects
Player player;

//array of eplosion particles
int particlesNumber = 50;
Particle particlesList[] = new Particle[particlesNumber];

//arraylist of enemies and bullets
ArrayList <Bullet> bulletsList;
ArrayList <Enemy> enemiesList;

void setup() {
  size(800, 400);
  frameRate(60);
  rectMode(CORNERS);
  //initillizing varibles
  score = 0;
  scorecount = 0;
  health = 120;
  enemiesNumber = 2;
  coolDownTime = 0;
  imageShowTime = 0;
  destoryX = 0;
  destoryY = 0;
  up = false;
  down = false;
  start = true;
  end = false;
  coolDown = false;
  remove = false;
  show = false;
  explosion = loadImage("explosion.png");
  house1 = loadImage("house1.png");
  house2= loadImage("house2.png");
  imageMode(CENTER);

  //initilize player
  player = new Player(40, 200);

  //initilize enemy and bullet arraylist
  enemiesList = new ArrayList();
  bulletsList = new ArrayList();

  //creates new enemey
  for (int i = 0; i < enemiesNumber; i += 1) {
    Enemy enemy = new Enemy();
    enemiesList.add(enemy);
  }
}

void draw() {
  background(113, 188, 225);

  //draw the land
  land();
  //show house
  house1(100, 30);
  house2(150, 45);
  house1(300, 30);
  house2(790, 45);
  house1(570, 30);
  house2(400, 45);
  house1(740, 30);
  house2(480, 45);
  //draw the health bar
  healthBar();
  //draw the score bar
  scoreBar();


  //draw and update enemies, detects collision
  for (Enemy enemy : enemiesList) {
    enemy.display();
    enemy.update();
  }
  //draw and update bullets
  for (Bullet bullet : bulletsList) {
    bullet.update();
    bullet.display();
  }


  //call the fire and cooldown fuction
  fire();
  cooldown();
  //call hit detector and show destory image and particle
  hit();
  explosion();
  showDestory();
  drawParticle();
  //draw and update particles

  
 
  //call increase enemy fuction
  increaseEnemy();


  //scene switch
  if (startPageSwitch()) {
    startPage();
  }
  if (endPageSwitch()) {
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
