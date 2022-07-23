class Scene01 extends Scene{  // class begins

int delay;

//----- SOUND

float SinLFOin;
float SawLFOin;
int Alternator;
float Volume1;
float Volume2;

int[] midiSequence1 = {52,55,48,55,54,54,54,54,/**/52,57,55,59,54,59,55,52,/**/52,52,52,52,0,0,0,0,/**/52,52,52,52,54,54,54,54};// Lead Line 48,52,55,59,48,52,55,59,/**/55,57,55,59,54,59,55,52
int[] midiSequence2 = {40,42,35,43,52,52,52,52,/**/52,52,52,52,48,48,48,48,/**/48,48,48,48,48,48,0,0,/**/48,48,48,48,45,45,45,45};// Bass line
int[] midiSequence3 = {53,53,53,53,53,53,53,53,/**/53,53,53,53,53,53,53,53,/**/48,48,48,47,47,47,47,47,/**/47,47,47,47,47,47,47,47};// Drone
int[] midiSequence4 = {0,0,0,0,74,81,0,81,/**/0,0,0,0,0,0,0,100,/**/0,0,0,0,0,79,0,79,/**/0,0,88,0,0,0,0,100};// Clic




float midiToHz(int note) {
  return (pow(2, ((note-69)/12.0))) * 440;
  }

int trigger = frameCount; 
int note = 0; 


//----- IMAGE

   Box02 b1; 
   PVector[] pos;
   int particleLenght = 4; // number of particles
   float spawnClock; // clock for particle creation
   float spawnTime=192; // time spam for particle creation

Scene01(int _sceneDuration){ //constructor begins 

    sceneDuration=_sceneDuration;
    b1 = new Box02(300,4500,300);
    pos = new PVector[particleLenght];
    for(int i = 0; i < pos.length; i = i+1){//for begin
       pos[i] = new PVector(random(-width/3,width/3), random(-height/3,height/3)); 
    }//for ends
} // constructor ends


//SPAWNPARTICLES create particles every 240 frames 
void spawnParticles () {  // function begins
          if (frameCount% 240==0) {
          spawnClock = spawnClock +1;
          if (spawnClock>= pos.length)
          spawnClock=pos.length;
          }      
  
}// function ends

void display() {  // function begins
  background(44,43,86);
  
   //----- SOUND
   
   int duration = 120;
  
      
       noise1.play();
       noise1.amp(0.2);//0.2
       
       //osc1.play(midiToHz(midiSequence1[note]), 0.4);
      
            
  
    if ((frameCount > trigger) && (note<midiSequence1.length)) { // trigger begins

       
        osc1.play(midiToHz(midiSequence1[note]), 0.8);//SawLFO*0.4
        env.play(osc1, 0.5, 0.1, 0.5, 2); //osc1, attackTime, sustainTime, sustainLevel, releaseTime // 0.01, 0.007, 0.7, 1.5
        osc2.play(midiToHz(midiSequence2[note]), 0.2);//SawLFO*0.4
        env.play(osc2, 0.5, 0.1, 0.5, 2);
       // osc3.play(midiToHz(midiSequence2[note]), 0.1);//0.4
       // env.play(osc3, attackTime, sustainTime, sustainLevel, releaseTime*2);
       // osc4.play(210, 0);//0.4     
           
        trigger = frameCount + duration;

       // Sequencer
          note = note+1;
          if (note == 32) {
            note = 0;
          }
    } // trigger end
  
  //----- VISUAL
  
  translate(width/2,height/2);
  spawnParticles();
  for(int i = 0; i < spawnClock; i= i+1){ //for begin
    pushMatrix();
    b1.pos(pos[i].x,pos[i].y);
    b1.rot();
    b1.display();
    popMatrix();
   }//for end
  frameCompleted();


 }//function end
 
}//class end



class Box02 { //Class Box Begin
  float r; 
  float sizeX;
  float sizeY;
  float sizeZ;


  Box02(int tempSizeX, int tempSizeY, int tempSizeZ) { 
    
    sizeX = tempSizeX;
    sizeY = tempSizeY;
    sizeZ = tempSizeZ;
   
  }
  
  //POSITION locates the boxes
    void pos (float tempX, float tempY) { 
     translate(tempX, tempY); 
  }
  
   //rotates the whole scene
  void rot () {    
    rotateX(0); 
    rotateY(r); // rotion axis is Y
    rotateZ(0.787);
    r = r+0.002;
  }
  
  //DISPLAY 
  void display () {
    box (sizeX,sizeY,sizeZ) ;
    fill(colorArray[colorShift4],150);
    stroke(44,43,86);
    noStroke();
  }    
}  //class Box ends
