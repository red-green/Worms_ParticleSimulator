// Wormz2
// a port of the HTML5 particle simulator (html5-pro.com)
// by Jackson Servheen
// CC BY-NC-SA 2.0

int particles = 1000;
float speed = 6.0;
float trail = 40;
color col = color(25,255,0);
float random = 130; //max angle
float size = 5;

boolean locked = false;

boolean paused = false;

Particle[] parts = new Particle[particles];

HScrollbar partscroll = new HScrollbar(10,5,150,20,10,"Particles");
HScrollbar randscroll = new HScrollbar(10,25,150,20,10,"Random");
HScrollbar speedscroll = new HScrollbar(10,45,150,20,10,"Speed");
HScrollbar trailscroll = new HScrollbar(10,65,150,20,10,"Trail");
HScrollbar sizescroll = new HScrollbar(10,85,150,20,10,"Size");

RectButton reset = new RectButton(10,100,75,20,color(170),color(204),"Reset");
RectButton pause = new RectButton(85,100,75,20,color(170),color(204),"Pause");

void setup() {
  size(640,640);
  for (int i = 0; i < particles; i++) {
    parts[i] = new Particle(map(i,0,particles,0,PI*2),width/2,height/2,width,height);
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
    
    strokeWeight(size);
    for (int i = 0; i < particles; i++) {
      parts[i].update(random,speed,col);
    }
  }
  if (mouseX < 160 && mouseY < 120) {
  // update buttons
  if (!locked) {
    reset.update();
    pause.update();
  } else {
    locked = false;
  }
  
  strokeWeight(1);
  reset.display();
  pause.display();
  
  if (mousePressed) {
    if (reset.pressed()) {
      for (int i = 0; i < particles; i++) {
        parts[i] = new Particle(map(i,0,particles,0,PI*2),width/2,height/2,width,height);
      }
      background(0);
    }
    if (pause.pressed()) {
      if (paused) {
        paused = false;
      } else {
        paused = true;
      }
      delay(200);
    }
  }
  
  // update scrollbars
  sizescroll.update();
  partscroll.update();
  randscroll.update();
  speedscroll.update();
  trailscroll.update();
  
  sizescroll.display();
  partscroll.display();
  randscroll.display();
  speedscroll.display();
  trailscroll.display();
  
  size = constrain(map(sizescroll.getPos(),7,150,-5,40),0,40);
  particles = (int)constrain(map(partscroll.getPos(),2,150,-10,1000),1,999);
  random = map(randscroll.getPos(),7,150,-10,179);
  speed = map(speedscroll.getPos(),0,150,0,15);
  trail = constrain(map(trailscroll.getPos(),0,150,155,0),1,155);
  }
}
