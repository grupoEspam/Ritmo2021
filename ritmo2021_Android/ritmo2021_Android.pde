//Ritmo 2021 Android v1.0 English credits

/*
Directing:
 Luis Fernando Medina Cardona (luscus) - Associate Professor, Universidad Nacional de Colombia. Head researcher.
 Julian David Sandoval Ospina (Bonnie) - Research Assistant
 
 Coding: Bonnie, Luscus
 
 Music composing: Bonnie
 */

/*
Ritmo 2021: production of an experimental short film using computer programming - Project funded by the research-creation projects 2020 calling - Faculty of Arts, Universidad Nacional de Colombia (Bogotá campus)
 Research group: </espam> - Open Media Production Space. Creative Research Group. Faculty of Arts, Universidad Nacional de Colombia (Bogotá Campus)
 */

//Headphones or good audio system is adviced. Depending on the sound card and the Sound Processing Library. the quality of sound might be affected.
//Download other artifacts at: linktr.ee/ritmo2021
//Copyleft 2021-2022

import processing.sound.*;



color[] colorArray ={
  color(241, 228, 126), // 0 - light yellow
  color(240, 81, 36), // 2 - orange
  color(55, 139, 189), // 4 - blue
  color(185, 44, 58), // 3 - wine
  color(57, 188, 168), // 5 - green
  color(245, 166, 31)// 1 - ocher
};

//----- SOUND

SinOsc osc1;
SinOsc osc2;
SinOsc osc3;
SinOsc osc4;

PinkNoise noise1;
Env env;


//----- IMAGE

int colorShift;
int colorShift2;
int colorShift3;
int colorShift4;
int colorShift5;



int MenuState=0; //Control the windows of the menu 
float rotationSpeed = 0; //rotation speed

float dpi = displayDensity;   // a factor used to scale the graphical elements

Button playbutton;  //Play Button
Movie movie;

void setup() {
  orientation(LANDSCAPE);
  fullScreen(P3D);
  //size(800, 500, P3D);
  frameRate(60);

  playbutton = new Button(width/2, height/2, 400, 150, "Play", 0, 200, 200);

  osc1 = new SinOsc(this);
  osc2 = new SinOsc(this);
  osc3 = new SinOsc(this);
  osc4 = new SinOsc(this);
  noise1 = new PinkNoise(this);
  env = new Env(this);

  movie = new Movie(osc1, osc2, osc3, osc4, noise1, env);
}

//----- VISUAL


void draw() {

  switch (MenuState) {
  case 0:
    menu();
    break;

  case 1:
    movie.display();
    break;

  default:
    println("Error: Unknown state error ");
    MenuState = 0;
    break;
  }
} // Draw end



void menu() {

  background(44, 43, 86);

  playbutton.render();
  playbutton.update();

  translate(width/2, height/2);
  rotationSpeed = rotationSpeed+0.0005 ;
  
  noFill();
  
  
  //----- VISUAL


  rotateX(120+rotationSpeed);
  rotateY(120);
  rotateZ(120);
  stroke (255, 255, 255);
  box(height/2);


  rotateX(240-rotationSpeed);
  rotateY(300-rotationSpeed);
  rotateZ(120-rotationSpeed);
  stroke (255, 255, 255);
  box(height/2);

  if (playbutton.isClicked()) {
    delay(100);
    MenuState = 1;
  }
}
