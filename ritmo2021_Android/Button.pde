class Button{
 
  PVector Pos = new PVector(0,0);
  float Width = 0; 
  float Height = 0;
  color Colour; 
  String Text; 
  Boolean Pressed = false;
  Boolean Clicked = false; 
  
  //Constructor to create a button 
  Button(int x, int y, int w, int h, String t, int r, int g, int b){
   Pos.x = x;
   Pos.y = y;
   Width = w;
   Height = h;
   Colour = color(r,g,b);
   Text = t; 
  }
  
  void update(){
    if(mousePressed == true && Pressed == false){
      Pressed = true; 
      if (mouseX >= Pos.x - Width/2 && mouseX <= Pos.x + Width/2 && mouseY >= Pos.y - Height/2 && mouseY <= Pos.y + Height/2){
        Clicked = true; 
      }
    } else{
        Clicked = false;
        Pressed = false;
      }
  } // end update
  
  void render(){
    noStroke();
    fill(Colour);
    rectMode(CENTER);
    rect(Pos.x, Pos.y, Width * dpi, Height * dpi);
    
    fill(0);
    textFont(createFont("UbuntuMono-R.ttf",height*0.04));
    textAlign (CENTER, CENTER);
    textSize(56 * dpi);
    text(Text, Pos.x , Pos.y );
  } //end render
  
  boolean isClicked(){  //Use this in a if statement to check of the button has been clicked
    return Clicked;
  }
  
}
