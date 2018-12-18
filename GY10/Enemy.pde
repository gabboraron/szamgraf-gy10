class Enemy {
 
  PShape body;
  PVector pos;
  float beta;
  float last_time;
  float speed = 3;
  
  Enemy(PShape body, PVector pos) {
   this.body = body;
   this.pos = pos;
   beta = 0;
  }
  
  
  void update(PVector otherPos) {
   float delta_time = (millis() - last_time) / 1000.0f;
   last_time = millis();
   
   float dx = otherPos.x - pos.x;
   float dz = otherPos.z - pos.z;
       
   beta = atan2(dz, dx);
   
   PVector diff = otherPos.sub(pos);
   if (diff.mag() < 3) {
     diff.normalize();
     pos.sub(diff.mult(speed * delta_time));
   } else if(diff.mag() < 7) {
     diff.normalize();
     pos.add(diff.mult(speed * delta_time));
   }  
   
  }
  
  
  void Draw() {
   pushMatrix();
     translate(pos.x, pos.y, pos.z);
     rotateY(-beta - PI);
     scale(0.05);
     shape(body);
   popMatrix();
  }
  
  
  
}
