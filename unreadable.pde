
import KinectPV2.*;
//import spout.*;
//Spout spout;

KinectPV2 kinect;
int count=0;
float dp1=0, d1=0, dp2=0, d2=0, dp3=0, d3=0, dp4=0, d4=0;
float dy=0;
float dx=0;
int n0=0;
//effects 1~~~~~~~
PImage img1;
float img1size;
float n1;
float focussize=0;
int [][][] randoms = new int[2189][1500][2];       // 3D array to hold our random values (2 values for every x, y)

//effects 2~~~~~~
int n2=0;
int m2=0;
PImage pop1;

//effects 3~~~~~~
float t=0;
float n3;
float rectsize=2;
PImage img3;

//effects 3~~~~~~
float t4=0;
float n4;
float rectsize4=2;

void setup() {
  size(1095, 750,P3D);
 //spout.sendTexture();
  kinect = new KinectPV2(this);
  //rectMode(CENTER);
  //enable HD Face detection
  kinect.enableHDFaceDetection(true);
  kinect.enableColorImg(true); //to draw the color image
  kinect.init();
  img1=loadImage("newspaper.png");
  pop1=loadImage("1.jpg");
  //img3=loadImage("2.JPG");
 // spout = new Spout(this);
  
  // CREATE A NAMED SENDER
  // A sender can be created now with any name.
  // Otherwise a sender is created the first time
  // "sendTexture" is called and the sketch
  // folder name is used.  
 // spout.createSender("final");
}

