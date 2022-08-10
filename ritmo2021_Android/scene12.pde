class Scene12 extends Scene { //class begin

//SHAPE VARIABLES
float  r = height/3; //radius
int total = 50; // number of points
float rotationSpeed; //rotation speed
int delay;

//----- SOUND

float SinLFOin;
float SawLFOin;
int Alternator;
float Volume1;
float Volume2;

int[] midiSequence1 = {40,43,47,52,55,59,40,43,/**/47,52,55,59,40,43,47,47,/**/40,43,47,52,55,59,40,43,/**/47,52,55,59,40,43,47,47};// lead line
int[] midiSequence2 = {47,47,47,47,0,0,0,0,/**/42,42,42,42,0,0,0,0,/**/47,47,47,47,0,0,0,0,/**/42,42,42,42,40,40,40,40};// bassline
int[] midiSequence3 = {52,52,52,52,55,55,55,55,/**/47,47,47,47,55,55,55,55,/**/52,52,52,52,55,55,55,55,/**/47,47,47,47,55,55,55,55};// pad 1
int[] midiSequence4 = {40,40,40,40,42,42,42,42,/**/35,35,35,35,43,43,43,43,/**/40,40,40,40,42,42,42,42,/**/35,35,35,35,36,38,40,43};// pad 2

float midiToHz(int note) {
  return (pow(2, ((note-69)/12.0))) * 440;
  }

int trigger = delay; 
int note = 0; 
  
Scene12(int _sceneDuration) { // constructor begins
  sceneDuration=_sceneDuration;
  ortho();
} //cosntructor ends

void display() { // Display begins

delay = delay +1;

//----- SOUND
   
   int duration = 15; // 15840,7920,3960,1980,990,495,240,120
  
   SawLFOin=SawLFOin+1;    
   if (delay%255==0) { // sawLFO function Begin (saw LFO)
    SawLFOin=-0.1*SawLFOin;
     }
     float SawLFO = map(SawLFOin, 0, 240, 0, 1);
     
   SinLFOin=(sin(delay*0.025));
     float SinLFO = map(SinLFOin,-1,1, 1,0);
 
    if (delay%255==0) {  // Alternator Function Begin (Sqr LFO)
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
       noise1.amp(0.05);//0.2
       
       //osc1.play(midiToHz(midiSequence1[note]), 0.4);
      
            
  
    if ((delay > trigger) && (note<midiSequence1.length)) { // trigger begin

       
        osc1.play(midiToHz(midiSequence1[note]+12), 0.4);//0.3
        env.play(osc1, 0.1, 0.01, 0.5, 0.05);
        osc2.play(midiToHz(midiSequence2[note]), 0.0);//0.4
        env.play(osc2, 0.05, 0.01, 0.5, 0.5);
        osc3.play(midiToHz(midiSequence3[note]), 0.0);//0.1
        //env.play(osc3, 0.05, 0.01, 0.5, 0.5);
        osc4.play(midiToHz(midiSequence4[note]+12), 0.4);//0.4  
        //env.play(osc4, 0.01, 0.1, 0.5, 0.05);
           
        trigger = delay + duration;

       // Sequencer
          note = note+1;
          if (note == 32) {
            note = 0;
          }
    } // trigger ends
    
    //-----VISUAL

  background(44,43,86);
  translate(width/2,height/2);
  rotateX(rotationSpeed*4);
  rotateY(120);
  rotateZ(rotationSpeed);
  rotationSpeed = rotationSpeed+0.005 ;
  
   
    float offset = 0;
   
      for (int i = 0; i < total;i = i+1){
      float lon = map(i,0,total,-PI,PI); // longitude
      for (int j = 0; j < total;j = j+1)  {
        
                
        float lat = map(j,0,total,-HALF_PI,HALF_PI); // latitude
        float x = r * sin (lon*SinLFO) * cos (lat) +200;
        float y = r * sin (lon) * sin (lat*SinLFO) +200;
        float z = r * -cos (lon*SinLFO);
        
        stroke(colorArray[colorShift]);
        strokeWeight(3);
        point(x,y,z);
        
           offset = offset + 0.01;
  
       }
       }
   
   for (int i = 0; i < total;i = i+1){
      float lon = map(i,0,total,-PI,PI); // longitude
      for (int j = 0; j < total;j = j+1)  {
        
                
        float lat = map(j,0,total,-HALF_PI,HALF_PI); // latitude
        float x = r * sin (lon*SinLFO) * cos (lat) -200;
        float y = r * sin (lon) * sin (lat*SinLFO) -200;
        float z = r * cos (lon*SinLFO);
        
        stroke(colorArray[colorShift]);
        strokeWeight(3);
        point(x,y,z);
        
           offset = offset + 0.01;
  
        }
        }
 
   
   
     
  frameCompleted();
  
} // Display ends
} //class ends
