// Wormz2 - mouse edition
// a port of the HTML5 particle simulator (html5-pro.com)
// by Jackson Servheen
// CC BY-NC-SA 2.0

int particles = 1000;
float speed = 6.0;
float trail = 40;
color col = color(0,255,255);
float random = 130; //max angle

boolean locked = false;

boolean paused = false;

Particle[] parts = new Particle[particles];

HScrollbar partscroll = new HScrollbar(10,5,150,20,10,"Particles");
HScrollbar randscroll = new HScrollbar(10,25,150,20,10,"Random");
HScrollbar speedscroll = new HScrollbar(10,45,150,20,10,"Speed");
HScrollbar trailscroll = new HScrollbar(10,65,150,20,10,"Trail");

RectButton reset = new RectButton(10,85,75,20,color(170),color(204),"Reset");
RectButton pause = new RectButton(85,85,75,20,color(170),color(204),"Pause");

void setup() {
  size(640,640);
  for (int i = 0; i < particles; i++) {
    parts[i] = new Particle(map(i,0,particles,0,PI*2),width/2,height/2,width,height,color(random(255),random(255),random(255)));
  }
  background(0);
}

void draw() {
 // background(color(0,0,0,trail));
 
  if (!paused) {
    if (trail > 2) {
      stroke(color(0,0,0,trail));
      fill(color(0,0,0,trail));
      rect(0,0,width,height);
    }
    
    for (int i = 0; i < particles; i++) {
      parts[i].update(random,speed,col);
    }
  }
  
  // update buttons
  if (!locked) {
    reset.update();
    pause.update();
  } else {
    locked = false;
  }
  
  reset.display();
  pause.display();
  
  if (mousePressed) {
    if (reset.pressed()) {
      for (int i = 0; i < particles; i++) {
        parts[i] = new Particle(map(i,0,particles,0,PI*2),width/2,height/2,width,height,color(random(255),random(255),random(255)));
      }
      background(0);
    } else if (pause.pressed()) {
      if (paused) {
        paused = false;
      } else {
        paused = true;
      }
      delay(200);
    } else {
      if (!partscroll.overEvent() && !randscroll.overEvent() && !speedscroll.overEvent() && !trailscroll.overEvent()) {
        parts[(int)random(particles)] = new Particle(random(PI * 2),(int)mouseX,(int)mouseY,width,height,color(random(255),random(255),random(255)));
      }
    }
  }
  
  // update scrollbars
  partscroll.update();
  randscroll.update();
  speedscroll.update();
  trailscroll.update();
  
  partscroll.display();
  randscroll.display();
  speedscroll.display();
  trailscroll.display();
  
  particles = (int)constrain(map(partscroll.getPos(),0,150,0,1000),1,999);
  random = map(randscroll.getPos(),0,150,0,179);
  if (random < 2) {
    random = 0;
  }
  speed = map(speedscroll.getPos(),0,150,0,15);
  trail = constrain(map(trailscroll.getPos(),0,150,155,0),1,155);
}
