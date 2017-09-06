import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;

/*
 * To install peasy cam: sketch->import library->add library->search peasy cam.
 * To import peasy cam: sketch->import library->peasy cam.
 */

PeasyCam cam;
ArrayList<NSphere> spheres; //spheres forming outer layer
float n; //seed for noise function

void setup() {
  size(640, 640, P3D);
  colorMode(HSB);
  spheres = new ArrayList<NSphere>();
  cam = new PeasyCam(this, 110);
  n = 0;
  
  int res =25; //Changing this will determine the amount of nspheres plotted
  float r = 50; //Changing this will change the radius of the outer sphere 
  
  float seed = random(100000);
  //This is the loop used to generate the outer sphere
  //Using polar to cartesian coordinates 
  for (int i = 0; i < res; i++) {

    float lon = map(i, 0, res, 0, PI);

    for (int j = 0; j < res; j++) {

      float lat = map(j, 0, res, 0, TWO_PI);

      float x = r * sin(lat) * cos(lon);
      float y = r * sin(lat) * sin(lon);
      float z = r * cos(lat);

      spheres.add(new NSphere(x, y, z, seed));
      seed += 0.2;
    }
  }
  noStroke();
}

/*
 * Main loop
 */
void draw() {

  background(155);
  lights();
  cam.rotateX(0.01);
  cam.rotateY(0.01);

  for (NSphere s : spheres) {
    s.display();
  }
  float size = map(noise(n), 0, 1, 7, 50);
  float col = map(noise(n), 0, 1, 154, 255);
  fill(col, 218, 204);
  sphere(size);
  n += 0.022;
}