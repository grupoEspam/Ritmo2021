class Scene04 extends Scene { //class begin

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

int[] midiSequence1 = {47,0,0,0,0,0,0,0,/**/0,0,0,0,0,0,0,0,/**/52,0,0,0,0,0,0,0,/**/0,0,0,0,0,0,0,0};// Lead Line 48,52,55,59,48,52,55,59,/**/55,57,55,59,54,59,55,52
int[] midiSequence2 = {0,0,0,0,0,0,0,0,/**/0,0,0,0,0,0,0,0,/**/0,0,0,0,0,0,0,0,/**/0,0,0,0,0,0,0,0};// Bass line
int[] midiSequence3 = {0,0,0,0,0,0,0,0,/**/0,0,0,0,0,0,0,0,/**/0,0,0,0,0,0,0,0,/**/0,0,0,0,0,0,0,0};// Drone
int[] midiSequence4 = {0,0,0,0,0,0,0,0,/**/0,0,0,0,0,0,0,0,/**/0,0,0,0,0,0,0,0,/**/0,0,0,0,0,0,0,0};// Clic

float midiToHz(int note) {
  return (pow(2, ((note-69)/12.0))) * 440;
  }

int trigger = delay; 
int note = 0; 

//----- VISUAL



  
Scene04(int _sceneDuration) { // constructor begin
  sceneDuration=_sceneDuration;
  //ortho();
} //cosntructor end

void display() { // Display begin
  background(241,228,126);
  translate(width/2,height/2);
  rotationSpeed = rotationSpeed+0.0005 ;
  delay = delay +1;
  noFill();
    
  //----- SOUND
   
   int duration = 15;
   
   SinLFOin=(sin(delay*0.030));
     float SinLFO = map(SinLFOin,-1,1, 1,0);
        
       noise1.play();
       noise1.amp(0.3);//0.2
       
       //osc1.play(midiToHz(midiSequence1[note]), 0.4);
      
            
  
    if ((delay > trigger) && (note<midiSequence1.length)) { // trigger begin

       
        osc1.play(midiToHz(midiSequence1[note]+12), 0.4);//0.2
        env.play(osc1, 0.5, 0.1, 0.1,2); //
       // osc2.play(midiToHz(midiSequence2[note]), 0.1);//
       // env.play(osc2, 0.5, 0.1, 0.5, 2);
       // osc3.play(midiToHz(midiSequence3[note]), 0.1);//
       // env.play(osc3, 0.5, 0.1, 0.5, 2);
       // osc4.play(midiToHz(midiSequence4[note]), 0.0);//0.2  
       // env.play(osc4, 0.5, 0.1, 0.1,2);
           
        trigger = delay + duration;

       // Sequencer
          note = note+1;
          if (note == 32) {
            note = 0;
          }
    } // trigger end
  
  
  //----- VISUAL
   
  if (delay>=0){ //if begin 
    rotateX(120+rotationSpeed);
    rotateY(120);
    rotateZ(120);
    stroke (44,43,86);
    
   } //if end
     
  
   if (delay>=240+15){ //if begin
     rotateX(120+rotationSpeed);
     rotateY(120);
     rotateZ(120);
     stroke (44,43,86);
     box(height/2);
     
   } //if end
   
   if (delay>=480+30){ //if begin
     rotateX(240-rotationSpeed);
     rotateY(300-rotationSpeed);
     rotateZ(120-rotationSpeed);   
     stroke (44,43,86);
     box(height/2);
     
   } //if end
   
   if (delay>=720+45){ //if begin
     strokeWeight(4);
     } //if end
     
   if (delay>=960+60){ //if begin
     background(44,43,86);
     stroke (255,255,255);
     noFill();
     box(height);
      } //if end
   
   if (delay>=1200+75){ //if begin
     background(44,43,86);
     stroke (255,255,255);
     noFill();
     box(height/2);
     } //if end
   
   if (delay>=1440+90){ //if begin
     rotateX(240-rotationSpeed);
     rotateY(300-rotationSpeed);
     rotateZ(120-rotationSpeed);   
     stroke (255,255,255);
     box(height/2);
     } //if end
   
   if (delay>=1680+105){ //if begin
     background(44,43,86);
     rotateX(0);
     rotateY(rotationSpeed);
     rotateZ(0);   
     stroke (44,43,86);
     fill(255,150*SinLFO);
     box(height/2);
     } //if end
 
 
 
  frameCompleted();
  
} // Display end

} //class end
