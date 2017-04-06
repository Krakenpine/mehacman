class Player {
  int x;
  int y;
  int suunta; //0=seis, 1=ylös, 2=oikealle, 3=alas, 4=vasemmalle
  boolean suuntaX = true;
  boolean suuntaY = false;
  float subTilePosition = 0; // 0-1000, 1000 or over is at new tile
  boolean isMoving = false;
  Labyrinth labyrinth;
  int edellinenSuunta;
  
  Player(int x, int y, Labyrinth labyrinth){
    this.labyrinth = labyrinth;
    this.x = x;
    this.y = y;
  }
  
  void piirra(){
    noStroke();
    fill(255,255,0);
    float directionAddX = 0;
    float directionAddY = 0;
    if (suunta == 1) { directionAddY = piece * (subTilePosition / 1000) * (-1); }
    if (suunta == 2) { directionAddX = piece * (subTilePosition / 1000) * (1); }
    if (suunta == 3) { directionAddY = piece * (subTilePosition / 1000) * (1); }
    if (suunta == 4) { directionAddX = piece * (subTilePosition / 1000) * (-1); }
    
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
      if( edellinenSuunta == 1) { rotate(PI/2); }
      if( edellinenSuunta == 2) { rotate(PI); }
      if( edellinenSuunta == 3) { rotate(3*(PI/2)); }

      beginShape();
      vertex(p8*anim-piece/2, p4 -p16 + (p4+p8)*anim -piece/2);
      bezierVertex(piece-piece/2, -3*p4-piece/2, 6*p4-piece/2, 7*p4-piece/2, p8*anim-piece/2, 3*p4+p16-p4*anim-piece/2);
      bezierVertex(piece - p2*anim-piece/2, 3*p4-piece/2, p2-piece/2, p4-piece/2, p8*anim-piece/2, p4 -p16 + (p4+p8)*anim-piece/2);
      endShape();
      if( edellinenSuunta == 1) { rotate(-PI/2); }
      if( edellinenSuunta == 2) { rotate(-PI); }
      if( edellinenSuunta == 3) { rotate(-3*(PI/2)); }
      translate(-pX-piece/2, -pY-piece/2, 0);
      if (suunta != 0) {
        if (animationDirection) { animation += animationSpeed; } else { animation -= animationSpeed; }
      }
      if (animation < 0) { animation = 0; animationDirection = true; }
      if (animation > 1000) { animation = 1000; animationDirection = false; }
      
    }

    stroke(0);
  }
  
  void move() {
    if (isMoving) {
        subTilePosition += 1000 / frameRate*2;
        if (subTilePosition >= 1000) {
          if (suunta == 1) { this.y--; }  
          if (suunta == 2) { this.x++; }
          if (suunta == 3) { this.y++; }
          if (suunta == 4) { this.x--; }
          subTilePosition = 0;
          isMoving = false;
          this.suunta = 0;
        }
    }
    if (this.x <= 6) { this.x = 23; } //teleport left
    if (this.x >= 24) { this.x = 7; } //teleport right
    
  }
  
  void liike(int suunta){
    if (!isMoving) {
      if (suunta != 0) {
        isMoving = true;
      }
      if (suunta == 1) {
        if (this.labyrinth.mitaKohdassa(this.x, this.y-1) != 1) { this.suunta = suunta; this.edellinenSuunta = suunta;}  
      }
      if (suunta == 2) {
        if (this.labyrinth.mitaKohdassa(this.x+1, this.y) != 1) { this.suunta = suunta; this.edellinenSuunta = suunta;}  
      }
      if (suunta == 3) {
        if (this.labyrinth.mitaKohdassa(this.x, this.y+1) != 1) { this.suunta = suunta; this.edellinenSuunta = suunta;}  
      }
      if (suunta == 4) {
        if (this.labyrinth.mitaKohdassa(this.x-1, this.y) != 1) { this.suunta = suunta; this.edellinenSuunta = suunta;}  
      }
    }
    
  }
  
  int getxKoordinaatti(){
    return this.x;
  }
  
  int getyKoordinaatti(){
    return this.y;
  }
  
  int getSuunta(){
    return this.suunta;
  }
  
  int getEdellinenSuunta(){
    return this.edellinenSuunta;
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
  
  void reset(int x, int y){
    this.x = x;
    this.y = y;
    this.subTilePosition = 0;
    this.suunta = 0;
    }
  
}