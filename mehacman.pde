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
boolean gameOn = false;
float introCounter = 1;
PShape frame1;
PShape frame2;
PShape frame3;
PShape frame4;
PShape frame5;
PShape frame6;
PShape frame7;
PShape frame8;
PShape frame9;
PShape frame10;
PShape frame11;
PShape frame12;
PShape frame13;
PShape frame14;
PShape frame15;
PShape frame16;
PShape frame17;
PShape frame18;
PShape frame19;
PShape frame20;
PShape frame21;
PShape frame22;
PShape frame23;
PShape frame24;
PShape frame25;
PShape frame26;
PShape frame27;
PShape frame28;
PShape frame29;
PShape frame30;
PShape[] pelaajaAnimaatio = new PShape[30];
int animaatioCounter = 0;
boolean animaatioSuunta = true;
float noiseValue1 = 0;
float noiseValue2 = 0;
float noiseValue3 = 0;
float backgroundColor1 = 0;
float backgroundColor2 = 0;
float backgroundColor3 = 0;
boolean BGCreached1 = false;
boolean BGCreached2 = false;
boolean BGCreached3 = false;


void setup(){
  size(1024, 1024, P3D); //put size here manually because Processing
  fill(0);
  labyrinth = new Labyrinth();
  player = new Player(xFromLeftCorner + 9, yFromLeftCorner + 12, labyrinth);
  monster1 = new Monster(xFromLeftCorner + 1, yFromLeftCorner + 1, 10, 10, labyrinth, player, 1);
  monster2 = new Monster(xFromLeftCorner + 17, yFromLeftCorner + 1, 20, 10, labyrinth, player, 2);
  monster3 = new Monster(xFromLeftCorner + 1, yFromLeftCorner + 20, 10, 20, labyrinth, player, 3, monster1);
  monster4 = new Monster(xFromLeftCorner + 17, yFromLeftCorner + 20, 20, 20, labyrinth, player, 4);
  
  frame1 = loadShape("1.svg");    //TODO: make this player animation loading stuff much prettier
  frame2 = loadShape("2.svg");
  frame3 = loadShape("3.svg");
  frame4 = loadShape("4.svg");
  frame5 = loadShape("5.svg");
  frame6 = loadShape("6.svg");
  frame7 = loadShape("7.svg");
  frame8 = loadShape("8.svg");
  frame9 = loadShape("9.svg");
  frame10 = loadShape("10.svg");
  frame11 = loadShape("11.svg");
  frame12 = loadShape("12.svg");
  frame13 = loadShape("13.svg");
  frame14 = loadShape("14.svg");
  frame15 = loadShape("15.svg");
  frame16 = loadShape("16.svg");
  frame17 = loadShape("17.svg");
  frame18 = loadShape("18.svg");
  frame19 = loadShape("19.svg");
  frame20 = loadShape("20.svg");
  frame21 = loadShape("21.svg");
  frame22 = loadShape("22.svg");
  frame23 = loadShape("23.svg");
  frame24 = loadShape("24.svg");
  frame25 = loadShape("25.svg");
  frame26 = loadShape("26.svg");
  frame27 = loadShape("27.svg");
  frame28 = loadShape("28.svg");
  frame29 = loadShape("29.svg");
  frame30 = loadShape("30.svg");
  frame1.setStroke(color(0));
  frame1.setStrokeWeight(1);
  frame2.setStroke(color(0));
  frame2.setStrokeWeight(1);
  frame3.setStroke(color(0));
  frame3.setStrokeWeight(1);
  frame4.setStroke(color(0));
  frame4.setStrokeWeight(1);
  frame5.setStroke(color(0));
  frame5.setStrokeWeight(1);
  frame6.setStroke(color(0));
  frame6.setStrokeWeight(1);
  frame7.setStroke(color(0));
  frame7.setStrokeWeight(1);
  frame8.setStroke(color(0));
  frame8.setStrokeWeight(1);
  frame9.setStroke(color(0));
  frame9.setStrokeWeight(1);
  frame10.setStroke(color(0));
  frame10.setStrokeWeight(1);
  frame11.setStroke(color(0));
  frame11.setStrokeWeight(1);
  frame12.setStroke(color(0));
  frame12.setStrokeWeight(1);
  frame13.setStroke(color(0));
  frame13.setStrokeWeight(1);
  frame14.setStroke(color(0));
  frame14.setStrokeWeight(1);
  frame15.setStroke(color(0));
  frame15.setStrokeWeight(1);
  frame16.setStroke(color(0));
  frame16.setStrokeWeight(1);
  frame17.setStroke(color(0));
  frame17.setStrokeWeight(1);
  frame18.setStroke(color(0));
  frame18.setStrokeWeight(1);
  frame19.setStroke(color(0));
  frame19.setStrokeWeight(1);
  frame20.setStroke(color(0));
  frame20.setStrokeWeight(1);
  frame21.setStroke(color(0));
  frame21.setStrokeWeight(1);
  frame22.setStroke(color(0));
  frame22.setStrokeWeight(1);
  frame23.setStroke(color(0));
  frame23.setStrokeWeight(1);
  frame24.setStroke(color(0));
  frame24.setStrokeWeight(1);
  frame25.setStroke(color(0));
  frame25.setStrokeWeight(1);
  frame26.setStroke(color(0));
  frame26.setStrokeWeight(1);
  frame27.setStroke(color(0));
  frame27.setStrokeWeight(1);
  frame28.setStroke(color(0));
  frame28.setStrokeWeight(1);
  frame29.setStroke(color(0));
  frame29.setStrokeWeight(1);
  frame30.setStroke(color(0));
  frame30.setStrokeWeight(1);
  pelaajaAnimaatio[0] = frame1;
  pelaajaAnimaatio[1] = frame2;
  pelaajaAnimaatio[2] = frame3;
  pelaajaAnimaatio[3] = frame4;
  pelaajaAnimaatio[4] = frame5;
  pelaajaAnimaatio[5] = frame6;
  pelaajaAnimaatio[6] = frame7;
  pelaajaAnimaatio[7] = frame8;
  pelaajaAnimaatio[8] = frame9;
  pelaajaAnimaatio[9] = frame10;
  pelaajaAnimaatio[10] = frame11;
  pelaajaAnimaatio[11] = frame12;
  pelaajaAnimaatio[12] = frame13;
  pelaajaAnimaatio[13] = frame14;
  pelaajaAnimaatio[14] = frame15;
  pelaajaAnimaatio[15] = frame16;
  pelaajaAnimaatio[16] = frame17;
  pelaajaAnimaatio[17] = frame18;
  pelaajaAnimaatio[18] = frame19;
  pelaajaAnimaatio[19] = frame20;
  pelaajaAnimaatio[20] = frame21;
  pelaajaAnimaatio[21] = frame22;
  pelaajaAnimaatio[22] = frame23;
  pelaajaAnimaatio[23] = frame24;
  pelaajaAnimaatio[24] = frame25;
  pelaajaAnimaatio[25] = frame26;
  pelaajaAnimaatio[26] = frame27;
  pelaajaAnimaatio[27] = frame28;
  pelaajaAnimaatio[28] = frame29;
  pelaajaAnimaatio[29] = frame30;
}


