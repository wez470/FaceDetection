//openni and nite wrapper libraries
import SimpleOpenNI.*;

//opencv wrapper libraries
import monclubelec.javacvPro.*;

OpenCV opencv; 
PImage imgSrc;
SimpleOpenNI cam;
boolean mirror= true;

void setup()
{
  cam = new SimpleOpenNI(this);
  cam.setMirror(true);
  cam.enableRGB(); //using the RGB camera.  Can not use IR camera now.
  size(cam.rgbWidth(), cam.rgbHeight());
}

void update()
{
  cam.update(); //get new info from kinect
}

void draw()
{
  update();
  
  image(cam.rgbImage(), 0, 0);
  image(cam.rgbImage(), cam.rgbWidth(), 0);
}

