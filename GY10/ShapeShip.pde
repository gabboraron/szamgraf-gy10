class SpaceShip {
  
  PShape body;
  PVector position = new PVector();
  float alpha;
  
  float speed = 0;
  float acceleration = 2;
  float last_time;
  
  boolean is_move_forward = false, 
  is_move_backward = false, 
  is_rotate_left = false, is_rotate_right = false;
  
  SpaceShip(PShape _body) {
   body = _body; 
   last_time = millis();
  }
  
  void update() {
    float delta_time = (millis() - last_time) / 1000.0f;
    last_time = millis();
    
    
    PVector forward = GetForward();
    
    if(is_move_forward) {
      speed += delta_time * acceleration;
      if (speed > 7) {
       speed = 7; 
      }
    } 
    
    if (is_move_backward) {
      speed -= delta_time * acceleration;
      if (speed < 0) {
       speed = 0; 
      }
    } 
    
    if (is_move_backward == false && is_move_forward == false) {
      speed -= delta_time * acceleration;
      if (speed < 0) {
       speed = 0; 
      }
    }
    
    forward.mult(delta_time * speed);
    position.add(forward);
    
    if (is_rotate_left) {
     alpha -= 0.1; 
    }
    
    if (is_rotate_right) {
     alpha += 0.1; 
    }
  }
  
  void Draw() {
   pushMatrix();
     translate(position.x, position.y, position.z);
     rotateY(-alpha - PI);
     rotateX(PI);
     scale(0.05);
     shape(body);
   popMatrix();
  }
  
  void MoveForward(boolean b) {
   is_move_forward = b; 
  }
  
  void MoveBackward(boolean b) {
   is_move_backward = b; 
  }
  
  void RotateLeft(boolean b) {
    is_rotate_left = b;
  }
  
  void RotateRight(boolean b) {
   is_rotate_right = b; 
  }
  
  PVector GetForward() {
   return new PVector(cos(alpha), 0, sin(alpha)); 
  }
}
