class Wall extends GameObject {

  Wall (float x, float y, float z) {
    loc.x = x;
    loc.y = y;
    loc.z = z;
  }

  void show() {
    if (!showWall) return;
    
    texturedCube(loc.x, loc.y, loc.z, block2, gridSize);
    texturedCube(loc.x, loc.y-gridSize, loc.z, block2, gridSize);
    texturedCube(loc.x, loc.y-gridSize*2, loc.z, block2, gridSize);
  }

  void act() {
    if (showWall)
      return;
    if (wallTimer == 0) showWall = true;
  }
}
