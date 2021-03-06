// by meee!

class Particle {
  float x, y;
  float ox, oy;
  int xedge, yedge;
  PVector velocity;
  color c;
  
  Particle(float direction,float xp,float yp, int xe, int ye, color col) {
    x = xp;
    y = yp;
    velocity = PVector.fromAngle(direction);
    xedge = xe;
    yedge = ye;
    ox = xp;
    oy = yp;
    c = col;
  }
  
  void update(float randoml,float speed, color col) {
    // Add the current speed to the location.
    velocity.rotate(radians(random(-1 - randoml,randoml)));
    velocity.normalize();
    
    x += velocity.x * speed;
    y += velocity.y * speed;
    // We still sometimes need to refer to the individual components of a PVector 
    // and can do so using the dot syntax (location.x, velocity.y, etc.)
    if ((x > xedge) || (x < 0)) {
      velocity.x = velocity.x * -1;
    }
    if ((y > yedge) || (y < 0)) {
      velocity.y = velocity.y * -1;
    }
    stroke(c);
    line(x,y,ox,oy);
    ox = x;
    oy = y;
  }
}
