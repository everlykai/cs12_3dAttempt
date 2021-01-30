
void drawPlane(int start, int end, int level, int gap, PImage blockType) {
  // x1, y1, z1 and x2, y2, z2
  int x, z;
  x = z = start;
  while (z < end) {
    texturedCube(x, level, z, blockType, gap);
    x+=gap;
    if(x>=end) {
      x = start;
      z+=gap;
    }
  }
}

void drawMap() {
  bulletTimer++;
  for (int x = 0; x<map.width; x++) {
    for (int y = 0; y<map.height; y++) {
      color c = map.get(x,y);
      if (c == blue) {
        texturedCube(x*gridSize-2000,height-gridSize,y*gridSize-2000,block1,gridSize);
        texturedCube(x*gridSize-2000,height-gridSize*2,y*gridSize-2000,block1,gridSize);
        texturedCube(x*gridSize-2000,height-gridSize*3,y*gridSize-2000,block1,gridSize);
        texturedCube(x*gridSize-2000,height-gridSize*4,y*gridSize-2000,block1,gridSize);
      }
      else if(c == black){
        texturedCube(x*gridSize-2000,height-gridSize,y*gridSize-2000,block2,gridSize);
        texturedCube(x*gridSize-2000,height-gridSize*2,y*gridSize-2000,block2,gridSize);
        texturedCube(x*gridSize-2000,height-gridSize*3,y*gridSize-2000,block2,gridSize);
        texturedCube(x*gridSize-2000,height-gridSize*4,y*gridSize-2000,block2,gridSize);
      }
      else if(c == fakeBlack){
        objects.add(new Wall(x*gridSize-2000,height-gridSize,y*gridSize-2000));
        texturedCube(x*gridSize-2000,height-gridSize*4,y*gridSize-2000,block2,gridSize);
      }
      else if(c == purple) {
        texturedCube(x*gridSize-2000,height-gridSize,y*gridSize-2000,block4,gridSize);
        drawCrystal(x*gridSize-2000,height-gridSize*2,y*gridSize-2000);
        texturedCube(x*gridSize-2000,height-gridSize*4,y*gridSize-2000,block4,gridSize);
      }
    }
  } 
}

void button(int x, int y, int w, int h, int textSize, String label) {
  if (onButton(x, y, w, h)) { //hover
    strokeWeight(4);
    stroke(0);
  } else {
    strokeWeight(1);
    stroke(0);
  }
  fill(255); 
  rect(x, y, w, h);
  fill(0);
  textSize(textSize);
  text(label, x, y); //text, xy
}

void newText(String txt, float x, float y, int size, float col) {
  fill(col);
  textSize(size);
  text(txt, x, y);
}

void drawCrystal(float x, float y, float z) {
    PVector loc = new PVector(x,y,z);
    world.pushMatrix();
    world.translate(loc.x+50, loc.y+25, loc.z+50);
    world.rotateX(-frameCount/70.0);  //auto-rotates the cube
    world.rotateY(frameCount/70.0);
    texturedCube(-25, -25, -25, end1, end2, end3, 50); 
    world.popMatrix();

    world.pushMatrix();
    world.translate(loc.x+50, loc.y+25, loc.z+50);
    world.rotateY(-frameCount/75.0);
    world.rotateX(PI/8);
    world.rotateY(-PI/8);
    texturedCube(-35, -35, -35, glass, 70);
    world.popMatrix();

    world.pushMatrix();
    world.translate(loc.x+50, loc.y+25, loc.z+50);
    world.rotateY(frameCount/75.0);
    world.rotateX(-PI/4);
    world.rotateY(PI/4);
    texturedCube(-35, -35, -35, glass, 70);  //this is the outermost cube
    world.popMatrix();
}
