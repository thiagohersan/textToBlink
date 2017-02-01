PGraphics mMsg;
String mText = "FOI GOLPE";
int mFontSize = 64;
int cRow = 0;
int cColumn = 0;
int pixelScale = 8;

void setup() {
  size(1280, 720);
  rectMode(CENTER);
  PFont myFont = createFont("Helvetica", mFontSize);
  textFont(myFont);
  textSize(mFontSize);

  float tWidth = textWidth(mText);
  float tHeight = textAscent() + textDescent();
  PGraphics pg = createGraphics((int)tWidth, (int)tHeight);

  pg.beginDraw();
  pg.background(0);
  pg.textSize(mFontSize);
  pg.textFont(myFont);
  pg.fill(255);
  pg.text(mText, 0, mFontSize-pg.textDescent());
  pg.endDraw();

  mMsg = createGraphics(pg.height, pg.width);
  mMsg.beginDraw();
  mMsg.translate(mMsg.width, 0);
  mMsg.rotate(PI/2);
  mMsg.image(pg, 0, 0);  
  mMsg.endDraw();
  mMsg.loadPixels();
}

void draw() {
  background(0);
  for (int i=0; i<mMsg.width; i++) {
    if ((mMsg.pixels[cRow*mMsg.width+i]&0xff) > 128) {
      fill(255);
      stroke(255);
      rect(cColumn, height/6+(mMsg.width-i)*pixelScale, pixelScale, pixelScale); 
    }
  }
  cRow = (cRow + 2) % mMsg.height;
  cColumn = (cColumn + pixelScale) % width;
  cColumn = width/2;
  if(cRow >= (mMsg.height-32)){
    fill(255,0,0);
    stroke(255,0,0);
    ellipse(0,0,32,32);
  }
}