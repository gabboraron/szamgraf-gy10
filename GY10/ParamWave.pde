class ParamWave extends ParamSurface {
 
  float size = 6;
  PVector offset = new PVector();
  PVector GetPos(float u, float v) {
    return new PVector(u * size, 
      cos(2 * PI * u + offset.x) 
                  * sin(2 * PI * v + offset.y),
      v * size);    
  }
  
  PVector GetDiffU(float u, float v){
    return new PVector(size, 
      -sin(2 * PI * u + offset.x) * 2 * PI  
                  * sin(2 * PI * v + offset.y),
      0);
  } 
  
  PVector GetDiffV(float u, float v){
    return new PVector(0, 
    cos(2 * PI * u + offset.x) 
                  * 2 * PI * cos(2 * PI * v + offset.y),
    size);
  }
  
  
  PVector GetNormal(float u, float v) {
    PVector du = GetDiffU(u, v);
    PVector dv = GetDiffV(u, v);
    
    PVector normal = du.cross(dv);
    normal.normalize();
    return normal; 
  }
}
