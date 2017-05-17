class Player {
  int x;
  int y;
  int direction; //0=seis, 1=ylös, 2=oikealle, 3=alas, 4=vasemmalle
  boolean directionX = true;
  boolean directionY = false;
  float subTilePosition = 0; // 0-1000, 1000 or over is at new tile
  boolean isMoving = false;
  Labyrinth labyrinth;
  int previousDirection;
  boolean powerMode = false;
  int powerModeCounter = 0;
  int monstersEatenThisPowerMode = 0;
  
  Player(int x, int y, Labyrinth labyrinth){
    this.labyrinth = labyrinth;
    this.x = x;
    this.y = y;
  }
  
  void graphics(){
    noStroke();
    fill(255,255,0);
    float directionAddX = 0;
    float directionAddY = 0;
    if (direction == 1) { directionAddY = piece * (subTilePosition / 1000) * (-1); }
    if (direction == 2) { directionAddX = piece * (subTilePosition / 1000) * (1); }
    if (direction == 3) { directionAddY = piece * (subTilePosition / 1000) * (1); }
    if (direction == 4) { directionAddX = piece * (subTilePosition / 1000) * (-1); }
    
    if (threeD) {
      translate(this.x*piece+piece+directionAddX, this.y*piece+directionAddY, 0);
      directionalLight(255, 0, 0, 0, 1, -1);
      sphere(piece/2);
      translate(-this.x*piece-piece-directionAddX, -this.y*piece-directionAddY, 0);  
    } else {
      float pX = this.x*piece + directionAddX;
      float pY = this.y*piece + directionAddY;
      float p2 = piece/2;
      float p4 = piece/4; //muuttuja
      float p8 = piece/8; //muuttuja/2
      float p16 = piece/16; //muuttuja/4
      float anim = animation / 1000;
      stroke(0);
      //ellipse(this.x*piece+(piece/2) + directionAddX, this.y*piece+(piece/2) + directionAddY, piece, piece);
      translate(pX+piece/2, pY+piece/2, 0);
      if( previousDirection == 1) { rotate(PI/2); }
      if( previousDirection == 2) { rotate(PI); }
      if( previousDirection == 3) { rotate(3*(PI/2)); }

      beginShape();
      vertex(p8*anim-piece/2, p4 -p16 + (p4+p8)*anim -piece/2);
      bezierVertex(piece-piece/2, -3*p4-piece/2, 6*p4-piece/2, 7*p4-piece/2, p8*anim-piece/2, 3*p4+p16-p4*anim-piece/2);
      bezierVertex(piece - p2*anim-piece/2, 3*p4-piece/2, p2-piece/2, p4-piece/2, p8*anim-piece/2, p4 -p16 + (p4+p8)*anim-piece/2);
      endShape();
      if( previousDirection == 1) { rotate(-PI/2); }
      if( previousDirection == 2) { rotate(-PI); }
      if( previousDirection == 3) { rotate(-3*(PI/2)); }
      translate(-pX-piece/2, -pY-piece/2, 0);
      if (direction != 0) {
        if (animationDirection) { animation += animationSpeed; } else { animation -= animationSpeed; }
      }
      if (animation < 0) { animation = 0; animationDirection = true; }
      if (animation > 1000) { animation = 1000; animationDirection = false; }
      
    }

    stroke(0);
  }
  
  void move() {
    if (this.powerMode == true) {
      this.powerModeCounter--;
      if (this.powerModeCounter <= 0) {
        this.powerMode = false;
      }
    }
    if (isMoving) {
        subTilePosition += 1000 / frameRate*2;
        if (subTilePosition >= 1000) {
          if (direction == 1) { this.y--; }  
          if (direction == 2) { this.x++; }
          if (direction == 3) { this.y++; }
          if (direction == 4) { this.x--; }
          subTilePosition = 0;
          isMoving = false;
          this.direction = 0;
        }
    }
    if (this.x <= 6) { this.x = 23; } //teleport left
    if (this.x >= 24) { this.x = 7; } //teleport right
    
  }
  
  void liike(int direction){
    if (!isMoving) {
      if (direction != 0) {
        isMoving = true;
      }
      if (direction == 1) {
        if (this.labyrinth.mitaKohdassa(this.x, this.y-1) != 1) { this.direction = direction; this.previousDirection = direction;}  
      }
      if (direction == 2) {
        if (this.labyrinth.mitaKohdassa(this.x+1, this.y) != 1) { this.direction = direction; this.previousDirection = direction;}  
      }
      if (direction == 3) {
        if (this.labyrinth.mitaKohdassa(this.x, this.y+1) != 1) { this.direction = direction; this.previousDirection = direction;}  
      }
      if (direction == 4) {
        if (this.labyrinth.mitaKohdassa(this.x-1, this.y) != 1) { this.direction = direction; this.previousDirection = direction;}  
      }
    }
    
  }
  
  int getxCoordinate(){
    return this.x;
  }
  
  int getyCoordinate(){
    return this.y;
  }
  
  int getSuunta(){
    return this.direction;
  }
  
  int getEdellinenSuunta(){
    return this.previousDirection;
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
  
  boolean getPowerMode() {
    return this.powerMode;  
  }
  
  void powerModeOn() {
    this.powerMode = true;
    this.powerModeCounter = 50 * 60;
    this.monstersEatenThisPowerMode = 0;
  }
  
  void ateMonster(){
    this.monstersEatenThisPowerMode++;  
  }
  
  int getMonstersEatenThisPowerMode() {
    return this.monstersEatenThisPowerMode;
  }
  
  void reset(int x, int y){
    this.x = x;
    this.y = y;
    this.subTilePosition = 0;
    this.direction = 0;
    }
  
}