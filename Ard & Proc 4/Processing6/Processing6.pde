import processing.serial.*;

Serial arduino;

void setup(){
  size(400, 400);
  Serial.list(); //saber el COM
  arduino=new Serial(this, "COM3", 9600);
}

void draw(){
  background(255); //White
  if(sobreCuadrado()){
    fill(255, 255, 0); //yellow
    arduino.write('h'); //high
  }
  else{
    fill(0); //NEGRO
    arduino.write('l'); //low
  }
  rect(150, 150, 100, 100);
}

boolean  sobreCuadrado(){
  if(mouseX>=150 && mouseX<=250 && mouseY>=150 && mouseY<=250){
    return true;
  }
  else{
    return false;
  }
}
