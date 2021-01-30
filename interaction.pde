// key and mouse

void keyPressed() {
  if (mode == INTRO) mode = GAME;
  else if (key == '1' && mode == GAME) {
    mode = PAUSE;
  }
  else if (key == '1' && mode == PAUSE) {
    mode = GAME;
  }
  else if (key == 'w' || key == 'W') wkey = true;
  else if (key == 's' || key == 'S') skey = true;
  else if (key == 'a' || key == 'A') akey = true;
  else if (key == 'd' || key == 'D') dkey = true;
  else if (key == ' ' && bulletTimer > threshold){
    objects.add(new Bullet());
    bulletTimer = 0;                           
  }
}

void keyReleased() {
  if (key == 'w' || key == 'W') wkey = false;
  if (key == 's' || key == 'S') skey = false;
  if (key == 'a' || key == 'A') akey = false;
  if (key == 'd' || key == 'D') dkey = false;
}
void mouseMoved() {
  if (udAngle > PI/2.3) udAngle = PI/2.3;
  else if (udAngle < -PI/2.3) udAngle = -PI/2.3;

  if (mouseX == width-1)
    rbt.mouseMove(1, mouseY+52);
  else if (mouseX == 0)
    rbt.mouseMove(width-2, mouseY+52);
    
  lrAngle += (mouseX - pmouseX)*0.01;
  udAngle += (mouseY - pmouseY)*0.01;
}

boolean onButton(int x, int y, int w, int h) {
  if ( mouseX>x-w/2 && mouseX<x+w/2 && mouseY<y+h/2 && mouseY>y-h/2) return true;
  return false;
}