void draw(){

 
 if (alive) {
 if (threeD) { translate(0,0,-100); }
 translate(0, 0, -100);
 if (player.getPowerMode()) {
   if (backgroundColor1 >= noise(noiseValue1)*255) { BGCreached1 = true; }
   if (!BGCreached1) { backgroundColor1 += random(2); } else { backgroundColor1 = noise(noiseValue1)*255; }
   
   if (backgroundColor2 >= noise(noiseValue2)*255) { BGCreached2 = true; }
   if (!BGCreached2) { backgroundColor2 += random(2); } else { backgroundColor2 = noise(noiseValue2)*255; }
   
   if (backgroundColor3 >= noise(noiseValue3)*255) { BGCreached3 = true; }
   if (!BGCreached3) { backgroundColor3 += random(2); } else { backgroundColor3 = noise(noiseValue1)*255; }
   
   fill(backgroundColor1, backgroundColor2, backgroundColor3);
   noiseValue1 += random(0.02);
   noiseValue2 += random(0.015);
   noiseValue3 += random(0.011);
 } else {
   fill(0,0,0);
   noiseValue1 = 0;
   noiseValue2 = 0;
   noiseValue3 = 0;
 }
 rect(-size/2,-size/2,size*2,size*2);
 translate(0, 0, 100);
 if (threeD) { translate(0,0,100); }
 controllerInput();
 
 if (!gameOn) {
   intro();  
 }
 
 if (gameOn) {
 player.move();
 
 monster1.artificialUnintelligence();
 monster2.artificialUnintelligence();
 monster3.artificialUnintelligence();
 monster4.artificialUnintelligence();
 }
 
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
  
  if(sqrt(pow(x1-x2,2) + pow(y1-y2,2)) < piece/1.3 ) {
    if (!player.getPowerMode() || !monster.getPanicMode()) {
      println("kuoli pois");
      alive = false;
    } else {
        monster.kill();
        player.ateMonster();
        gotPoints(player.getMonstersEatenThisPowerMode() * 200);
        if (player.getMonstersEatenThisPowerMode() == 4) { gotPoints(12000); }
        println("eated monster");
    }
  }
}

void eating() {
  if (labyrinth.mitaKohdassa(player.getxCoordinate(), player.getyCoordinate()) == 2) {
    gotPoints(10);
    labyrinth.asetaKohta(player.getxCoordinate(), player.getyCoordinate(), 0);
  } else if (labyrinth.mitaKohdassa(player.getxCoordinate(), player.getyCoordinate()) == 4) {
    player.powerModeOn();
    labyrinth.asetaKohta(player.getxCoordinate(), player.getyCoordinate(), 0);

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

void gotPoints(int point) {
  points += point;  
}

void intro(){
  translate(480+piece/2, 576+piece/2, 2);
  rotate(TWO_PI * (1-introCounter)*4);
  
  shapeMode(CENTER);
  shape(pelaajaAnimaatio[15], 0, 0, piece + 600*introCounter, piece + 600*introCounter);
  rotate(-(TWO_PI * (1-introCounter)*4));
  introCounter -= 0.01;
  if (introCounter <= 0) { gameOn = true; }
  
  
  
  translate(-480-piece/2, -576-piece/2, -2);
}