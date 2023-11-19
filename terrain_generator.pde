//import gifAnimation.*;

int cols, rows;
int scl = 20;
int w = 1500;
int h = 1700;

float[][] terrain;
float flying = 0;

//Gif myAnimation;
//GifMaker gifExport = new GifMaker(PApplet parent, "terrain-generator.gif", 256, int transparentColor);
//GifMaker gifExport = new GifMaker(this, "terrain-generator.gif");


void setup() {
  size(1000, 1000, P3D);

  cols = w / scl;
  rows = h / scl;

  terrain = new float[cols][rows];
  
  // animation
  //myAnimation = new Gif(this, "lavalamp.gif");
  //myAnimation.play();
  
  // export gif
  //gifExport = new GifMaker(this, "terrain-generator.gif");
  //gifExport.setRepeat(0);        // make it an "endless" animation
  //gifExport.setTransparent(0,0,0);  // black is transparent
}


void draw(){
  // flying speed, +- determines flying forwards/backwards
  flying -= 0.01;
  
  float yoff = flying;
  for(int y = 0; y < rows; y++){
    float xoff = 0;
    for(int x = 0; x < cols; x++){
      // last two parameters in terrain determine smoothness of terrain
      terrain[x][y] = map(noise(xoff,yoff), 0, 1, -200, 100);
      // xoff and yoff determing the height of the xy coordinates
      xoff += 0.1;
    }
    yoff += 0.1;
  }
  
  background(0);
  //stroke(81,27,232);
  stroke(255);
  noFill();
  
  translate(width/2, height/2);
  rotateX(PI/3);
  
  translate(-w/2, -h/2);
  
  for(int y = 0; y < rows - 1; y++) {
    beginShape(TRIANGLE_STRIP);
    for(int x = 0; x < cols; x++) {
      vertex(x * scl, y * scl, terrain[x][y]);
      vertex(x * scl, (y+1) * scl, terrain[x][y+1]);
      //rect(x * scl, y * scl, scl, scl);
    }
    endShape();
  }

  //image(myAnimation, 100, 100);
  //gifExport.setDelay(1);
  //gifExport.addFrame();
}


//void save() {
//  gifExport.finish();
//  println("Done!");
////}
//void mousePressed() {
//    gifExport.finish();          // write file
//}
