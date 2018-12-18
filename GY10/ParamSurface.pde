abstract class ParamSurface {
 
  int detailness_u = 10;
  int detailness_v = 10;
  
  PImage tex;
  
  abstract PVector GetPos(float u, float v);
  abstract PVector GetNormal(float u, float v);
  
  void Draw() {
   beginShape(TRIANGLES);
   texture(tex);
   textureMode(NORMAL);
   
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
      
      PVector n1 = GetNormal(u, v);
      PVector n2 = GetNormal(u, v + step_v);
      PVector n3 = GetNormal(u + step_u, v);
      PVector n4 = GetNormal(u + step_u, v + step_v);
      
      //triangle 1.
      vertex(p1.x, p1.y, p1.z, u, 1-v);
      normal(n1.x, n1.y, n1.z);
      
      vertex(p2.x, p2.y, p2.z, u, 1-(v + step_v));
      normal(n2.x, n2.y, n2.z);
      
      vertex(p3.x, p3.y, p3.z, u + step_u, 1-v);
      normal(n3.x, n3.y, n3.z);
      
      //triangle 2.
      vertex(p2.x, p2.y, p2.z, u, 1-(v + step_v));
      normal(n2.x, n2.y, n2.z);
      
      vertex(p4.x, p4.y, p4.z, u + step_u, 1-(v + step_v));
      normal(n4.x, n4.y, n4.z);
      
      vertex(p3.x, p3.y, p3.z, u + step_u, 1-v);
      normal(n3.x, n3.y, n3.z);
    }
   }
   
   endShape();
  }
}
