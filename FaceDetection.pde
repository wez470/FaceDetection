//openni and nite wrapper libraries
import SimpleOpenNI.*;

//opencv wrapper libraries
import monclubelec.javacvPro.*;

//for Rectangle
import java.awt.*;

OpenCV opencv; 
SimpleOpenNI cam;
Rectangle[] faceRect;

void setup()
{
  cam = new SimpleOpenNI(this); //initialize kinect camera
  cam.setMirror(true);
  cam.enableRGB(); //using the RGB camera.  Can not use IR camera now.
  
  opencv = new OpenCV(this);
  opencv.allocate(cam.rgbWidth(), cam.rgbHeight()); //size of image buffer
  opencv.cascade("C:/opencv/data/haarcascades/", "haarcascade_frontalface_alt.xml"); //initialize detection of face
  
  size(cam.rgbWidth(), cam.rgbHeight()); //size of window
}

void draw()
{
  cam.update(); //get new frame/info from kinect
  opencv.copy(cam.rgbImage()); //get the current frame into opencv
  faceRect = opencv.detect(false);
  
  image(cam.rgbImage(), 0, 0); //draw the image on the screen
  opencv.drawRectDetect (false); //draw rectangles on faces
}

