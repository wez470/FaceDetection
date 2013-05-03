//openni and nite wrapper libraries
import SimpleOpenNI.*;

//opencv wrapper libraries
import monclubelec.javacvPro.*;

OpenCV opencv; 
SimpleOpenNI cam;

void setup()
{
  cam = new SimpleOpenNI(this); //initialize kinect camera
  cam.setMirror(true);
  cam.enableRGB(); //using the RGB camera.  Can not use IR camera now.
  
  opencv = new OpenCV(this);
  opencv.allocate(cam.rgbWidth(), cam.rgbHeight()); //size of image buffer
  
  size(cam.rgbWidth(), cam.rgbHeight()); //size of window
}

void update()
{
  cam.update(); //get new frame/info from kinect
  opencv.copy(cam.rgbImage()); //get the current frame into opencv
}

void draw()
{
  update(); //all logic done here
  
  image(opencv.getBuffer(), 0, 0); //draw the image on the screen
}

