class Scene05 extends Scene { //class begins

//-----VISUAL

float  r = height/3; //radius
int total = 50; // number of points
float rotationSpeed; //rotation speed
int delay;

float angle = 0;

//----- SOUND

float SinLFOin;
float SawLFOin;
int Alternator;
float Volume1;
float Volume2;

int[] midiSequence1 = {47,0,0,0,0,0,0,0,/**/0,0,0,0,0,0,0,0,/**/47,0,0,0,0,0,0,0,/**/0,0,0,0,0,0,0,0};// Lead Line 48,52,55,59,48,52,55,59,/**/55,57,55,59,54,59,55,52
int[] midiSequence2 = {40,0,40,0,40,0,40,0,/**/40,0,40,0,40,0,40,44,/**/40,0,40,0,40,0,40,0,/**/40,0,40,0,40,0,40,0};// Bass line
int[] midiSequence3 = {0,0,0,0,0,0,0,0,/**/0,0,0,0,0,0,0,0,/**/0,0,0,0,0,0,0,0,/**/0,0,0,0,0,0,0,0};// Drone
int[] midiSequence4 = {0,0,0,0,0,0,0,0,/**/0,0,0,0,0,0,0,0,/**/0,0,0,0,0,0,0,0,/**/0,0,0,0,0,0,0,0};// Clic

float midiToHz(int note) {
  return (pow(2, ((note-69)/12.0))) * 440;
  }

int trigger = delay; 
int note = 0; 
  
Scene05 (int _sceneDuration) { // constructor begins
  sceneDuration=_sceneDuration;
  ortho();
} //cosntructor end

void display() { // Display begins

  background(44,43,86);
  translate(width/2,height/2);
  rotateX(0);
  rotateY(rotationSpeed);
  rotateZ(0.787);
  rotationSpeed = rotationSpeed+0.005 ;
  delay = delay +1;
  noFill();
  stroke (241,241,160);
  strokeWeight(2);
  
   //----- SOUND
   
   int duration = 15; // 15840,7920,3960,1980,990,495,240,120
  
   SawLFOin=SawLFOin+1;    
   if (delay%240==0) { // sawLFO function Begin (saw LFO)
    SawLFOin=-0.1*SawLFOin;
     }
     float SawLFO = map(SawLFOin, 0, 240, 0, 1);
     
   SinLFOin=(sin(delay*0.075));
     float SinLFO = map(SinLFOin,-1,1, 1,0);
 
    if (delay%720==0) {  // Alternator Function Begin (Sqr LFO)
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
      
            
  
    if ((delay > trigger) && (note<midiSequence1.length)) { // trigger begins

       
        osc1.play(midiToHz(midiSequence1[note]+12), 0.4);//0.2
        env.play(osc1, 0.5, 0.1, 0.1,2); 
        osc2.play(midiToHz(midiSequence2[note]), 0.4);//0.1
        env.play(osc2, 0.01, 0.1, 0.5, 0.01);
        // osc3.play(midiToHz(midiSequence3[note]), 0.0);//0.2
        // env.play(osc3, 0.5, 0.1, 0.5, 2);
        // osc4.play(midiToHz(midiSequence4[note]), 0.0);//0.2 
        // env.play(osc4, 0.5, 0.1, 0.1,2);
           
        trigger = delay + duration;

       // Sequencer
          note = note+1;
          if (note == 32) {
            note = 0;
          }
    } // trigger ends

  //-----VISUAL
  
   if (delay>=0){//if begins 
    stroke(255,150*SinLFO);
    noFill();
    pushMatrix();    
    box(height);
    popMatrix();
    } //if end
    
   if (delay>=240+15){//if begin 
    fill (colorArray[colorShift],150*SinLFO);
    noStroke ();
    pushMatrix();    
    box(height/3);
    popMatrix();
    } //if end
    
   if (delay>=480+30){//if begins 
    noFill ();
    stroke (255);
    pushMatrix();    
    box(height/2);
    popMatrix();
    } //if end
            
           
    if (delay>=720+45){//if begins    
    
     background(240,81,36);
    
       float offset = 0;
   
      for (int i = 0; i < total;i = i+1){
      float lon = map(i,0,total,-PI,PI); // longitude
      for (int j = 0; j < total;j = j+1)  {
        
        float a = angle + offset;
        
        float lat = map(j,0,total,0,2); // latitude
        float x = r * sin (lon) * cos (lat+a);
        float y = r * sin (lon) * sin (lat+a);
        float z = r * cos (lon);
        
        stroke(241,241,160,255*SinLFO);
        strokeWeight(2);
        point(x,y,z);
        
        offset = offset + 0.001;
  
   }
  
  angle = angle+ 0.001;
   }
    } //if ends
      
  frameCompleted();
  
} // Display ends
} //class ends
