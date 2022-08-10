
class Movie {
  //Control variables
  int totalScenes=15; // total number of scenes. Increase if a new scene is added
  int sceneCount =-1; // Current scene
  int state=0; // Scene state (0 = building scene, 1 = Playing scene)

  //Scene variables
  Scene[] scenesVector = new Scene[totalScenes];//Each scene is an instance of the sceneAbstract superclass and is stored in a vector.
  int[] scenesDuration = {480, 1920, 960, 1920, /**/1785, 1020, 1020, 1020, /**/1020, 765, 1020, 1020, /**/1020, 1020, 1700};//Scene duration in frames.
  //480,1920,960,1920,/**/2040,960,1440,1530,/**/770,1550,1520,770,/**/960,3070,500

  Scene currentScene;//Object pointing to the currents scene

  Boolean Pressed = false;
  Boolean Clicked = false;

  //Touchscreen interaction are provided for debugging
  void update() {
    if (mousePressed == true && Pressed == false) {
      Pressed = true;
      if ( mouseX > width/2) {         //An event on the right of the screen  -> next scene
        //println("Next Escene" + sceneCount);
        try {
          currentScene.finishScene();
          if (sceneCount != 14) {
            currentScene.finishScene();
          } else {
            MenuState = 0;
            sceneCount = 0;
          }
        }
        catch(Exception e) {
          MenuState = 0;
          println("Error Escena");
        }
      }

      if ( mouseX < width/2) {        //An event on the left of the screen-> previous scene
        if (sceneCount > 0) sceneCount=sceneCount-2;
        state=0;
      }
    } else {
      Clicked = false;
    }

    if (mousePressed != true) {
      Pressed = false;
    }
  }// end update

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


  //selects a scene in sequence
  void seqSelector() {
    if (state==0 && sceneCount < totalScenes - 1) {
      sceneCount=sceneCount+1;
      println("Escena " + sceneCount);
    }
  }

  //displays a scene stored in the vector
  void displaySceneVector(int sceneIndex) {
    if (state==0) {
      scenesVector[sceneIndex].setDuration(scenesDuration[sceneIndex]);
      currentScene=scenesVector[sceneIndex];
      state=1;
    } else
    {
      if (!scenesVector[sceneIndex].isEndScene()) {
        scenesVector[sceneIndex].display();
      } else {
        state=0;
      }
    }
  }

  //Constructor to create the movie
  Movie(SinOsc osc1, SinOsc osc2, SinOsc osc3, SinOsc osc4, PinkNoise noise1, Env env) {

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
    osc1 = osc1;
    osc2 = osc3;
    osc3 = osc3;
    osc4 = osc4;
    noise1 = noise1;
    env = env;
  }


  void display() {
    colorClock ();
    seqSelector();
    displaySceneVector(sceneCount);
    //update();
  }
}
