//initial credits scene
class Scene00 extends Scene {  // class begins
// visual attributes
PFont font1;
int delay;
String[] titles = {"ritmo 2021();","{ritmo 2021}","ritmo 2021[]", "</ritmo 2021>","ritmo@2021>"};
// sound attributes
float SinLFOin;
float SawLFOin;
int Alternator;
float Volume1;
float Volume2;

int[] midiSequence1 = {52,55,47,55,0,0,0,0,/**/52,57,55,59,54,59,55,52,/**/48,52,55,59,48,52,55,59,/**/55,57,55,59,54,59,55,52};// Lead Line
int[] midiSequence2 = {40,42,35,43,0,0,0,0,/**/52,52,52,52,52,52,52,52,/**/48,48,48,48,48,48,48,48,/**/48,48,48,48,48,48,48,48};// Bass line
int[] midiSequence3 = {40,42,35,43,0,0,0,0,/**/53,53,53,53,53,53,53,53,/**/47,47,47,47,47,47,47,47,/**/47,47,47,47,47,47,47,47};// Drone
int[] midiSequence4 = {0,0,0,0,74,81,0,0,/**/0,0,0,0,0,0,0,100,/**/0,0,0,0,0,79,0,79,/**/0,0,88,0,0,0,0,100};// Clic
int trigger = delay; 
int note = 0; 

//constructor
Scene00(int _sceneDuration){
  sceneDuration=_sceneDuration;
  font1 = createFont("UbuntuMono-R.ttf",height*0.04);
  } //cosntructor ends


float midiToHz(int note) {
  return (pow(2, ((note-69)/12.0))) * 440;
  }

void display () { // Display begins  
  delay = delay +1;
  int duration = 120; 
  fill(colorArray[colorShift4]);
   if (delay>=340){       
 //      duration = 5940;
 //     fill(colorArray[4]);
     }
  
  //----- SOUND
  

      
     noise1.play();
     noise1.amp(0.2);//0.2
       
       //osc1.play(midiToHz(midiSequence1[note]), 0.4);
   
   if ((delay > trigger) && (note<midiSequence1.length)) { // trigger begins    
      osc1.play(midiToHz(midiSequence1[note]), 0.8);//SawLFO*0.4
      env.play(osc1, 0.5, 0.1, 0.5, 2.5); //osc1, attackTime, sustainTime, sustainLevel, releaseTime // 0.01, 0.007, 0.7, 1.5
      osc2.play(midiToHz(midiSequence2[note]), 0.2);//SawLFO*0.4
      env.play(osc2, 0.5, 0.1, 0.5, 2.5);
      osc3.play(midiToHz(midiSequence2[note]), 0.2);//0.4
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
  
  background(44,43,86);
  pushMatrix();
  translate(width/2,height/2);
  textAlign(CENTER);
  textFont(font1);
  //fill(colorArray[colorShift2]);
  //text("RITMO 2021",0,10);
  text(titles[4-int(sceneDuration/120)],0,10);
  popMatrix();
  
  frameCompleted();
  
  }// Display ends    


}//class ends
