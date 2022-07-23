class Scene07 extends Scene { //class begins

//SHAPE VARIABLES
int delay;
float rot;
float zAxis = -500;

//COLOR VARIABLES
float BNshift = 0;
float BNshift2 = 0;

float a=50;
float c=20;

//----- SOUND

float SinLFOin;
float SawLFOin;
int Alternator;
float Volume1;
float Volume2;

int[] midiSequence1 = {47,0,0,0,0,0,0,0,/**/47,0,0,0,0,0,0,0,/**/47,0,52,0,0,0,0,0,/**/47,0,0,0,0,0,0,0};//beep
int[] midiSequence2 = {0,0,0,0,0,0,0,0,/**/0,0,0,0,0,0,0,0,/**/0,0,0,0,0,0,0,0,/**/0,0,0,0,0,0,0,0};// Bassline
int[] midiSequence3 = {55,52,59,52,60,52,59,52,/**/64,52,60,52,59,52,60,52,/**/55,52,59,52,60,52,59,52,/**/64,52,60,52,59,52,60,52};// Leadline
int[] midiSequence4 = {40,0,40,0,40,0,40,0,/**/40,0,40,0,40,0,40,0,/**/40,0,40,0,40,0,40,0,/**/40,0,40,0,40,0,40,0};// Pulse perc

float midiToHz(int note) {
  return (pow(2, ((note-69)/12.0))) * 440;
  }

int trigger = delay; 
int note = 0; 

 
  
Scene07 (int _sceneDuration) { // constructor begins
  sceneDuration=_sceneDuration;
  perspective();
  rectMode(CENTER);
} //cosntructor ends


void display() { // Display begins
    delay = delay +1;
    
     //----- SOUND
   
   int duration = 15; // 15840,7920,3960,1980,990,495,240,120
  
   SawLFOin=SawLFOin+1;    
   if (delay%240==0) { // sawLFO function Begin (saw LFO)
    SawLFOin=-0.1*SawLFOin;
     }
     float SawLFO = map(SawLFOin, 0, 240, 0, 1);
     
   SinLFOin=(sin(delay*0.075));
     float SinLFO = map(SinLFOin,-1,1, 1,0);
 
    if (delay%240==0) {  // Alternator Function Begin (Sqr LFO)
    Alternator = Alternator +1;
      }  
      
        if (Alternator%2==0) { //Alternator Positive
            Volume1 = 1;//1
            Volume2 = 0;        
            } else { // Alternator Negative      
              Volume1 = 0;
              Volume2 = 1;//1.5       
            } // Alternator End
      
       noise1.play();
       noise1.amp(0.3);//0.2
       
       //osc1.play(midiToHz(midiSequence1[note]), 0.4);
      
            
  
    if ((delay > trigger) && (note<midiSequence1.length)) { // trigger begins

       
        osc1.play(midiToHz(midiSequence1[note]+12), 0.4);//0.3
        env.play(osc1, 0.5, 0.1, 0.1,2);
        osc2.play(midiToHz(midiSequence2[note]), 0.0);//0.4
        env.play(osc2, 0.05, 0.01, 0.5, 0.5);
        osc3.play(midiToHz(midiSequence3[note]+12), 0.2);//0.1
        env.play(osc3, 0.05, 0.01, 0.5, 0.5);
        osc4.play(midiToHz(midiSequence4[note]), 0.4);//0.4  
        env.play(osc4, 0.01, 0.1, 0.5, 0.01);
           
        trigger = delay + duration;

       // Sequencer
          note = note+1;
          if (note == 32) {
            note = 0;
          }
    } // trigger ends
    
    //-----VISUAL
    
    zAxis = zAxis +5;
    if (zAxis > 750){
        zAxis = -750;
      }
    rot = rot + 0.01;
    rotateZ(rot);
    rotateY(rot);
 
  if (frameCount%60==0) {
    BNshift = BNshift +1;
    BNshift2 = BNshift2 +1;
    }  
    
     // background(44,43,86);
      //stroke(colorArray[colorShift2]);
      
      
        if (BNshift%2==0) { //if else begins
        background(colorArray[colorShift],SinLFO);
        stroke(44,43,86);
      } else {
        background(44,43,86);
        stroke(colorArray[colorShift]);
      } // if else end
      
      
      pushMatrix();
      translate(width/2,height/2,zAxis);
      rotateY(rot);
      rotateX(rot);
      box(600);
      popMatrix();
            
      pushMatrix();
      translate(width/2,height/2,2*zAxis);
      rotateY(rot);
      rotateX(rot);
      box(600);
      popMatrix();
            
      pushMatrix();
      translate(width/2,height/2,4*zAxis);
      rotateY(rot);
      rotateX(rot);
      box(600);
      popMatrix();
      
      
      pushMatrix();
      translate(width/2,height/2,6*zAxis);
      rotateY(rot);
      rotateX(rot);
      box(600);
      popMatrix();
      
      pushMatrix();
      translate(width/2,height/2,8*zAxis);
      rotateY(rot);
      rotateX(rot);
      box(600);
      popMatrix();

     
  frameCompleted();
  
} // Display ends
} //class ends
