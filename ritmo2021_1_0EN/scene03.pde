class Scene03 extends Scene { //class begins
int delay;

//----- SOUND

float SinLFOin;
float SawLFOin;
int Alternator;
float Volume1;
float Volume2;

int[] midiSequence1 = {0,47,0,47,0,47,0,47,/**/0,48,0,48,0,48,0,48,/**/0,50,0,50,0,50,0,50,/**/0,52,0,52,0,52,0,52};// Lead Line 48,52,55,59,48,52,55,59,/**/55,57,55,59,54,59,55,52
int[] midiSequence2 = {40,40,40,40,40,40,40,40,/**/40,40,40,40,40,40,40,40,/**/40,40,40,40,40,40,40,40,/**/40,40,40,40,40,40,40,40};// Bass line
int[] midiSequence3 = {52,52,52,52,55,55,55,55,/**/57,57,57,57,52,52,52,52,/**/52,52,52,52,57,57,57,57,/**/55,55,55,55,59,59,59,59};// Drone
int[] midiSequence4 = {0,0,0,0,0,0,0,0,/**/0,0,0,0,0,0,0,0,/**/0,0,0,0,0,0,0,0,/**/0,0,0,0,0,0,0,0};// Clic




float midiToHz(int note) {
  return (pow(2, ((note-69)/12.0))) * 440;
  }

int trigger = delay; 
int note = 0; 

//----- VISUAL

float  r; //radius
int total = 50; // number of points
float rotationSpeed; //rotation speed

float BNshift = 0;
float BNshift2 = 0;
  
Scene03(int _sceneDuration) { // constructor begins
  sceneDuration=_sceneDuration;
  ortho();
} //cosntructor ends

void display() { // Display begins

  background(44,43,86);
  
  //----- SOUND
   
   int duration = 30; 
        
       noise1.play();
       noise1.amp(0.2);//0.2
       
       //osc1.play(midiToHz(midiSequence1[note]), 0.4);
                  
    if ((delay > trigger) && (note<midiSequence1.length)) { // trigger begins
      
        osc1.play(midiToHz(midiSequence1[note]), 0.8);//SawLFO*0.4
       // env.play(osc1, 0.1, 0.1, 0.5,2); //osc1, attackTime, sustainTime, sustainLevel, releaseTime // 0.01, 0.007, 0.7, 1.5
        osc2.play(midiToHz(midiSequence2[note]), 0.2);//SawLFO*0.4
        env.play(osc2, 0.5, 0.1, 0.5, 2);
        osc3.play(midiToHz(midiSequence3[note]), 0.2);//0.4
        env.play(osc3, 0.5, 0.1, 0.5, 2);
       // osc4.play(210, 0.1*SawLFO);//0.4     
           
        trigger = delay + duration;

       // Sequencer
          note = note+1;
          if (note == 32) {
            note = 0;
          }
    } // trigger ends
  
  
  //VISUAL
  
  translate(width/2,height/2);
  rotateX(rotationSpeed*2);
  rotateY(120);
  rotateZ(rotationSpeed);
  rotationSpeed = rotationSpeed+0.002;
  delay = delay +1;
  
  if (delay%120==0) {
    BNshift = BNshift +1;
    BNshift2 = BNshift2 +1;
    }  

      if (BNshift%2==0) { //if else begins
        background(241,228,126);
      } else {
        background(44,43,86);        
      } // if else end
      
     
      if (delay>=1) {
          r = height/3;
        }  
        
      if (delay>=120) {
          r = height/2;
        }  
        
      if (delay>=240) {
          r = 2*height/3;
        }
        
      if (delay>=600) {
          r = height/3;
        }
        
      if (delay>=720) {
          r = height/4;
        }
        
      if (delay>=840) {
          r = height/3;
        }  
        
      if (delay>=1080) {
          r = height/2;
        }
        
       if (delay>=1200) {
          r = height;
        }
        
       if (delay>=1440) {
          r = 2*height/3;
        } 
        
  

   
   float offset = 0;
   
      for (int i = 0; i < total;i = i+1){ // for 1 begin
      float lon = map(i,0,total,-PI,PI); // longitude
      for (int j = 0; j < total;j = j+1)  { // for 2 begin
        
                
        float lat = map(j,0,total,-HALF_PI,HALF_PI); // latitude
        float x = r * sin (lon) * cos (lat);
        float y = r * sin (lon) * sin (lat);
        float z = r * cos (lon);
        
        stroke(colorArray[colorShift3]);
        strokeWeight(3);
        point(x,y,z);
        
           offset = offset + 0.01;
  
       } // for 2 end
     } // for 1 end  
  
   
     
    
   
     
  frameCompleted();
  
} // Display ends
} //class ends 
