import processing.serial.*;

Serial arduino;
int valor;

void setup(){
  size(200, 200);
  arduino=new Serial(this, "COM3", 9600);
}

void draw(){
  if(arduino.available()>0){
    valor=arduino.read();
  }
  background(200);
  fill(valor);
  rect(50, 50, 100, 100);
}
