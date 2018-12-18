abstract class ParamSurface {
 
  int detailness_u = 10;
  int detailness_v = 10;
  
  abstract PVector GetPos(float u, float v);
  
  void Draw() {
   beginShape(TRIANGLES);
   
   float step_u = 1.0 / detailness_u;
   float step_v = 1.0 / detailness_v;
   
   for (int i = 0; i < detailness_u; i++) {
    for (int j = 0; j < detailness_v; j++) {
      
      float u = step_u * i;
      float v = step_v * j;
      
      PVector p1 = GetPos(u, v);
      PVector p2 = GetPos(u, v + step_v);
      PVector p3 = GetPos(u + step_u, v);
      PVector p4 = GetPos(u + step_u, v + step_v);
      
      vertex(p1.x, p1.y, p1.z);
      vertex(p2.x, p2.y, p2.z);
      vertex(p3.x, p3.y, p3.z);
      
      vertex(p4.x, p4.y, p4.z);
      vertex(p2.x, p2.y, p2.z);
      vertex(p3.x, p3.y, p3.z);
    }
   }
   
   endShape();
  }
}
