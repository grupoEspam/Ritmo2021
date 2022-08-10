class Scene02 extends Scene{  // class begins
float rot;
int delay;

//----- SOUND

float SinLFOin;
float SawLFOin;
int Alternator;
float Volume1;
float Volume2;

int[] midiSequence1 = {52,52,52,52,52,52,52,52,/**/0,0,0,0,0,0,0,0,/**/54,59,57,60,54,54,54,54,/**/52,52,52,52,54,54,54,54};// Lead Line 48,52,55,59,48,52,55,59,/**/55,57,55,59,54,59,55,52
int[] midiSequence2 = {48,48,48,48,48,48,48,48,/**/0,0,0,0,0,0,0,0,/**/0,0,0,0,47,47,47,47,/**/48,48,48,48,0,0,0,0};// Bass line
int[] midiSequence3 = {48,48,48,48,48,48,48,48,/**/0,0,0,0,0,0,0,0,/**/47,47,47,47,47,47,47,47,/**/47,47,47,47,47,47,47,47};// Drone
int[] midiSequence4 = {0,0,0,0,74,81,0,81,/**/0,0,0,0,0,0,0,100,/**/0,0,0,0,0,79,0,79,/**/0,0,88,0,0,0,0,100};// Clic

//----- VISUAL

float  r; //radius
int total = 50; // number of points
float rotationSpeed; //rotation speed



float midiToHz(int note) {
  return (pow(2, ((note-69)/12.0))) * 440;
  }

int trigger = delay; 
int note = 0; 

    
Scene02(int _sceneDuration){
  rectMode(CENTER);
  sceneDuration=_sceneDuration;
}

void display() { // function begins

delay = delay +1;

 //----- SOUND
   
   int duration = 120; 
  
   SawLFOin=SawLFOin+1;    
   if (delay%480==0) { // sawLFO function Begins (saw LFO)
    SawLFOin=-1*SawLFOin;
     }
     float SawLFO = map(SawLFOin, 0, 480, 0, 1);
     
 
      
       noise1.play();
       noise1.amp(0.05);//0.2
       
       //osc1.play(midiToHz(midiSequence1[note]), 0.4);
      
            
  
    if ((delay > trigger) && (note<midiSequence1.length)) { // trigger begins

       
        osc1.play(midiToHz(midiSequence1[note]), 0.8);//SawLFO*0.4
        env.play(osc1, 0.5, 0.1, 0.5, 2); //osc1, attackTime, sustainTime, sustainLevel, releaseTime // 0.01, 0.007, 0.7, 1.5
        osc2.play(midiToHz(midiSequence2[note]), 0.2*SawLFO);//SawLFO*0.4
        env.play(osc2, 0.5, 0.1, 0.5, 2);
       //osc3.play(midiToHz(midiSequence2[note]), 0.1*SawLFO);//0.4
       // osc3.play(200, 0);//0.4
       // env.play(osc3, attackTime, sustainTime, sustainLevel, releaseTime*2);
       // osc4.play(210, 0);//0.4     
           
        trigger = delay + duration;

       // Sequencer
          note = note+1;
          if (note == 32) {
            note = 0;
          }
    } // trigger ends

//----- VISUAL
 
    if (delay>=120){    
   
       background(240,81,36);   
    
     } //if end
     
     if (delay>=240){    
   
       background(55,139,189);
      
     } //if end
     
      if (delay>=360){    
   
       background(44,43,86);
      
     } //if end
      
        
     if (delay>=480){//if begins 
      
       background(44,43,86);
       r = height/3;
       translate(width/2,height/2);
       rotateX(rotationSpeed*2);
       rotateY(120);
       rotateZ(rotationSpeed);
       rotationSpeed = rotationSpeed+0.001;
   
        float offset = 0;
   
      for (int i = 0; i < total;i = i+1){ // for 1 begins
      float lon = map(i,0,total,-PI,PI); // longitude
      for (int j = 0; j < total;j = j+1)  { // for 2 begins
        
                
        float lat = map(j,0,total,-HALF_PI,HALF_PI); // latitude
        float x = r * sin (lon) * cos (lat);
        float y = r * sin (lon) * sin (lat);
        float z = r * cos (lon);
        
        stroke(colorArray[colorShift4]);
        strokeWeight(2);
        point(x,y,z);
        
           offset = offset + 0.01;
  
   } // for 2 end
   } // for 1 end  
   } //if end
   
 
   frameCompleted();
 
 }//function ends
 
}//class ends
