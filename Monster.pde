class Monster {
  float xDraw;
  float yDraw;
  int x;
  int y;
  int xTarget;
  int yTarget;
  boolean hasTavoite = false;
  int direction; //0=seis, 1=ylös, 2=oikealle, 3=alas, 4=vasemmalle
  int haluttuSuunta = 0; //0=seis, 1=ylös, 2=oikealle, 3=alas, 4=vasemmalle
  int tavoitteenSuunta = 0;
  int previousDirection = 0;
  Labyrinth labyrinth;
  boolean liikkuu = false;
  float subTilePosition = 0;
  Player player;
  int type;
  Monster buddy;
  boolean panicMode = false;
  
  Monster(float xKoordinaatti, float yKoordinaatti, int alkuTavoiteX, int alkuTavoiteY, Labyrinth labyrinth, Player player, int type){
    this.xDraw = xKoordinaatti * piece;
    this.yDraw = yKoordinaatti * piece;
    this.x = int(xKoordinaatti);
    this.y = int(yKoordinaatti);
    this.xTarget = alkuTavoiteX;
    this.yTarget = alkuTavoiteY;
    this.labyrinth = labyrinth;
    this.player = player;
    this.type = type;
  }
  
  Monster(float xKoordinaatti, float yKoordinaatti, int alkuTavoiteX, int alkuTavoiteY, Labyrinth labyrinth, Player player, int type, Monster buddy){
    this.xDraw = xKoordinaatti * piece;
    this.yDraw = yKoordinaatti * piece;
    this.x = int(xKoordinaatti);
    this.y = int(yKoordinaatti);
    this.xTarget = alkuTavoiteX;
    this.yTarget = alkuTavoiteY;
    this.labyrinth = labyrinth;
    this.player = player;
    this.type = type;
    this.buddy = buddy;
  }
  

  void graphics() {
    fill(0,255,0);

    float directionAddX = 0;
    float directionAddY = 0;
    if (direction == 1) { directionAddY = piece * (subTilePosition / 1000) * (-1); }
    if (direction == 2) { directionAddX = piece * (subTilePosition / 1000) * (1); }
    if (direction == 3) { directionAddY = piece * (subTilePosition / 1000) * (1); }
    if (direction == 4) { directionAddX = piece * (subTilePosition / 1000) * (-1); }
    
    if (this.type == 1) { fill(255,0,0); }
    if (this.type == 2) { fill(0,0,180); }
    if (this.type == 3) { fill(0,255,0); }
    if (this.type == 4) { fill(120,0,120); }
    if (this.player.getPowerMode()) { fill(150,150,255); } 
    
   if (threeD) {
      translate(this.x*piece+piece+directionAddX, this.y*piece+directionAddY, this.type);
      box(piece+0.25*this.type);
      translate(-this.x*piece-piece-directionAddX, -this.y*piece-directionAddY, -this.type);
    } else {
      noStroke();
      rect(this.x*piece+directionAddX, this.y*piece+directionAddY+(piece/5)*2, piece, (piece/4)*2);  
      ellipse(this.x*piece+directionAddX+piece/2, this.y*piece+directionAddY+(piece/5)*2, piece, (piece/5)*3);
      ellipse(this.x*piece+directionAddX+(piece/8)*1.2, this.y*piece+directionAddY+(piece/8)*7, (piece/5)*1.5, (piece/5)*1.2);
      ellipse(this.x*piece+directionAddX+(piece/8)*4, this.y*piece+directionAddY+(piece/8)*7, (piece/5)*1.5, (piece/5)*1.2);
      ellipse(this.x*piece+directionAddX+(piece/8)*6.8, this.y*piece+directionAddY+(piece/8)*7, (piece/5)*1.5, (piece/5)*1.2);
      fill(255);
      stroke(0);
      ellipse(this.x*piece+directionAddX+(piece/8)*2, this.y*piece+directionAddY+(piece/8)*3.5, (piece/8)*2, (piece/5)*2);
      ellipse(this.x*piece+directionAddX+(piece/8)*6, this.y*piece+directionAddY+(piece/8)*3.5, (piece/8)*2, (piece/5)*2);
      fill(0);
      float eyesX = 0;
      float eyesY = 0;
      if (direction == 1) { eyesY = -piece/16; }
      if (direction == 2) { eyesX = piece/16; }
      if (direction == 3) { eyesY = piece/16; }
      if (direction == 4) { eyesX = -piece/16; }
      ellipse(this.x*piece+directionAddX+(piece/8)*2 + eyesX, this.y*piece+directionAddY+(piece/8)*3.5 + eyesY, (piece/8)*1, (piece/5)*1);
      ellipse(this.x*piece+directionAddX+(piece/8)*6 + eyesX, this.y*piece+directionAddY+(piece/8)*3.5 + eyesY, (piece/8)*1, (piece/5)*1);
      stroke(0);
      //fill(120,0,0);                          // draw the target block
      //rect(this.xTarget*piece+2, this.yTarget*piece+2, piece-4, piece-4);
    }
  }
  
  void artificialUnintelligence() {
    if (this.player.getPowerMode()) { this.panicMode = true; }
    else { this.panicMode = false; }
    
    
    if (this.type == 1) {
      this.xTarget = int(this.player.getxCoordinate());
      this.yTarget = int(this.player.getyCoordinate());
    }
    
    if (this.type == 2) {
      this.xTarget = int(this.player.getxCoordinate());
      if (this.player.getEdellinenSuunta() == 2) { this.xTarget += 4; }
      if (this.player.getEdellinenSuunta() == 4) { this.xTarget -= 4; }
      this.yTarget = int(this.player.getyCoordinate());
      if (this.player.getEdellinenSuunta() == 1) { this.yTarget -= 4; }
      if (this.player.getEdellinenSuunta() == 3) { this.yTarget += 4; }
    }
    
    if (this.type == 3) {
      int xValiTavoite = int(this.player.getxCoordinate());
      if (this.player.getEdellinenSuunta() == 2) { xValiTavoite += 2; }
      if (this.player.getEdellinenSuunta() == 4) { xValiTavoite -= 2; }
      int yValiTavoite = int(this.player.getyCoordinate());
      if (this.player.getEdellinenSuunta() == 1) { yValiTavoite -= 2; }
      if (this.player.getEdellinenSuunta() == 3) { yValiTavoite += 2; }
      this.xTarget = xValiTavoite + xValiTavoite - int(this.buddy.getxCoordinate());
      this.yTarget = yValiTavoite + yValiTavoite - int(this.buddy.getyCoordinate());
    }
    
    if (this.type == 4) {
      if (sqrt(pow(this.x-this.player.getxCoordinate(),2) + pow(this.y-this.player.getyCoordinate(),2)) <= 8) {
        this.xTarget = 8;
        this.yTarget = 25;
      } else {
        this.xTarget = int(this.player.getxCoordinate());
        this.yTarget = int(this.player.getyCoordinate());
      }
    }
    
    if (this.panicMode) { //todo: maybe this doesn't need to calculate everything when panicmode just overrides everything else...
      this.xTarget = int(random(30));
      this.yTarget = int(random(30));
    }
            
    
    if (!this.liikkuu) {
      float etaisyysTavoitteeseenYlapuolelta = sqrt(pow((this.x-this.xTarget),2) + pow((this.y-1-this.yTarget),2));
      float etaisyysTavoitteeseenVasemmalta = sqrt(pow((this.x-1-this.xTarget),2) + pow((this.y-this.yTarget),2));
      float etaisyysTavoitteeseenAlapuolelta = sqrt(pow((this.x-this.xTarget),2) + pow((this.y+1-this.yTarget),2));
      float etaisyysTavoitteeseenOikealta = sqrt(pow((this.x+1-this.xTarget),2) + pow((this.y-this.yTarget),2));
      
      if (this.labyrinth.mitaKohdassa(this.x, this.y-1) == 1 || this.labyrinth.mitaKohdassa(this.x, this.y-1) == 5 || this.previousDirection == 3) { etaisyysTavoitteeseenYlapuolelta = 1000; }
      if (this.labyrinth.mitaKohdassa(this.x-1, this.y) == 1 || this.labyrinth.mitaKohdassa(this.x-1, this.y) == 5 || this.previousDirection == 2) { etaisyysTavoitteeseenVasemmalta = 1000; }
      if (this.labyrinth.mitaKohdassa(this.x, this.y+1) == 1 || this.labyrinth.mitaKohdassa(this.x, this.y+1) == 5 || this.previousDirection == 1) { etaisyysTavoitteeseenAlapuolelta = 1000; }
      if (this.labyrinth.mitaKohdassa(this.x+1, this.y) == 1 || this.labyrinth.mitaKohdassa(this.x+1, this.y) == 5 || this.previousDirection == 4) { etaisyysTavoitteeseenOikealta = 1000; }
    
      float[] etaisyydet = {etaisyysTavoitteeseenYlapuolelta, etaisyysTavoitteeseenVasemmalta, etaisyysTavoitteeseenAlapuolelta, etaisyysTavoitteeseenOikealta};
      
      float pieninEtaisyys = min(etaisyydet);
      
      if (pieninEtaisyys == etaisyysTavoitteeseenYlapuolelta) { this.direction = 1; this.previousDirection = 1; }
      if (pieninEtaisyys == etaisyysTavoitteeseenVasemmalta) { this.direction = 4; this.previousDirection = 4;}
      if (pieninEtaisyys == etaisyysTavoitteeseenAlapuolelta) { this.direction = 3; this.previousDirection = 3;}
      if (pieninEtaisyys == etaisyysTavoitteeseenOikealta) { this.direction = 2; this.previousDirection = 2;}
      if (this.labyrinth.mitaKohdassa(this.x, this.y) == 5) { this.direction = 1; this.previousDirection = 1; }   //get them out of the middle box
      if (this.labyrinth.mitaKohdassa(this.x, this.y) == 6) { this.direction = 2; this.previousDirection = 2; }
      if (this.labyrinth.mitaKohdassa(this.x, this.y) == 7) { this.direction = 4; this.previousDirection = 4; }
      this.liikkuu = true;
      

    }
      float speed = 1.5;
      if (this.type == 1) { speed = 1.65; }
      this.subTilePosition += 1000 / frameRate*speed;
        if (this.subTilePosition >= 1000) {
          if (this.direction == 1) { this.y--; }  
          if (this.direction == 2) { this.x++; }
          if (this.direction == 3) { this.y++; }
          if (this.direction == 4) { this.x--; }
          subTilePosition = 0;
          this.liikkuu = false;
          this.direction = 0;
        }
    if (this.x <= 6) { this.x = 23; } //teleport left
    if (this.x >= 24) { this.x = 7; } //teleport right
  }
  
 
 int getxCoordinate() {
   return this.x;
  }
  
 int getyCoordinate() {
   return this.y;
  }
  
  float getxScreenCordinate() {
    float directionAddX = 0;
    if (direction == 2) { directionAddX = piece * (subTilePosition / 1000) * (1); }
    if (direction == 4) { directionAddX = piece * (subTilePosition / 1000) * (-1); }
    return this.x*piece+(piece/2) + directionAddX;
  }
  
  float getyScreenCordinate() {
    float directionAddY = 0;
    if (direction == 1) { directionAddY = piece * (subTilePosition / 1000) * (-1); }
    if (direction == 3) { directionAddY = piece * (subTilePosition / 1000) * (1); }
    return this.y*piece+(piece/2) + directionAddY;
  }
  
  void reset(int x, int y) {
    this.x = x;
    this.y = y;
    this.subTilePosition = 0;
    this.direction = 0;
  }
  
  void kill() {
    if (this.type == 1) { reset(15, 15); }
    if (this.type == 2) { reset(14, 16); }
    if (this.type == 3) { reset(15, 16); }
    if (this.type == 4) { reset(16, 16); }
    
  }
}