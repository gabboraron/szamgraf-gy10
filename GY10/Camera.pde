class Camera {
  PVector eye = new PVector(0, 0, 0);
  PVector up = new PVector(0, 1, 0);
  PVector at = new PVector(1, 0, 0); 
  
  boolean is_move_forward = false, is_move_backward = false;
  boolean is_move_left = false, is_move_right = false;
  boolean is_move_up = false, is_move_down = false;
  
  float last_time;
  float speed = 10;
  
  float alpha = 0;
  float beta = PI / 2;
  
  PVector lastMousePos = null;
  
  Camera() {
    ApplyCamera();
    last_time = millis();
  }
  
  void update() {
    float delta_time = (millis() - last_time) / 1000.0;
    last_time = millis();
    
    PVector forward = GetForward();
    forward.mult(delta_time * speed);
    
    PVector right = GetRight();
    right.mult(delta_time * speed);
    if (is_move_forward) {
      eye.add(forward);
      at.add(forward);
    } else if (is_move_backward){
      eye.sub(forward);
      at.sub(forward);
    }
    
    if (is_move_right) {
      eye.add(right);
      at.add(right);
    } else if (is_move_left) {
      eye.sub(right);
      at.sub(right);
    }
    
    if (mousePressed) {
      if (lastMousePos == null) {
        lastMousePos = new PVector(mouseX, mouseY);
      } else {
        float dx = (mouseX - lastMousePos.x) / 100.0;
        float dy = (mouseY - lastMousePos.y) / 100.0;
        
        alpha += dx;
        beta -= dy;
        
        if (beta < 0.1) {
         beta = 0.1; 
        } else if (beta > 3.1) {
         beta = 3.1; 
        }
        
        PVector spherePos = new PVector(
        sin(beta) * cos(alpha),
        cos(beta),
        sin(beta) * sin(alpha)
        );
        
        at = eye.copy().add(spherePos);
        
        lastMousePos.x = mouseX;
        lastMousePos.y = mouseY;
      }      
    } else {
     lastMousePos = null; 
    }
    
    ApplyCamera();
  }
  
  
  PVector GetRight() {
   PVector forward = GetForward();
   PVector right = forward.copy().cross(up);
   right.normalize();
   return right;
  }
  
  PVector GetForward() {
    PVector forward = at.copy().sub(eye);
    forward.normalize();
    return forward;
  }
  
  void ApplyCamera() {
    perspective(PI/3, (float)width / (float) height,
            0.01, 1000);
            
    camera(eye.x, eye.y, eye.z,
         at.x, at.y, at.z,
         up.x, up.y, up.z);
  }
  
  //Setter
  void MoveForwad(boolean on) {
    is_move_forward = on;
  }
  
  void MoveBackward(boolean on) {
    is_move_backward = on;
  }
  
  void MoveRight(boolean on) {
    is_move_right = on;
  }
  
  void MoveLeft(boolean on) {
    is_move_left = on;
  }
}
