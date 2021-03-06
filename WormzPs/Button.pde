// by Casy Reas and Ben Fry
// from http://processingjs.org/learning/topic/buttons/

class Button

{

  int x, y;

  int xsize, ysize;

  color basecolor, highlightcolor;

  color currentcolor;

  boolean over = false;

  boolean pressed = false;   

  String label;

  void update() 

  {

    if(over()) {

      currentcolor = highlightcolor;

    } 

    else {

      currentcolor = basecolor;

    }

  }



  boolean pressed() 

  {

    if(over) {

      locked = true;

      return true;

    } 

    else {

      locked = false;

      return false;

    }    

  }



  boolean over() 

  { 

    return true; 

  }



  boolean overRect(int x, int y, int width, int height) 

  {

    if (mouseX >= x && mouseX <= x+width && 

      mouseY >= y && mouseY <= y+height) {

      return true;

    } 

    else {

      return false;

    }

  }



  boolean overCircle(int x, int y, int diameter) 

  {

    float disX = x - mouseX;

    float disY = y - mouseY;

    if(sqrt(sq(disX) + sq(disY)) < diameter/2 ) {

      return true;

    } 

    else {

      return false;

    }

  }



}

class RectButton extends Button

{

  RectButton(int ix, int iy, int vsize, int hsize, color icolor, color ihighlight, String text) 

  {

    x = ix;

    y = iy;

    xsize = vsize;
    ysize = hsize;

    basecolor = icolor;

    highlightcolor = ihighlight;

    currentcolor = basecolor;
    
    label = text;

  }



  boolean over() 

  {

    if( overRect(x, y, xsize, ysize) ) {

      over = true;

      return true;

    } 

    else {

      over = false;

      return false;

    }

  }



  void display() 

  {

    stroke(255);

    fill(currentcolor);

    rect(x, y, xsize, ysize);
    
    stroke(0);
    fill(255);
    
    textSize(14);
    text(label,x,y + ysize);

  }

}
