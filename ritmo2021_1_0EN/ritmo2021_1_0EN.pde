//Ritmo 2021 v1.0 English credits

/*
Directing:
Luis Fernando Medina Cardona (luscus) - Associate Professor, Universidad Nacional de Colombia. Head researcher.
Julian David Sandoval Ospina (Bonnie) - Research Assistant

Coding: Bonnie, Luscus

Music composing: Bonnie
*/

/*
Ritmo 2021: production of an experimental short film using computer programming - Project funded by the research-creation projects 2020 calling - Faculty of Arts, Universidad Nacional de Colombia (Bogotá campus)
Research group: </espam> - Open Media Production Space. Creative Research Group. Faculty of Arts, Universidad Nacional de Colombia (Bogotá Campus)
*/

//Headphones or good audio system is adviced. Depending on the sound card and the Sound Processing Library. the quality of sound might be affected.
//Download other artifacts at: linktr.ee/ritmo2021
//Copyleft 2021-2022


import processing.sound.*;
//Sound s;



//Control variables
int totalScenes=15; // total number of scenes. Increase if a new scene is added
int sceneCount =-1; // Current scene
int state=0; // Scene state (0 = building scene, 1 = Playing scene)

//Scene variables
Scene[] scenesVector = new Scene[totalScenes];//Each scene is an instance of the sceneAbstract superclass and is stored in a vector.
int[] scenesDuration = {480,1920,960,1920,/**/1785,1020,1020,1020,/**/1020,765,1020,1020,/**/1020,1020,1700};//Scene duration in frames.
                      //480,1920,960,1920,/**/2040,960,1440,1530,/**/770,1550,1520,770,/**/960,3070,500

Scene currentScene;//Object pointing to the currents scene
boolean recording=false;

//key options are provided for debugging
void keyPressed(){
  switch(key){
     case 'f':
     case 'F':
        currentScene.finishScene(); //f : fastforward (next scene)
        break;
     case 'b':
     case 'B':
        if (sceneCount > 0) sceneCount=sceneCount-2;state=0; //b : backwards (previous scene)
        break;

     case 'p':
     case 'P':
        if (looping) noLoop();  // p: pause (stop or resume)
        else loop();
        break;  
     
     case 'e':
     case 'E':
        exit();  //exit 
        break;
     case 's':
     case 'S':
        saveFrame("output/snapshot####.png"); //save current frame
        break;
     case 'r':
     case 'R':
        recording=!recording; //record a sequence of frames (start or stop recording)
  }
}


//currentScene=scene01;
//COLOR VARIABLES
color[] colorArray ={
  color(241,228,126), // 0 - light yellow
  color(240,81,36), // 2 - orange
  color(55,139,189), // 4 - blue
  color(185,44,58), // 3 - wine  
  color(57,188,168),// 5 - green
  color(245,166,31)// 1 - ocher
};

//----- SOUND

SinOsc osc1;
SinOsc osc2;
SinOsc osc3;
SinOsc osc4;

PinkNoise noise1;
Env env;


//----- IMAGE

int colorShift;
int colorShift2;
int colorShift3;
int colorShift4;
int colorShift5;

//this function changes the color palette depending on the current frame
void colorClock() {
  
    if (frameCount%15==0) {
    colorShift = colorShift +1;
    if (colorShift==colorArray.length)
      colorShift=0;
    }
    
     if (frameCount%30==0) {
    colorShift2 = colorShift2 +1;
    if (colorShift2==colorArray.length)
      colorShift2=0;
      }
            
     if (frameCount%60==0) {
    colorShift3 = colorShift3 +1;
    if (colorShift3==colorArray.length)
      colorShift3=0;
    }
    
      if (frameCount%120==0) {
    colorShift4 = colorShift4 +1;
    if (colorShift4==colorArray.length)
      colorShift4=0;
    }
    
      if (frameCount%240==0) {
    colorShift5 = colorShift5 +1;
    if (colorShift5==colorArray.length)
      colorShift5=0;
    } 
    
    
    
    
  }
 
//selects a scene randomly. Deprecated and kept for debugging purposes 
void randomSelector(){
 if(state==0)
   sceneCount=int(random(0,totalScenes));
}

//selects a scene in sequence
void seqSelector(){
     if(state==0 && sceneCount < totalScenes - 1){
       sceneCount=sceneCount+1;  
     }
     else
        if(state==0 && sceneCount >= totalScenes -1)
        exit();
}

//displays a scene stored in the vector
void displaySceneVector(int sceneIndex){
  if(state==0){
     scenesVector[sceneIndex].setDuration(scenesDuration[sceneIndex]);
     currentScene=scenesVector[sceneIndex];
     state=1;
     }
  else 
     {           
     if(!scenesVector[sceneIndex].isEndScene()){
        scenesVector[sceneIndex].display();  
        }
     else {state=0;}
     }
}


void setup(){
  fullScreen(P3D);
  //size(800,450,P3D);
  frameRate(60);
//  s=new Sound(this);
//  s.sampleRate(22050);
 
  //Every scene is created using a constructor whose only paremeter is the scene duration. All scenes are created with a zero frames duration
 // thereafter displaySceneVector modifies each scene duration folowwing the number of frames stored in the vector scenesDuration
  scenesVector[0]=new Scene00(0);
  scenesVector[1]=new Scene01(0);
  scenesVector[2]=new Scene02(0);
  scenesVector[3]=new Scene03(0);
  scenesVector[4]=new Scene04(0);
  scenesVector[5]=new Scene05(0);
  scenesVector[6]=new Scene06(0);  
  scenesVector[7]=new Scene07(0);
  scenesVector[8]=new Scene08(0);  
  scenesVector[9]=new Scene09(0);  
  scenesVector[10]=new Scene10(0);  
  scenesVector[11]=new Scene11(0);
  scenesVector[12]=new Scene12(0);
  scenesVector[13]=new Scene13(0);
  scenesVector[14]=new Scene14(0);
  
  //----- SOUND
/*  Sound s = new Sound(this);
  s.outputDevice(1);*/
  
  osc1 = new SinOsc(this);
  osc2 = new SinOsc(this);
  osc3 = new SinOsc(this);
  osc4 = new SinOsc(this);  
  noise1 = new PinkNoise(this);
  env = new Env(this);
  
  
}

void draw(){
  noCursor();
  background (44,43,86);
  colorClock (); 
  //randomSelector()
  seqSelector(); 
  displaySceneVector(sceneCount);
  if (recording) saveFrame("output/movie-#####.png");
}
