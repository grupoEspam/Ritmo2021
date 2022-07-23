//FInal credits
class Scene14 extends Scene {  // class begins
PFont[] titleFont=new PFont[5];
int delay;
String title1="</ritmo 2021>";
String title2="/*\n The images and sounds of this audiovisual prototype \n were generated entirely through the use of the \n Processing programming language \n */";
String title3_1="Directing[] = { \n   Luscus == (Luis Fernando Medina Cardona); \n   Bonnie == (Julian David Sandoval Ospina); \n}";
String title3_2="Coding[] = { \n   Bonnie; \n   Luscus; \n}";
String title3_3="MusicComposing[] = { \n   Bonnie; \n}";
String title3_4="/* Ritmo 2021: production of an experimental short film using computer programming  \nProject funded by the research-creation projects 2020 calling \nFaculty of Arts, Universidad Nacional de Colombia (Bogotá campus) */"; 
String title5 = "</espam> : Open Media Production Space \nCreative Research Group \nFaculty of Arts, Universidad Nacional de Colombia \n(Bogotá Campus)";
PImage logo1;
PImage logo2;
//----- SOUND

float SinLFOin;
float SawLFOin;
int Alternator;
float Volume1;
float Volume2;

int[] midiSequence1 = {52,0,0,0,0,0,0,0,/**/0,0,0,0,0,0,0,0,/**/0,0,0,0,0,0,0,0,/**/0,0,0,0,0,0,0,02};// lead line
int[] midiSequence2 = {40,0,0,0,0,0,0,0,/**/0,0,0,0,0,0,0,0,/**/0,0,0,0,0,0,0,0,/**/0,0,0,0,0,0,0,00};// bassline
int[] midiSequence3 = {0,0,0,0,0,0,0,0,/**/0,0,0,0,0,0,0,0,/**/0,0,0,0,0,0,0,0,/**/0,0,0,0,0,0,0,0};// pad 1
int[] midiSequence4 = {64,0,0,0,0,0,0,0,/**/0,0,0,0,0,0,0,0,/**/0,0,0,0,0,0,0,0,/**/0,0,0,0,0,0,0,0};// lead Line 2

float midiToHz(int note) {
  return (pow(2, ((note-69)/12.0))) * 440;
  }

int trigger = delay; 
int note = 0; 


Scene14(int _sceneDuration){
  sceneDuration=_sceneDuration;
  titleFont[0] = createFont("UbuntuMono-R.ttf",height*0.04);
  titleFont[1]= createFont("SourceCodePro-Regular.ttf",height*0.03);
  titleFont[2]= createFont("SourceCodePro-Regular.ttf",height*0.028);
  titleFont[3]= createFont("SourceCodePro-Regular.ttf",height*0.025);
  logo1=loadImage("logoespam.png");
  logo2=loadImage("logounal.png");
  //titleFonm[4]= 
} //cosntructor ends


void display () {
  
  delay = delay +1;

//----- SOUND
   
   int duration = 120; // 15840,7920,3960,1980,990,495,240,120
  
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
      
            
  
    if ((delay > trigger) && (note<midiSequence1.length)) { // trigger begin

       
        osc1.play(midiToHz(midiSequence1[note]+12), 0.6);//0.3
        env.play(osc1, 0.05, 0.01, 0.5, 0.05);
        osc2.play(midiToHz(midiSequence2[note]), 0.2);//0.4
        env.play(osc2, 0.05, 0.01, 0.5, 0.05);
        osc3.play(midiToHz(midiSequence3[note]), 0.0);//0.1
        env.play(osc3, 0.05, 0.01, 0.5, 0.05);
        osc4.play(midiToHz(midiSequence4[note]+12), 0.2);//0.4  
        env.play(osc4, 0.05, 0.01, 0.5, 0.05);
           
        trigger = delay + duration;

       // Sequencer
          note = note+1;
          if (note == 32) {
            note = 0;
          }
    } // trigger end
    
    
  //-----VISUAL
  
  //Credits last 1700 frames: 1. short film abstract 2. credits  3. this is a research project 4. logos.
    
   
  background(44,43,86);    
  if(sceneDuration<1700 && sceneDuration>1500){  
     pushMatrix();
     translate(width/2,height/2);
     textAlign(CENTER);
     textFont(titleFont[0]);
     fill(colorArray[3]);
     text(title1,0,10);
     popMatrix();}
  else if (sceneDuration<1500 && sceneDuration >1200){
    // pushMatrix();
    // translate(width/4,height/4);
     rectMode(CENTER);
     textAlign(LEFT);
     textFont(titleFont[1]);
     fill(#ebeaf3);
     textLeading(height*0.04);
     text(title2,width/2,height/2,width*3/4,height/3);
   //  popMatrix();}
    }
  else if (sceneDuration<1200 && sceneDuration > 800){
     rectMode(CORNER);
     textAlign(LEFT);
     textFont(titleFont[3]);
     fill(200);
     textLeading(height*0.03);
     fill(#ebeaf3);
     text(title3_1,width/6,height/6);
     fill(#5baead);
     text("Directing",width/6,height/6);

     fill(#ebeaf3);
     text(title3_2,width/6,2*height/6);
     fill(#5baead);
     text("Coding",width/6,2*height/6);

     fill(#ebeaf3);
     text(title3_3,width/6,3*height/6);
     fill(#5baead);
     text("MusicComposing",width/6,3*height/6);
  
     textFont(titleFont[3]);
     fill(#ebeaf3);
     text(title3_4,width/6,4*height/6,0.8*width,0.15*height);
     }
  else if (sceneDuration < 800 && sceneDuration > 400){
    textFont(titleFont[3]);
    textAlign(LEFT);
    fill(#5baead);
    text("[Conceived and developed by]::",width/6,2*height/6);
    fill(#ebeaf3);
    text(title5,width/6,3*height/6);
    fill(241,228,126);
    text("</espam>",width/6,3*height/6);
    pushMatrix();
    imageMode(CENTER);
    translate(width*3/4,height/2);
    scale(0.3);
    image(logo1,0,0);
    popMatrix();   
    }
  else if (sceneDuration < 400 && sceneDuration > 200){
    pushMatrix();
    imageMode(CENTER);
    translate(width/2,height/2);
    scale(0.1);
    image(logo2,0,0);
    popMatrix();   
    }
  else if (sceneDuration < 200 && sceneDuration > 0){
     pushMatrix();
     translate(width/2,height/2);
     textAlign(CENTER);
     textFont(titleFont[0]);
     fill(colorArray[2]);
     text("{copyleft 2021}",0,10);
     popMatrix();
     pushMatrix();
     textAlign(LEFT);
     translate(3*width/10,9*height/10);
     textFont(titleFont[3]);
     fill(#ebeaf3);
     text("//Download other artifacts at: linktr.ee/ritmo2021",0,0);
     fill(colorArray[5]);
     text("//Download other artifacts at:",0,0);
     popMatrix();  
    }
  frameCompleted();
  }    
}//class ends
