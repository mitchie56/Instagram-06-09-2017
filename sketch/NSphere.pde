
class NSphere{

  PVector pos;
  float cNoise; //seed for noise function
  float change; //how much we will traverse noise
  
  NSphere(float x, float y, float z, float seed){
    pos = new PVector(x,y,z);
    this.cNoise = seed;
    change = random(0.02, 0.04);
  }

  void display(){
    pushMatrix();
    float col = map(noise(cNoise),0,1,150,255);
    cNoise += change;
    fill(col,255,255);
    translate(pos.x,pos.y,pos.z);
    sphere(1);
    popMatrix();
  }

}