class Scene06 extends Scene { //class begins

//SHAPE VARIABLES
int delay;
float rot;

//COLOR VARIABLES
float BNshift = 0;
float BNshift2 = 0;

//OFFSET VARIABLES
float t;
float theta;
int maxFrameCount = 75;
int a = 101; // offset number
int space = 200; // size of cube for for loops
float rotationSpeed;

//----- SOUND

float SinLFOin;
float SawLFOin;
int Alternator;
float Volume1;
float Volume2;

int[] midiSequence1 = {47,0,0,0,0,0,0,0,/**/0,0,0,0,0,0,0,0,/**/47,0,52,0,0,0,0,0,/**/0,0,0,0,0,0,0,0};//
int[] midiSequence2 = {47,47,47,47,0,0,0,0,/**/42,42,42,42,0,0,0,0,/**/47,47,47,47,0,0,0,0,/**/42,42,42,42,40,40,40,40};// 
int[] midiSequence3 = {0,0,0,0,0,0,0,0,/**/0,0,0,0,0,0,0,0,/**/0,0,0,0,0,0,0,0,/**/0,0,0,0,0,0,0,0};//
int[] midiSequence4 = {40,0,40,0,40,0,40,0,/**/40,0,40,0,40,0,40,0,/**/40,0,40,0,40,0,40,0,/**/40,0,40,0,40,0,40,0};// 

float midiToHz(int note) {
  return (pow(2, ((note-69)/12.0))) * 440;
  }

int trigger = delay; 
int note = 0; 

void shp (float x, float y,  float z, float d) {
    pushMatrix();
         translate(x,y,z);
         rotateZ(radians(rotationSpeed));
         box(d);
         popMatrix();
       
  }
  
Scene06 (int _sceneDuration) { // constructor begins
  sceneDuration=_sceneDuration;
  perspective();
  rectMode(CENTER);
} //cosntructor end


void display() { // Display begins

  delay = delay +1;
    
  if (delay%240==0) {
    BNshift = BNshift +1;
    BNshift2 = BNshift2 +1;
    }  

      if (BNshift%2==0) { //if else begin
        background(colorArray[colorShift5]);
      } else {
        background(44,43,86);
      } // if else end
      
      if (BNshift2%2==0) { //if else begin
        stroke(44,43,86);
        fill(44,43,86);
      } else {
        stroke(colorArray[colorShift5]);
        fill(colorArray[colorShift5]);
      } // if else end
      
   //----- SOUND
   
   int duration = 15; // 15840,7920,3960,1980,990,495,240,120
  
   SawLFOin=SawLFOin+1;    
   if (delay%240==0) { // sawLFO function Begin (saw LFO)
    SawLFOin=-0.1*SawLFOin;
     }
     float SawLFO = map(SawLFOin, 0, 240, 0, 1);
     
   SinLFOin=(sin(delay*0.075));
     float SinLFO = map(SinLFOin,-1,1, 1,0);
 
          
       noise1.play();
       noise1.amp(0.3);//0.2
       
       //osc1.play(midiToHz(midiSequence1[note]), 0.4);
      
            
  
    if ((delay > trigger) && (note<midiSequence1.length)) { // trigger begins

       
        osc1.play(midiToHz(midiSequence1[note]+12), 0.4);//0.3
        env.play(osc1, 0.5, 0.1, 0.1,2);
        osc2.play(midiToHz(midiSequence2[note]), 0.4);//0.4
        env.play(osc2, 0.05, 0.01, 0.5, 0.5);
        //osc3.play(midiToHz(midiSequence3[note]+12), 0.0);//0.1
        //env.play(osc3, 0.05, 0.01, 0.5, 0.5);
        osc4.play(midiToHz(midiSequence4[note]), 0.8);//0.4  
        env.play(osc4, 0.01, 0.1, 0.5, 0.01);
           
        trigger = delay + duration;

       // Sequencer
          note = note+1;
          if (note == 32) {
            note = 0;
          }
    } // trigger ends
   
   //----- VISUAL
      

  translate(width/2,height/2);
  t = (float)frameCount/maxFrameCount;
  theta = TWO_PI*t/5;
  rotationSpeed = rotationSpeed+1;

  
  // rotate the whole cube
  rotateY(radians(rotationSpeed));
  rotateX(radians(45));
  rotateX(0);
  rotateZ(0);
  
// 3 nested for loops to create sides  
  for (int x = -space; x <= space; x += 200) {
  for (int y = -space; y <= space; y += 200) {
  for (int z = -space; z <= space; z += 200) {

    // map size of small cubes with offset
    float offSet = ((x*y*z))/a;
    float sz = map(sin(-theta+offSet), -1, 1, 0, 190);


   
  if ((x*y*z)%70 == 0){
    fill(colorArray[colorShift5]);
    stroke(44,43,86);
  } else {
    fill(44,43,86);
    stroke(colorArray[colorShift5]);
    
      }
    
    // small blocks, 3 times to create cube
    shp(x,y,z,sz);
    shp(y,z,x,sz);
    shp(z,x,y,sz);

    }}}
    
   
   if (delay%255==0) {  // Alternator Function Begin (Sqr LFO)
    Alternator = Alternator +1;
      }  
      
        if (Alternator%2==0) { //Alternator Positive
            rotationSpeed = 90;
            
            } else { // Alternator Negative      
              Volume1 = 0;
              Volume2 = 1;//1.5       
            } // Alternator End
    
  
       
  frameCompleted();
  
} // Display ends
} //class ends
