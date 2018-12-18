class ParamSphere extends ParamSurface {
  
  float r = 2;
  
  PVector GetNormal(float u, float v) {
    float alpha = u * 2 * PI;
    float beta = v * PI;       
    PVector p = new PVector(
      sin(beta)*cos(alpha),
      cos(beta),
      sin(beta)*sin(alpha));
    return p;
  }
  
  PVector GetPos(float u, float v) {
    float alpha = u * 2 * PI;
    float beta = v * PI;
    
    PVector p = new PVector(
      r * sin(beta)*cos(alpha),
      r * cos(beta),
      r * sin(beta)*sin(alpha));
    
    return p;
   }  
}