void draw() {
  background(0);
  image(img1, 0, 0, width, height);
  // Draw the color Image
  print(mouseX+",");
  println(mouseY);
 img1size=random(200);
//spout.sendTexture();

  // eye tracking part begin~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  ArrayList<HDFaceData> hdFaceData = kinect.getHDFaceVertex();

  for (int j = 0; j < hdFaceData.size(); j++) {
    //obtain a the HDFace object with all the vertex data
    HDFaceData HDfaceData = (HDFaceData)hdFaceData.get(j);

    if (HDfaceData.isTracked()) {
     
      if (count<200) {
        count++;
        //fill(255, 255, 0);
      //  fill(0,0,0);
      //rect(0,0,width,height);
      n0+=10;
 // println(n3);
  loadPixels();                              // load the pixels array of the window  
  int edgeAmount = 1;                        // this will do a neighborhood of 9 pixels, 3x3
  for (int x =  edgeAmount; x< width-edgeAmount; x++) {     // we have to make sure we wont 
    for (int y = edgeAmount; y< height-edgeAmount; y++) {  // be accessing pixels outside the bounds of our array
      PxPGetPixel(x, y, pixels, width);          // get the R,G,B of the "our pixel" , the central pixel
      int thisR= R;                                         // place the RGB of our pixel in variables
      int thisG=G;
      int thisB=B;
      float colorDifference=0;
      for (int blurX=x- edgeAmount; blurX<=x+ edgeAmount; blurX++) {     // visit every pixel in the neighborhood
        for (int blurY=y- edgeAmount; blurY<=y+ edgeAmount; blurY++) {
          PxPGetPixel(blurX, blurY, pixels, width);     // get the RGB of our pixel and place in RGB globals
         
          colorDifference+=   dist(R, G, B, thisR, thisG, thisB);        // dist calclates the distance in 3D colorspace beween the center pixel
        }                                                          // and the neighboring pixels and adds to "colorDifference"
      }
      if (colorDifference> n0) {
        PxPSetPixel(x, y, 0, 0, 0, 255, pixels, width);    // sets the pixels black
      } else {
        PxPSetPixel(x, y, 255, 255, 255, 255, pixels, width);    // sets the pixels white
      }
    }
  }
  updatePixels(); 
        fill(255,0,0);
      ellipse(width-40,40,20,20);
        stroke(255, 0, 0);
        //prex=HDfaceData.getX(150);
        //prey=HDfaceData.getY(150);
        dp1=dist(HDfaceData.getX(30), HDfaceData.getY(30), HDfaceData.getX(20), HDfaceData.getY(20));
        dp2=dist(HDfaceData.getX(0), HDfaceData.getY(0), HDfaceData.getX(20), HDfaceData.getY(20));
        dp3=dist(HDfaceData.getX(37), HDfaceData.getY(37), HDfaceData.getX(20), HDfaceData.getY(20));
        dp4=dist(HDfaceData.getX(1292), HDfaceData.getY(1292), HDfaceData.getX(20), HDfaceData.getY(20));
      } else {
        d1=dist(HDfaceData.getX(30), HDfaceData.getY(30), HDfaceData.getX(20), HDfaceData.getY(20));
        d2=dist(HDfaceData.getX(0), HDfaceData.getY(0), HDfaceData.getX(20), HDfaceData.getY(20));
        d3=dist(HDfaceData.getX(37), HDfaceData.getY(37), HDfaceData.getX(20), HDfaceData.getY(20));
        d4=dist(HDfaceData.getX(1292), HDfaceData.getY(1292), HDfaceData.getX(20), HDfaceData.getY(20));
        dy=d1-dp1;
        dx=d3-dp3;
        fill(0,255,0);
      ellipse(width-40,40,20,20);
      }
      //draw the vertex points
      //stroke(0, 255, 0);
     // beginShape(POINTS);
     // for (int i = 0; i < KinectPV2.HDFaceVertexCount; i++) {
        //float x = HDfaceData.getX(i);
        //float y = HDfaceData.getY(i);

        //vertex(x, y);
        //if((mouseX<=x+2&&mouseX>=x-2) || (mouseY<=y+2&&mouseY>=y-2)){
        //println(i);
       // }
    
    //endShape();
    }
    print(dx+",");
     println(dy);
    dx=map(dx, -35, 30, 0, width);
    dy=map(dy, -10, 10, 0, height);
    dx=constrain(dx, 0, width);
    dy=constrain(dy, 0, height);
    ellipse(dx, dy, 10, 10);
    //ellipse(HDfaceData.getX(10),HDfaceData.getY(10),10,10);
    //ellipse(HDfaceData.getX(150),HDfaceData.getY(150),10,10);
    //ellipse(HDfaceData.getX(0),HDfaceData.getY(0),10,10);
    //ellipse(HDfaceData.getX(185),HDfaceData.getY(185),10,10);
    //ellipse(HDfaceData.getX(1164),HDfaceData.getY(1164),10,10);
    //println(dx);
    //println(dy);
  }
  // eye tracking part end~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


  // effect1 begin~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  if (dy>148&&dy<522&&dx>17&&dx<553) {
    n1++;
   // focussize++;
    //image(pop1,random(17,500),random(148,500),random(200),random(200));
    //focussize=constrain(focussize,0,600);
    //float a=random(0,600);
   // int focusheight=int(focuswidth/2);
    //println(a);
    n1=constrain(n1, 0, width);
    //image(img1,0,0,width,height);
    loadPixels(); 
    for (int x = 0; x<width; x++) {     
      for (int y = 0; y<height; y++) {                              
        if (y>148&&y<522&&x>17&&x<553) {
          if(x>423&&x<456&&y>374&&y<386||x>328&&x<441&&y>463&&y<478||x>465&&x<543&&y>463&&y<477||x>169&&x<227&&y>395&&y<408||x>148&&x<163&&y>454&&y<469){
          }else{
          int sourceX = int(x + randoms[x][y][0]);              // add the random value to ur X and Y
          int sourceY = int(y + randoms[x][y][1]);
          sourceX= constrain(sourceX, 0, width-1);          // making sure we are not outside the image
          sourceY= constrain(sourceY, 0, height-1);
          PxPGetPixel(sourceX, sourceY, pixels, width);     // note that we ae getting from sourceX and sourceY
          PxPSetPixel(x, y, R, G, B, 255, pixels, width);           // set the RGB of our to screen
          }
        } 
      }
    }
    for (int x = 0; x<width; x++) {     
      for (int y = 0; y<height; y++) {   
        randoms[x][y][0]= (int)random(-n1/10, n1/10);        // put random values for every x and y
        randoms[x][y][1]= (int)random(-n1/10, n1/10);
      }
    }
    updatePixels();
   // focuswidth=int(focuswidth);
    
    copy(423, 374, 43, 12, 423-43, 374-12, 76, 24);
    copy(328, 463, 111, 15, 328-50, 463-24, 222, 24);
    copy(463, 463, 80, 15, 463-80, 463-15-24-10, 160, 24);
    copy(169, 395, 58, 13, 169-56, 395-13, 100, 24);
    copy(148, 454, 17, 15, 148-17, 454-15, 50, 24);
    
  } else {
    n1-=5;

    n1=constrain(n1, 0, width);
    //image(img1, 0, 0, width, height);
    loadPixels(); 
    for (int x = 0; x<width; x++) {     
      for (int y = 0; y<height; y++) {                              
        if (y>148&&y<522&&x>17&&x<553) {
        if(x>426&&x<454&&y>374&&y<386||x>330&&x<361&&y>463&&y<478||x>465&&x<514&&y>463&&y<477){}else{
          int sourceX = int(x + randoms[x][y][0]);              // add the random value to ur X and Y
          int sourceY = int(y + randoms[x][y][1]);
          sourceX= constrain(sourceX, 0, width-1);          // making sure we are not outside the image
          sourceY= constrain(sourceY, 0, height-1);
          PxPGetPixel(sourceX, sourceY, pixels, width);     // note that we ae getting from sourceX and sourceY
          PxPSetPixel(x, y, R, G, B, 255, pixels, width);           // set the RGB of our to screen
        }
      }
      }
    }
    for (int x = 0; x<width; x++) {     
      for (int y = 0; y<height; y++) {   
        randoms[x][y][0]= (int)random(-n1/10, n1/10);        // put random values for every x and y
        randoms[x][y][1]= (int)random(-n1/10, n1/10);
      }
    }
    updatePixels();
    //copy(mouseX, mouseY, 20, 10, mouseX-30, mouseY-15, 60, 30);
  }

  // effect1 end~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  // effect2 begin~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  if (dy<735&&dy>599&&dx>17&&dx<556) {
    loadPixels();  // load the pixels array of the window  
    n2+=1;
    //println(m2);
    
    n2=constrain(n2, 0, 5);
    int blurAmount = n2;                        // change this to make the effect more pronounced
    int divider=  (2*blurAmount+1)*(2*blurAmount+1);  // calculating how many pixels will be in the neighborhood of our pixel
    m2+=10;
    m2=constrain(m2, 0, 500);
    for (int x = max(395-m2, blurAmount); x<min(395+m2, width-blurAmount); x++) {     // looping 100 pixels around the mouse, we have to make sure we wont 
      for (int y = max(643-m2, blurAmount); y<min(643+m2, height-blurAmount); y++) {  // be accessing pixels outside the bounds of our array
       if (y<735&&y>599&&x>17&&x<556) {
          if (dist(395, 643, x, y)< m2) {                       // lets just do a circle radius 100
          int sumR=0;                                    // these variables will accumolate the values of R, R,B
          int sumG=0;
          int sumB=0;
          for (int blurX=x- blurAmount; blurX<=x+ blurAmount; blurX++) {     // visit every pixel in the neighborhood
            for (int blurY=y- blurAmount; blurY<=y+ blurAmount; blurY++) {
              PxPGetPixel(blurX, blurY, pixels, width);     // get the RGB of our pixel and place in RGB globals
              sumR+=R;                                           // add the R,G,B values of the neighbors
              sumG+=G;
              sumB+=B;
            }
          }
          sumR/= divider;                                         // get the average R, G B by dividing by the number of neighbors
          sumG/= divider;
          sumB/= divider;
          PxPSetPixel(x, y, sumR, sumG, sumB, 255, pixels, width);    // sets the R,G,B values to the window
        }
        } else {
       
        }
      }
    }
    updatePixels();
    image(pop1,168,607,img1size,img1size);
  } else {
    loadPixels();  // load the pixels array of the window  
    //n2-=1;
    n2=constrain(n2, 0, 5);
    int blurAmount = n2;                        // change this to make the effect more pronounced
    int divider=  (2*blurAmount+1)*(2*blurAmount+1);  // calculating how many pixels will be in the neighborhood of our pixel
    m2-=10;
    m2=constrain(m2, 0, 500);
    for (int x = max(395-m2, blurAmount); x<min(395+m2, width-blurAmount); x++) {     // looping 100 pixels around the mouse, we have to make sure we wont 
      for (int y = max(643-m2, blurAmount); y<min(643+m2, height-blurAmount); y++) {  // be accessing pixels outside the bounds of our array
        if (y<735&&y>599&&x>17&&x<556) {
        if (dist(395, 643, x, y)< m2) {                       // lets just do a circle radius 100
          int sumR=0;                                    // these variables will accumolate the values of R, R,B
          int sumG=0;
          int sumB=0;
          for (int blurX=x- blurAmount; blurX<=x+ blurAmount; blurX++) {     // visit every pixel in the neighborhood
            for (int blurY=y- blurAmount; blurY<=y+ blurAmount; blurY++) {
              PxPGetPixel(blurX, blurY, pixels, width);     // get the RGB of our pixel and place in RGB globals
              sumR+=R;                                           // add the R,G,B values of the neighbors
              sumG+=G;
              sumB+=B;
            }
          }
          sumR/= divider;                                         // get the average R, G B by dividing by the number of neighbors
          sumG/= divider;
          sumB/= divider;
          PxPSetPixel(x, y, sumR, sumG, sumB, 255, pixels, width);    // sets the R,G,B values to the window
        }
        }else{
        }
      }
    }
    updatePixels();
  }



  // effect2 end~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  // effect3 begin~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  if (dy<514&&dy>167&&dx<1063&&dx>576) {
    t+=n3;
    n3+=0.01;
    rectsize+=0.5;
    n3=constrain(n3, 0.01, 0.5);
    rectsize=constrain(rectsize, 0, 50);
    //background(0);

    //image(img,0,0,width,height);

    loadPixels();
    //copy(7, 22, 10, 10, 35, 25, 50, 50);
    int edgeAmount=2;
    for (int x=edgeAmount; x<width-edgeAmount; x+=3) {
      for (int y=edgeAmount; y< height-edgeAmount; y+=3) {
        if (y<514&&y>167&&x<1063&&x>576) {
       
          PxPGetPixel(x, y, pixels, width);
          int thisR=R;
          int thisG=G;
          int thisB=B;
          float colorDifference=0;
          for (int blurX=x- edgeAmount; blurX<=x+ edgeAmount; blurX++) {
            for (int blurY=y- edgeAmount; blurY<=y+ edgeAmount; blurY++) {
              PxPGetPixel(blurX, blurY, pixels, width);     // get the RGB of our pixel and place in RGB globals
              colorDifference+=dist(R, G, B, thisR, thisG, thisB);
            }
          }
          float threshold = height*3.5/4;                 
          if (colorDifference> threshold) {                           // if our pixel is an edge then draw a rect

            fill(thisR, thisG, thisB);
            noStroke();
            randomSeed(2);
            rect(x, y, rectsize*noise(t+50), rectsize*noise(2*t+50));
          }
          //image(img3,579,167,img1size,img1size);
        } else {
        } 
      }
    }
    fill(255, 255, 255, 5);                              // fade to white by drawing trancelusent white rect above
    rect(0, 0, width, height);
   // copy(mouseX, mouseY, 20, 10, mouseX-30, mouseY-15, 60, 30);
  } else {
    t+=n3;
    n3-=0.01;
    rectsize-=0.5;
    n3=constrain(n3, 0.01, 0.5);
    rectsize=constrain(rectsize, 0, 50);
    //background(0);

    //image(img,0,0,width,height);

    loadPixels();
    //copy(7, 22, 10, 10, 35, 25, 50, 50);
    int edgeAmount=2;
    for (int x=edgeAmount; x<width-edgeAmount; x+=3) {
      for (int y=edgeAmount; y< height-edgeAmount; y+=3) {
       if (y<514&&y>167&&x<1063&&x>576) {
       
          PxPGetPixel(x, y, pixels, width);
          int thisR=R;
          int thisG=G;
          int thisB=B;
          float colorDifference=0;
          for (int blurX=x- edgeAmount; blurX<=x+ edgeAmount; blurX++) {
            for (int blurY=y- edgeAmount; blurY<=y+ edgeAmount; blurY++) {
              PxPGetPixel(blurX, blurY, pixels, width);     // get the RGB of our pixel and place in RGB globals
              colorDifference+=dist(R, G, B, thisR, thisG, thisB);
            }
          }
          float threshold = height*3.5/4;                 
          if (colorDifference> threshold) {                           // if our pixel is an edge then draw a rect

            fill(thisR, thisG, thisB);
            noStroke();
            randomSeed(2);
            rect(x, y, rectsize*noise(t+50), rectsize*noise(2*t+50));
          }
        } else {
        }
      }
    }
    fill(255, 255, 255, 5);                              // fade to white by drawing trancelusent white rect above
    rect(0, 0, width, height);
    //copy(mouseX, mouseY, 20, 10, mouseX-30, mouseY-15, 60, 30);
  }

  // effect3 end~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  
  // effect4 begin~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  
    if (dy<736&&dy>563&&dx<1063&&dx>582) {
    t4+=n4;
    n4+=0.01;
    rectsize4+=0.5;
    n4=constrain(n4, 0.01, 0.5);
    rectsize4=constrain(rectsize4, 0, 50);
    //background(0);

    //image(img,0,0,width,height);

    loadPixels();
    //copy(7, 22, 10, 10, 35, 25, 50, 50);
    int edgeAmount=2;
    for (int x=edgeAmount; x<width-edgeAmount; x+=3) {
      for (int y=edgeAmount; y< height-edgeAmount; y+=3) {
        if (y<736&&y>563&&x<1063&&x>582) {
       
          PxPGetPixel(x, y, pixels, width);
          int thisR=R;
          int thisG=G;
          int thisB=B;
          float colorDifference=0;
          for (int blurX=x- edgeAmount; blurX<=x+ edgeAmount; blurX++) {
            for (int blurY=y- edgeAmount; blurY<=y+ edgeAmount; blurY++) {
              PxPGetPixel(blurX, blurY, pixels, width);     // get the RGB of our pixel and place in RGB globals
              colorDifference+=dist(R, G, B, thisR, thisG, thisB);
            }
          }
          float threshold = height*3.5/4;                 
          if (colorDifference> threshold) {                           // if our pixel is an edge then draw a rect

            fill(thisR, thisG, thisB);
            noStroke();
            randomSeed(2);
            rect(x, y, rectsize4*noise(t4+50), rectsize4*noise(2*t4+50));
          }
        } else {
        } 
      }
    }
    fill(255, 255, 255, 5);                              // fade to white by drawing trancelusent white rect above
    rect(0, 0, width, height);
   // copy(mouseX, mouseY, 20, 10, mouseX-30, mouseY-15, 60, 30);
  } else {
    t4+=n4;
    n4-=0.01;
    rectsize4-=0.5;
    n4=constrain(n4, 0.01, 0.5);
    rectsize4=constrain(rectsize4, 0, 50);
    //background(0);

    //image(img,0,0,width,height);

    loadPixels();
    //copy(7, 22, 10, 10, 35, 25, 50, 50);
    int edgeAmount=2;
    for (int x=edgeAmount; x<width-edgeAmount; x+=3) {
      for (int y=edgeAmount; y< height-edgeAmount; y+=3) {
       if (y<736&&y>563&&x<1063&&x>582) {
       
          PxPGetPixel(x, y, pixels, width);
          int thisR=R;
          int thisG=G;
          int thisB=B;
          float colorDifference=0;
          for (int blurX=x- edgeAmount; blurX<=x+ edgeAmount; blurX++) {
            for (int blurY=y- edgeAmount; blurY<=y+ edgeAmount; blurY++) {
              PxPGetPixel(blurX, blurY, pixels, width);     // get the RGB of our pixel and place in RGB globals
              colorDifference+=dist(R, G, B, thisR, thisG, thisB);
            }
          }
          float threshold = height*3.5/4;                 
          if (colorDifference> threshold) {                           // if our pixel is an edge then draw a rect

            fill(thisR, thisG, thisB);
            noStroke();
            randomSeed(2);
            rect(x, y, rectsize4*noise(t4+50), rectsize4*noise(2*t4+50));
          }
        } else {
        }
      }
    }
    fill(255, 255, 255, 5);                              // fade to white by drawing trancelusent white rect above
    rect(0, 0, width, height);
    //copy(mouseX, mouseY, 20, 10, mouseX-30, mouseY-15, 60, 30);
  }
  // effect4 end~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  //image(kinect.getColorImage(), 0, 0, 200, 200);
}










int R, G, B, A;          // you must have these global varables to use the PxPGetPixel()
void PxPGetPixel(int x, int y, int[] pixelArray, int pixelsWidth) {
  int thisPixel=pixelArray[x+y*pixelsWidth];     // getting the colors as an int from the pixels[]
  A = (thisPixel >> 24) & 0xFF;                  // we need to shift and mask to get each component alone
  R = (thisPixel >> 16) & 0xFF;                  // this is faster than calling red(), green() , blue()
  G = (thisPixel >> 8) & 0xFF;   
  B = thisPixel & 0xFF;
}


//our function for setting color components RGB into the pixels[] , we need to efine the XY of where
// to set the pixel, the RGB values we want and the pixels[] array we want to use and it's width

void PxPSetPixel(int x, int y, int r, int g, int b, int a, int[] pixelArray, int pixelsWidth) {
  a =(a << 24);                       
  r = r << 16;                       // We are packing all 4 composents into one int
  g = g << 8;                        // so we need to shift them to their places
  color argb = a | r | g | b;        // binary "or" operation adds them all into one int
  pixelArray[x+y*pixelsWidth]= argb;    // finaly we set the int with te colors into the pixels[]
}
