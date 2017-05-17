/*
  v 0.8
*/

Player player;
Monster monster1;
Monster monster2;
Monster monster3;
Monster monster4;
Labyrinth labyrinth;

int size = 1024;      //only sizes of multiples of 32
int piece = size / 32;
int xFromLeftCorner = 6;
int yFromLeftCorner = 6;
int points = 0;
boolean threeD = false;
boolean alive = true;
float animation = 0;
float animationSpeed = 32;
boolean animationDirection = true;
int deaths = 0;
boolean endTextHasBeenDone = false; //do some better solution for this

void setup(){
  size(1024, 1024, P3D); //put size here manually because Processing
  fill(0);
  labyrinth = new Labyrinth();
  player = new Player(xFromLeftCorner + 9, yFromLeftCorner + 12, labyrinth);
  monster1 = new Monster(xFromLeftCorner + 1, yFromLeftCorner + 1, 10, 10, labyrinth, player, 1);
  monster2 = new Monster(xFromLeftCorner + 17, yFromLeftCorner + 1, 20, 10, labyrinth, player, 2);
  monster3 = new Monster(xFromLeftCorner + 1, yFromLeftCorner + 20, 10, 20, labyrinth, player, 3, monster1);
  monster4 = new Monster(xFromLeftCorner + 17, yFromLeftCorner + 20, 20, 20, labyrinth, player, 4);
}


void draw(){
 if (alive) {
 if (threeD) { translate(0,0,-100); }
 translate(0, 0, -2);
 fill(0);
 rect(0,0,size,size);
 translate(0, 0, 2);
 if (threeD) { translate(0,0,100); }
 controllerInput();
 
 player.move();
 
 monster1.artificialUnintelligence();
 monster2.artificialUnintelligence();
 monster3.artificialUnintelligence();
 monster4.artificialUnintelligence();
 
 labyrinth.graphics(player); 
 player.graphics();
 monster1.graphics();
 monster2.graphics();
 monster3.graphics();
 monster4.graphics();
 
 collisionCheck(player.getxScreenCordinate(), player.getyScreenCordinate(), monster1.getxScreenCordinate(), monster1.getyScreenCordinate(), monster1);
 collisionCheck(player.getxScreenCordinate(), player.getyScreenCordinate(), monster2.getxScreenCordinate(), monster2.getyScreenCordinate(), monster2);
 collisionCheck(player.getxScreenCordinate(), player.getyScreenCordinate(), monster3.getxScreenCordinate(), monster3.getyScreenCordinate(), monster3);
 collisionCheck(player.getxScreenCordinate(), player.getyScreenCordinate(), monster4.getxScreenCordinate(), monster4.getyScreenCordinate(), monster4);
 
 eating();


 translate(0, 0, 30);
 fill(255);
 textSize(16);
 text(points + "                       Deaths: " + deaths,size/6, size/6);
 translate(0, 0, -30);
 
 } else {
   translate(0, 0, 10);
   fill(255);
   textSize(200);
   if (!endTextHasBeenDone) {
     text("DEAD", 20, size/2);
     endTextHasBeenDone = true;
   }
   translate(0, 0, -10);
 }
  
}

void controllerInput(){
  if (keyPressed == false) {
    player.liike(0);
  } else {
      if (keyCode == UP){ 
      player.liike(1);
    } else if (keyCode == RIGHT){
      player.liike(2);
    } else if (keyCode == DOWN){
      player.liike(3);
    } else if (keyCode == LEFT){
      player.liike(4);
    } else if (keyCode == ENTER){
      player.liike(0);
    } else {
      player.liike(0);
    }
  }
  
}


void collisionCheck(float x1, float y1, float x2, float y2, Monster monster) {
  /*translate(0,0,1);
  strokeWeight(4);
  fill(255,120,120);
  point(x1,y1);
  point(x2,y2);
  strokeWeight(1);
  translate(0,0,-1);*/
  
  if(sqrt(pow(x1-x2,2) + pow(y1-y2,2)) < piece/1.3) {
    if (!player.getPowerMode()) {
      println("kuoli pois");
      alive = false;
    } else {
        monster.kill();
        println("eated monster");
    }
  }
}

void eating() {
  if (labyrinth.mitaKohdassa(player.getxCoordinate(), player.getyCoordinate()) == 2) {
    points += 10;
    labyrinth.asetaKohta(player.getxCoordinate(), player.getyCoordinate(), 0);
  } else if (labyrinth.mitaKohdassa(player.getxCoordinate(), player.getyCoordinate()) == 4) {
    player.powerModeOn();
    labyrinth.asetaKohta(player.getxCoordinate(), player.getyCoordinate(), 0);
    player.ateMonster();
    points += player.getMonstersEatenThisPowerMode() *200;
    if (player.getMonstersEatenThisPowerMode() == 4) { points += 12000; }
  }
  
  
}

void keyPressed() {
  if (keyCode == CONTROL) {
    threeD = !threeD;
  }
  if (keyCode == ENTER) {
    player.reset(xFromLeftCorner + 9, yFromLeftCorner + 12);
    monster1.reset(xFromLeftCorner + 1, yFromLeftCorner + 1);
    monster2.reset(xFromLeftCorner + 17, yFromLeftCorner + 1);
    monster3.reset(xFromLeftCorner + 1, yFromLeftCorner + 20);
    monster4.reset(xFromLeftCorner + 17, yFromLeftCorner + 20);
    alive = true;
    deaths++;
  }
}