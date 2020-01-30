import processing.serial.*;

Serial arduino;
int lectura;

void setup(){
  size(200, 200);
  println(Serial.list());  //me dice los puertos de la compu utilizados
  frameRate(30);  //para que jale bien todo
  arduino=new Serial(this, "COM3", 9600); 
  //De manera mas general, si solo tengo algo conectado a la compu (solo el arduino):
  //arduino=new Serial(this, Serial.list()[0]); 
}

void draw(){
  if(arduino.available()>0){
    lectura=arduino.read();
  }
  background(255); //fondo blanco
  
  if(lectura==0){
    fill(0); //Si no se presiona botón, el rectangulo es negro
  }
  else{
    fill(0, 255, 0);  //Se presiona boton, cuadrado verde
  }
  rect(50,50,100,100);
}
