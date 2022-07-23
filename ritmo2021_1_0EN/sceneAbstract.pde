class Scene{//Scene abstract superclass. Every scene inherits from this
   int sceneDuration;
   

boolean isEndScene(){//Checks whether a scene is completed (when number of frames left is zero)
  if(sceneDuration>0) return false;
  else return true;}

void frameCompleted(){//When a frame is completed, the number of remaining frames in decreased by one
  sceneDuration=sceneDuration-1;
  }

void finishScene(){ //Finish the scene when called by setting remaing frames to zero
   sceneDuration=0; 
}

void setDuration(int _sceneDuration){ //Scene durarion setter.
  sceneDuration=_sceneDuration; 
}

void display(){} //Abstract method. Every scene implements how the scene is displayed
}
