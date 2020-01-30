//Servomotor
import processing.serial.*;

Serial arduino;
 int angulo=0;

void setup(){
  size(300, 150);
  println(Serial.list()); //saber el COM
  //Me voy al buscador (Windows): Administrador de dispositivos->Puertos COM 
  //y veo en donde esta el arduino
  arduino=new Serial(this, "COM3", 9600);
}

void draw(){
  background(255); //White
  
  textSize(15);
  fill(50); //letra gris
  text("Posición del Servo", 80, 33);
  
 fill(125, 125, 0); 
 ellipse(50, 105, 50, 50);
 ellipse(250, 105, 50, 50);
 
 textSize(25);
 fill(50); //letra gris
 text("-", 45, 110);
 text("+", 240, 110);
 
 fill(168);
 stroke(0, 0, 255); //RGB para contorno
 rect(110, 70, 80, 50);
 

 textSize(15);
 fill(50); //letra gris
 text(angulo, 135, 100);
 
 if(encimaBotonMenos() && mousePressed && angulo>0){
   fill(40, 255, 40); 
   ellipse(50, 105, 50, 50);
   textSize(25);
   fill(50); //letra gris
   text("-", 45, 110);
   angulo--;
   delay(200);
 }
 
 if(encimaBotonMas() && mousePressed && angulo<180){
   fill(40, 255, 40); 
   ellipse(250, 105, 50, 50);
   textSize(25);
   fill(50); //letra gris
   text("+", 240, 110);
   angulo++;
   delay(200);
 }
 
 arduino.write(angulo);
}

void mouseWheel(MouseEvent evento){
  //Se movio la bolita del raton y para que lado
  //println(evento.getCount());
  if(angulo>0  && angulo<180){
    angulo=angulo-evento.getCount();  
    //El menos es porque si le doy para arriba me da un -1 y para abajo un +1
  }
}

/*
void mouseClicked(){
  if(encimaBotonMenos() && angulo>0){
    posicion--;
  }
}

*/



boolean encimaBotonMenos(){
  if(mouseX>=25 && mouseX<=75 && mouseY>=80 && mouseY<=130){
    return true;
  }
  else{
    return false;
  }
}

boolean encimaBotonMas(){
  if(mouseX>=225 && mouseX<=275 && mouseY>=80 && mouseY<=130){
    return true;
  }
  else{
    return false;
  }
}
