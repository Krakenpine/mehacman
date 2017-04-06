class Monster {
  float xPiirto;
  float yPiirto;
  int x;
  int y;
  int xTavoite;
  int yTavoite;
  boolean hasTavoite = false;
  int suunta; //0=seis, 1=ylös, 2=oikealle, 3=alas, 4=vasemmalle
  int haluttuSuunta = 0; //0=seis, 1=ylös, 2=oikealle, 3=alas, 4=vasemmalle
  int tavoitteenSuunta = 0;
  int edellinenSuunta = 0;
  Labyrinth labyrinth;
  boolean liikkuu = false;
  float subTilePosition = 0;
  Player player;
  int tyyppi;
  Monster buddy;
  
  Monster(float xKoordinaatti, float yKoordinaatti, int alkuTavoiteX, int alkuTavoiteY, Labyrinth labyrinth, Player player, int tyyppi){
    this.xPiirto = xKoordinaatti * piece;
    this.yPiirto = yKoordinaatti * piece;
    this.x = int(xKoordinaatti);
    this.y = int(yKoordinaatti);
    this.xTavoite = alkuTavoiteX;
    this.yTavoite = alkuTavoiteY;
    this.labyrinth = labyrinth;
    this.player = player;
    this.tyyppi = tyyppi;
  }
  
  Monster(float xKoordinaatti, float yKoordinaatti, int alkuTavoiteX, int alkuTavoiteY, Labyrinth labyrinth, Player player, int tyyppi, Monster buddy){
    this.xPiirto = xKoordinaatti * piece;
    this.yPiirto = yKoordinaatti * piece;
    this.x = int(xKoordinaatti);
    this.y = int(yKoordinaatti);
    this.xTavoite = alkuTavoiteX;
    this.yTavoite = alkuTavoiteY;
    this.labyrinth = labyrinth;
    this.player = player;
    this.tyyppi = tyyppi;
    this.buddy = buddy;
  }
  

  void piirra() {
    fill(0,255,0);

    float directionAddX = 0;
    float directionAddY = 0;
    if (suunta == 1) { directionAddY = piece * (subTilePosition / 1000) * (-1); }
    if (suunta == 2) { directionAddX = piece * (subTilePosition / 1000) * (1); }
    if (suunta == 3) { directionAddY = piece * (subTilePosition / 1000) * (1); }
    if (suunta == 4) { directionAddX = piece * (subTilePosition / 1000) * (-1); }
    
    if (this.tyyppi == 1) { fill(255,0,0); }
    if (this.tyyppi == 2) { fill(0,0,180); }
    if (this.tyyppi == 3) { fill(0,255,0); }
    if (this.tyyppi == 4) { fill(120,0,120); }
    
   if (threeD) {
      translate(this.x*piece+piece+directionAddX, this.y*piece+directionAddY, this.tyyppi);
      box(piece+0.25*this.tyyppi);
      translate(-this.x*piece-piece-directionAddX, -this.y*piece-directionAddY, -this.tyyppi);
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
      if (suunta == 1) { eyesY = -piece/16; }
      if (suunta == 2) { eyesX = piece/16; }
      if (suunta == 3) { eyesY = piece/16; }
      if (suunta == 4) { eyesX = -piece/16; }
      ellipse(this.x*piece+directionAddX+(piece/8)*2 + eyesX, this.y*piece+directionAddY+(piece/8)*3.5 + eyesY, (piece/8)*1, (piece/5)*1);
      ellipse(this.x*piece+directionAddX+(piece/8)*6 + eyesX, this.y*piece+directionAddY+(piece/8)*3.5 + eyesY, (piece/8)*1, (piece/5)*1);
      stroke(0);
      //fill(120,0,0);                          // draw the target block
      //rect(this.xTavoite*piece+2, this.yTavoite*piece+2, piece-4, piece-4);
    }
  }
  
  void tekoAlyttomyys() {
    
    if (this.tyyppi == 1) {
      this.xTavoite = int(this.player.getxKoordinaatti());
      this.yTavoite = int(this.player.getyKoordinaatti());
    }
    
    if (this.tyyppi == 2) {
      this.xTavoite = int(this.player.getxKoordinaatti());
      if (this.player.getEdellinenSuunta() == 2) { this.xTavoite += 4; }
      if (this.player.getEdellinenSuunta() == 4) { this.xTavoite -= 4; }
      this.yTavoite = int(this.player.getyKoordinaatti());
      if (this.player.getEdellinenSuunta() == 1) { this.yTavoite -= 4; }
      if (this.player.getEdellinenSuunta() == 3) { this.yTavoite += 4; }
    }
    
    if (this.tyyppi == 3) {
      int xValiTavoite = int(this.player.getxKoordinaatti());
      if (this.player.getEdellinenSuunta() == 2) { xValiTavoite += 2; }
      if (this.player.getEdellinenSuunta() == 4) { xValiTavoite -= 2; }
      int yValiTavoite = int(this.player.getyKoordinaatti());
      if (this.player.getEdellinenSuunta() == 1) { yValiTavoite -= 2; }
      if (this.player.getEdellinenSuunta() == 3) { yValiTavoite += 2; }
      this.xTavoite = xValiTavoite + xValiTavoite - int(this.buddy.getxKoordinaatti());
      this.yTavoite = yValiTavoite + yValiTavoite - int(this.buddy.getyKoordinaatti());
    }
    
    if (this.tyyppi == 4) {
      if (sqrt(pow(this.x-this.player.getxKoordinaatti(),2) + pow(this.y-this.player.getyKoordinaatti(),2)) <= 8) {
        this.xTavoite = 8;
        this.yTavoite = 25;
      } else {
        this.xTavoite = int(this.player.getxKoordinaatti());
        this.yTavoite = int(this.player.getyKoordinaatti());
      }
    }
            
    
    if (!this.liikkuu) {
      float etaisyysTavoitteeseenYlapuolelta = sqrt(pow((this.x-this.xTavoite),2) + pow((this.y-1-this.yTavoite),2));
      float etaisyysTavoitteeseenVasemmalta = sqrt(pow((this.x-1-this.xTavoite),2) + pow((this.y-this.yTavoite),2));
      float etaisyysTavoitteeseenAlapuolelta = sqrt(pow((this.x-this.xTavoite),2) + pow((this.y+1-this.yTavoite),2));
      float etaisyysTavoitteeseenOikealta = sqrt(pow((this.x+1-this.xTavoite),2) + pow((this.y-this.yTavoite),2));
      
      if (this.labyrinth.mitaKohdassa(this.x, this.y-1) == 1 || this.edellinenSuunta == 3) { etaisyysTavoitteeseenYlapuolelta = 1000; }
      if (this.labyrinth.mitaKohdassa(this.x-1, this.y) == 1 || this.edellinenSuunta == 2) { etaisyysTavoitteeseenVasemmalta = 1000; }
      if (this.labyrinth.mitaKohdassa(this.x, this.y+1) == 1 || this.edellinenSuunta == 1) { etaisyysTavoitteeseenAlapuolelta = 1000; }
      if (this.labyrinth.mitaKohdassa(this.x+1, this.y) == 1 || this.edellinenSuunta == 4) { etaisyysTavoitteeseenOikealta = 1000; }
    
      float[] etaisyydet = {etaisyysTavoitteeseenYlapuolelta, etaisyysTavoitteeseenVasemmalta, etaisyysTavoitteeseenAlapuolelta, etaisyysTavoitteeseenOikealta};
      
      float pieninEtaisyys = min(etaisyydet);
      
      if (pieninEtaisyys == etaisyysTavoitteeseenYlapuolelta) { this.suunta = 1; this.edellinenSuunta = 1; }
      if (pieninEtaisyys == etaisyysTavoitteeseenVasemmalta) { this.suunta = 4; this.edellinenSuunta = 4;}
      if (pieninEtaisyys == etaisyysTavoitteeseenAlapuolelta) { this.suunta = 3; this.edellinenSuunta = 3;}
      if (pieninEtaisyys == etaisyysTavoitteeseenOikealta) { this.suunta = 2; this.edellinenSuunta = 2;}
      this.liikkuu = true;
    }
      float speed = 1.5;
      if (this.tyyppi == 1) { speed = 1.65; }
      this.subTilePosition += 1000 / frameRate*speed;
        if (this.subTilePosition >= 1000) {
          if (this.suunta == 1) { this.y--; }  
          if (this.suunta == 2) { this.x++; }
          if (this.suunta == 3) { this.y++; }
          if (this.suunta == 4) { this.x--; }
          subTilePosition = 0;
          this.liikkuu = false;
          this.suunta = 0;
          //println("Hirviön pitäisi pysähtyä");
        }
    if (this.x <= 6) { this.x = 23; } //teleport left
    if (this.x >= 24) { this.x = 7; } //teleport right
  }
  
  
 
 int getxKoordinaatti() {
   return this.x;
  }
  
 int getyKoordinaatti() {
   return this.y;
  }
  
  float getxScreenCordinate() {
    float directionAddX = 0;
    if (suunta == 2) { directionAddX = piece * (subTilePosition / 1000) * (1); }
    if (suunta == 4) { directionAddX = piece * (subTilePosition / 1000) * (-1); }
    return this.x*piece+(piece/2) + directionAddX;
  }
  
  float getyScreenCordinate() {
    float directionAddY = 0;
    if (suunta == 1) { directionAddY = piece * (subTilePosition / 1000) * (-1); }
    if (suunta == 3) { directionAddY = piece * (subTilePosition / 1000) * (1); }
    return this.y*piece+(piece/2) + directionAddY;
  }
  
  void reset(int x, int y) {
    this.x = x;
    this.y = y;
  }
}