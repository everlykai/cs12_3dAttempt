void intro() {
  setup();
  background(184, 207, 201);
  
}

void pause() {
  clear();
  background(237, 202, 228);
}

void game() {
  world.beginDraw();
  world.textureMode(NORMAL);
  sky.rotate(radians(0.05));
  world.background(sky.y, sky.y*1.2, sky.y*1.6);
  world.pointLight(255, 255, 255, cam.x, cam.y, cam.z);
  world.camera(cam.x, cam.y, cam.z, focus.x, focus.y, focus.z, tilt.x, tilt.y, tilt.z);
  lrAngle = map(mouseX, 0, width, 0, 2*PI);
  move();
  wallTimer--;

  drawPlane(-3000, 3000, height, gridSize, block3);
  drawPlane(-2000, 2000, height, gridSize, block2);
  drawPlane(-2000, 2000, height-gridSize*5, gridSize, block1);
  drawMap();
  for (int i = objects.size()-1; i >= 0; i--) {
    GameObject obj = objects.get(i);
    obj.act();
    obj.show();
    if (obj.lives == 0) {
      objects.remove(i);
    }
  }
  world.endDraw();
  image(world, 0, 0);

  HUD.beginDraw();

  HUD.clear();
  drawCrossHair();
  drawMinimap();

  HUD.endDraw();
  image(HUD, 0, 0);
}

void gameOver() {
  

}
