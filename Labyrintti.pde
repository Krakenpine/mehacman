class Labyrinth {
  
 int[] kentta = { 
 3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,
 3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,
 3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,
 3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,
 3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,
 3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,
 3,3,3,3,3,3,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,3,3,3,3,3,3,3,
 3,3,3,3,3,3,1,2,2,2,2,2,2,2,2,1,2,2,2,2,2,2,2,2,1,3,3,3,3,3,3,3,
 3,3,3,3,3,3,1,2,1,1,2,1,1,1,2,1,2,1,1,1,2,1,1,2,1,3,3,3,3,3,3,3,
 3,3,3,3,3,3,1,2,1,1,2,1,1,1,2,1,2,1,1,1,2,1,1,2,1,3,3,3,3,3,3,3,
 3,3,3,3,3,3,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,3,3,3,3,3,3,3,
 3,3,3,3,3,3,1,2,1,1,2,1,2,1,1,1,1,1,2,1,2,1,1,2,1,3,3,3,3,3,3,3,
 3,3,3,3,3,3,1,2,2,2,2,1,2,2,2,1,2,2,2,1,2,2,2,2,1,3,3,3,3,3,3,3,
 3,3,3,3,3,3,1,1,1,1,2,1,1,1,0,1,0,1,1,1,2,1,1,1,1,3,3,3,3,3,3,3,
 3,3,3,3,3,3,0,0,0,1,2,1,0,0,0,0,0,0,0,1,2,1,0,0,0,3,3,3,3,3,3,3,
 3,3,3,3,3,3,1,1,1,1,2,1,0,1,1,0,1,1,0,1,2,1,1,1,1,3,3,3,3,3,3,3,
 3,3,3,3,3,3,0,0,0,0,2,0,0,1,0,0,0,1,0,0,2,0,0,0,0,3,3,3,3,3,3,3,
 3,3,3,3,3,3,1,1,1,1,2,1,0,1,1,1,1,1,0,1,2,1,1,1,1,3,3,3,3,3,3,3,
 3,3,3,3,3,3,0,0,0,1,2,1,0,0,0,0,0,0,0,1,2,1,0,0,0,3,3,3,3,3,3,3,
 3,3,3,3,3,3,1,1,1,1,2,1,0,1,1,1,1,1,0,1,2,1,1,1,1,3,3,3,3,3,3,3,
 3,3,3,3,3,3,1,2,2,2,2,2,2,2,2,1,2,2,2,2,2,2,2,2,1,3,3,3,3,3,3,3,
 3,3,3,3,3,3,1,2,1,1,2,1,1,1,2,1,2,1,1,1,2,1,1,2,1,3,3,3,3,3,3,3,
 3,3,3,3,3,3,1,2,2,1,2,2,2,2,2,2,2,2,2,2,2,1,2,2,1,3,3,3,3,3,3,3,
 3,3,3,3,3,3,1,1,2,1,2,1,2,1,1,1,1,1,2,1,2,1,2,1,1,3,3,3,3,3,3,3,
 3,3,3,3,3,3,1,2,2,2,2,1,2,2,2,1,2,2,2,1,2,2,2,2,1,3,3,3,3,3,3,3,
 3,3,3,3,3,3,1,2,1,1,1,1,1,1,2,1,2,1,1,1,1,1,1,2,1,3,3,3,3,3,3,3,
 3,3,3,3,3,3,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,3,3,3,3,3,3,3,
 3,3,3,3,3,3,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,3,3,3,3,3,3,3,
 3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,
 3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,
 3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,
 3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3
 };
  
 Labyrinth(){

 }
 
 void piirra(Player player) {
    float pelaajanEtaisyysKeskelta = sqrt((size/2 - player.getxScreenCordinate())*(size/2 - player.getxScreenCordinate()) + (size/2 - player.getyScreenCordinate()) * (size/2 - player.getyScreenCordinate()));
   
   fill(0);
   if (threeD) {
     lights();
     perspective(PI/(3.0+(pelaajanEtaisyysKeskelta/((size/3)*2))), 1, size/4, size*2);
     directionalLight(200, 200, 255, 0.5, 0.5, -1);
     translate(size/2, size/2, 0);
     rotateX(((player.getyScreenCordinate()-(size/2))/(size/2))*TWO_PI*0.1);
     rotateY(-((player.getxScreenCordinate()-(size/2))/(size/2))*TWO_PI*0.1);

     translate(-size/2, -size/2, 20);
   }
      for (int yIt = 0; yIt < 32; yIt++) {
     for (int xIt = 0; xIt < 32; xIt++) {
       int kohta = xIt + yIt*32;
       
       fill(0,0,0);
       
       if (this.kentta[kohta] == 1) {
         fill(0,0,255);
         if (!threeD) {rect(xIt*piece, yIt*piece, piece, piece); }
         if (threeD) { translate(piece, 0, 0); }
         if (threeD) {box((piece/4)*3); }
       } else if (this.kentta[kohta] == 2) {
         fill(255,255,255);
         translate(0, 0, -1);
         if (!threeD) {rect(xIt*piece+(piece/5)*2, yIt*piece+(piece/5)*2, piece-(piece/5)*4, piece-(piece/5)*4); }
         if (threeD) { translate(piece, 0, 0); }
         if (threeD) {box((piece/4)*1); }
         translate(0, 0, 1);
       } else if (this.kentta[kohta] == 0) {
         noFill();
         noStroke();
         if (!threeD) {rect(xIt*piece, yIt*piece, piece, piece); }
         if (threeD) { translate(piece, 0, 0); }
         if (threeD) {box((piece/4)*3); }
         stroke(0);
       } else {
         if (threeD) { translate(piece, 0, 0); }
         if (threeD) {box((piece/4)*3); }
       }

     }
     if (threeD) { translate(-size, piece, 0); }
   }
   if (threeD) {translate(0, -size, 0); }
 }
 
 int mitaKohdassa(int x, int y){
   return this.kentta[int(x) + int(y)*32];
 }
 
 void asetaKohta(int x, int y, int uusi){
   this.kentta[x + y*32] = uusi;  
 }
  
  
}