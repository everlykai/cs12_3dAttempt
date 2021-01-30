void drawCrossHair() {
  HUD.stroke(white); 
  HUD.strokeWeight(2);
  HUD.line(width/2-10, height/2, width/2+10, height/2);
  HUD.line(width/2, height/2-10, width/2, height/2+10);
}

void drawMinimap() {
  image(map,width-150,height-150,100,100);
  int miniX = int(cam.x+2000)/gridSize; 
  int miniY = int(cam.z+2000)/gridSize;
  
  textSize(50);
  HUD.fill(white);
  HUD.text("Y: " + miniY, width-150, height-160);
  HUD.text("X: " + miniX, width-150, height-180);
  
  HUD.strokeWeight(0);
  HUD.stroke(255,0,0);
  HUD.fill(255,0,0);
  HUD.rect(miniX*2.5+width-150,miniY*2.5+height-150,4,4);
}  

void drawHP() {
  
}

void drawPoints() {
  
}
