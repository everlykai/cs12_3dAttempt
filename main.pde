import java.awt.Robot;

color black = #000000, white = #FFFFFF, blue = #0000ff, purple = #ff00ff, fakeBlack = #ff0000, fakeWhite = #fbfbfb;

int gridSize, bulletTimer = 0, threshold = 20, mode, wallTimer = 0, HP;
PImage map, block1, block2, block3, block4, end1, end2, end3, glass;

PVector cam, focus, tilt, sky;
boolean wkey, skey, akey, dkey, spacebar, showWall;
float lrAngle, udAngle;
Robot rbt;

PGraphics world, HUD;
ArrayList<GameObject> objects;
final int INTRO = 0, GAME = 1, PAUSE = 2, GAMEOVER = 3;

void setup() {
  world = createGraphics(width, height, P3D);
  HUD = createGraphics(width, height, P2D);
  block1 = loadImage("glasspane.png");
  block2 = loadImage("quartz.png");
  block3 = loadImage("grass.jpg");
  block4 = loadImage("obsidian.png");
  end1 = loadImage("side1.png"); //3 unique sides(instead of 6)
  end2 = loadImage("side2.png");
  end3 = loadImage("side3.png");
  glass = loadImage("glass.png");
  sky = new PVector(0,110);

  map = loadImage("map.png");
  gridSize = 100;

  try {
    rbt = new Robot();
  }
  catch(Exception e) {
    e.printStackTrace();
  }
  size(displayWidth, displayHeight, P2D);
  rbt.mouseMove(width/2, height/2);
  mouseX = width/2;
  mouseY = height/2;

  cam = new PVector(width/2, height/2+gridSize*2, height/2);
  focus = new PVector(width/2, height/2, height/2-100);
  tilt = new PVector(0, 1, 0);
  
  showWall = true;
  mode = 1;
  HP = 5;
  objects = new ArrayList<>();
  noCursor();
}

void draw() {
  switch(mode) {
  case INTRO:
    intro();
    break;
  case GAME:
    game();
    break;
  case PAUSE:
    pause();
    break;
  case GAMEOVER:
    gameOver();
    break;
  default:
    println("ERROR! MODE = "+mode);
  }
}
