class Scene11 extends Scene { //class begins

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

int[] midiSequence1 = {40,43,47,52,55,59,40,43,/**/47,52,55,59,40,43,47,47,/**/40,43,47,52,55,59,40,43,/**/47,52,55,59,40,43,47,47};// lead line
int[] midiSequence2 = {0,0,0,0,0,0,0,0,/**/0,0,0,0,0,0,0,0,/**/0,0,0,0,0,0,0,0,/**/0,0,0,0,0,0,0,0};// bassline
int[] midiSequence3 = {52,52,52,52,55,55,55,55,/**/47,47,47,47,55,55,55,55,/**/52,52,52,52,55,55,55,55,/**/48,48,48,48,55,55,55,55};// pad 1
int[] midiSequence4 = {55,52,59,52,60,52,59,52,/**/64,52,60,52,59,52,60,52,/**/55,52,59,52,60,52,59,52,/**/64,52,60,52,59,52,60,52};// lead Line 2

float midiToHz(int note) {
  return (pow(2, ((note-69)/12.0))) * 440;
  }

int trigger = delay; 
int note = 0; 
 
  
Scene11 (int _sceneDuration) { // constructor begins
  sceneDuration=_sceneDuration;
  perspective();
  rectMode(CENTER);
} //cosntructor end


void display() { // Display begins

 delay = delay +1; // 
 rot = QUARTER_PI;

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
            } // Alternator Ends
      
       noise1.play();
       noise1.amp(0.05);//0.2
       
       //osc1.play(midiToHz(midiSequence1[note]), 0.4);
      
            
  
    if ((delay > trigger) && (note<midiSequence1.length)) { // trigger begins

       
        osc1.play(midiToHz(midiSequence1[note]+12), 0.4);//0.3
        env.play(osc1, 0.1, 0.01, 0.5, 0.5);
        osc2.play(midiToHz(midiSequence2[note]), 0.4);//0.4
        env.play(osc2, 0.05, 0.01, 0.5, 0.5);
        osc3.play(midiToHz(midiSequence3[note]), 0.0);//0.1
       // env.play(osc3, 0.05, 0.01, 0.5, 0.5);
        osc4.play(midiToHz(midiSequence4[note]), 0.4);//0.4  
       // env.play(osc4, 0.01, 0.1, 0.5, 0.01);
           
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
 
  if (frameCount%30==0) {
    BNshift = BNshift +1;
    BNshift2 = BNshift2 +1;
    }  
    
     // background(44,43,86);
      //stroke(colorArray[colorShift2]);
      
      
      if (BNshift%2==0) { //if else begin
        background(colorArray[colorShift2]);
      } else {
        background(44,43,86);
      } // if else end
      
      if (BNshift2%2==0) { //if else begin
        stroke(44,43,86);
       } else {
        stroke(colorArray[colorShift2]);
       } // if else end
      
      
      pushMatrix();
      translate(width/2,height/2,zAxis);
      rotateZ(rot);
      box(400);
      popMatrix();
      
      if (delay>=240+15){
      pushMatrix();
      translate(width/2,height/2,2*zAxis);
      rotateZ(rot);
      box(400);
      popMatrix();
      }
      
       if (delay>=480+30){
      pushMatrix();
      translate(width/2,height/2,4*zAxis);
      rotateZ(rot);
      box(400);
      popMatrix();
      }
      
       if (delay>=720+45){
      pushMatrix();
      translate(width/2,height/2,6*zAxis);
      rotateZ(rot);
      box(400);
      popMatrix();
      }   
      
       if (delay>=960+60){
      pushMatrix();
      translate(width/2,height/2,8*zAxis);
      rotateZ(rot);
      box(400);
      popMatrix();
      } 
      
  frameCompleted();
  
} // Display ends
} //class ends
