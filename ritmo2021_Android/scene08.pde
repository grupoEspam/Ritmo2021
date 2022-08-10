class Scene08 extends Scene { //class begins 

int grow;
int delay;
float rot;

//----- SOUND

float SinLFOin;
float SawLFOin;
int Alternator;
float Volume1;
float Volume2;

int[] midiSequence1 = {47,0,0,0,0,0,0,0,/**/0,0,0,0,0,0,0,0,/**/0,0,0,0,0,0,0,0,/**/0,0,0,0,0,0,0,0};//beep
int[] midiSequence2 = {47,47,47,47,0,0,0,0,/**/42,42,42,42,0,0,0,0,/**/47,47,47,47,0,0,0,0,/**/42,42,42,42,40,40,40,40};// Bassline
int[] midiSequence3 = {55,52,59,52,60,52,59,52,/**/64,52,60,52,59,52,60,52,/**/55,52,59,52,60,52,59,52,/**/64,52,60,52,59,52,60,52};// Leadline
int[] midiSequence4 = {0,0,0,0,0,0,0,0,/**/0,0,0,0,0,0,0,0,/**/0,0,0,0,0,0,0,0,/**/0,0,0,0,0,0,0,0};// Pulse perc

float midiToHz(int note) {
  return (pow(2, ((note-69)/12.0))) * 440;
  }

int trigger = delay; 
int note = 0; 

  
Scene08(int _sceneDuration) { // constructor begins
  sceneDuration=_sceneDuration;
  ortho();
} //cosntructor ends

void display() {  // function begins
  
  delay = delay +1;

 //----- SOUND
   
   int duration = 30; // 15840,7920,3960,1980,990,495,240,120
  
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
       noise1.amp(0.05);//0.2
       
       //osc1.play(midiToHz(midiSequence1[note]), 0.4);
      
            
  
    if ((delay > trigger) && (note<midiSequence1.length)) { // trigger begins

       
        osc1.play(midiToHz(midiSequence1[note]+12), 0.4);//0.3
        env.play(osc1, 0.5, 0.1, 0.1,2);
        osc2.play(midiToHz(midiSequence2[note]), 0.6);//0.4
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



//----- VISUAL


  background(44,43,86); 
    
    rot = rot + 0.01;
   // grow = grow +1;
    delay = delay +1;
    strokeWeight(2);
    
  
    
    if (delay>=240){
      pushMatrix();
      translate(width/2,height/2);
      rotateY(rot);
      rotateX(rot);
      noFill();
      stroke(255);
      box(900);
      popMatrix();
      } 
      
    if (delay>=480){
      pushMatrix();
      translate(width/2,height/2);
      rotateY(rot*1.02);
      rotateX(rot);
      noFill();
      stroke(255);
      box(750);
      popMatrix();
      }
    if (delay>=720){
      pushMatrix();
      translate(width/2,height/2);
      rotateY(rot*1.04);
      rotateX(rot);
      noFill();
      stroke(255);
      box(600);
      popMatrix();
      } 
      
     if (delay>=990){
      pushMatrix();
      translate(width/2,height/2);
      rotateY(rot*1.06);
      rotateX(rot);
      noFill();
      stroke(255);
      box(450);
      popMatrix();
      }
      
     if (delay>=1230){
      pushMatrix();
      translate(width/2,height/2);
      rotateY(rot*1.08);
      rotateX(rot);
      noFill();
      stroke(255);
      box(300);
      popMatrix();
      }
      
      if (delay>=1470){
      pushMatrix();
      translate(width/2,height/2);
      rotateY(rot*1.1);
      rotateX(rot);
      noFill();
      stroke(255);
      box(150);
      popMatrix();
      }  
      
      
  frameCompleted();
} // Function ends

} //class ends
