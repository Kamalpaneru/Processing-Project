int rows,cols;
int scl = 20;
int w = 2000;
int h = 1600;

float [][] array;
float flying = 0;
void setup(){
  size(600,600,P3D);

  cols = w/ scl;
  rows = h/ scl;
  array = new float[cols][rows];
}


void draw() {  
  background(0);
   color c2 = #E53A40;
  stroke(c2);
  noFill();
  
    flying -=0.1;
    float yoff = flying;
  for(int y=0; y<rows; y++) {
    float xoff =0;
   for(int x=0; x< cols; x++){
     array[x][y] = map(noise(xoff,yoff),0,1,-100,100);
     xoff += 0.2;
   }
   yoff += 0.2;
  }

  
  translate(width/2, height/2+70);
  rotateX(PI/3);
  translate(-w/2, -h/2);
  for(int y=0; y<rows-1; y++)
  {
    beginShape(TRIANGLE_STRIP);
    for(int x=0; x<cols; x++) {
     vertex(x*scl,y*scl,array[x][y]);
      vertex(x*scl,(y+1)*scl,array[x][y+1]);
    }
    endShape();
  }
}