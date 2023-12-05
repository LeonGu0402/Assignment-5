

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
}


//fire and cool down fuction
void fire() {
  if (keyPressed && coolDown == false) {
    if (key == ' ') {
      Bullet bullet = new Bullet(player.position.x + 40, player.position.y);
      bulletsList.add(bullet);
      coolDownTime = 800;
      coolDown = true;
    }
  }
}
//provide time interval between each fire
void cooldown() {
  coolDownTime = coolDownTime - 20;
  if (coolDownTime == 0) {
    coolDown = false;
  }
}


//hit detector
void hit() {
  for (int i = 0; i < enemiesNumber; i += 1) {
    for (Bullet bullet : bulletsList) {
      if (dist(enemiesList[i].position.x, enemiesList[i].position.y, bullet.position.x, bullet.position.y) <= 30) {
        //get the destory location
        destoryX = int(bullet.position.x);
        destoryY = int(bullet.position.y);
        //get the index of the bullet
        bulletIndex = bulletsList.indexOf(bullet);
        remove = true;
        enemiesList[i].reset();
        show = true;
        //updating the score
        score = score + 1;
        println("Gotcha");
        //refesh the time and get destory location
        imageShowTime = 800;
      }
    }
    removeBullet();
  }
}
//fucntion to remove the bullet that hit
void removeBullet() {
  if (remove == true) {
    bulletsList.remove(bulletIndex);
    remove = false;
  }
}


//show the destory image
void showDestory() {
  imageShowTime = imageShowTime - 30;
  if (imageShowTime <= 0) {
    show = false;
  }
}
void explosionImage() {
  if (show == true) {
    tint(200);
    image(explosion, destoryX, destoryY, 50, 50);
  }
}
