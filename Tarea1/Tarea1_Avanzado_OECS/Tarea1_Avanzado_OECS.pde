//Tarea 1 Curso Arduino Avanzado
//Carranza Salazar Oscar Eduardo
//Controlar un motor: Processing->Arduino

import processing.serial.*;  //Necesaria para comunicación serial

Serial arduino;
boolean motor=false; //false para apagado, true para encendido
int sentido=-1; //variable local en el draw que indica sentido de giro 
                //(no giro: -1), (horario=1), (antihorario=0)

void setup(){
  size(512, 512); //Tamaño de mi área de trabajo
  //La pongo del mismo tamaño que la imagen aque pondré de fondo
  
  //Defino un fonfo con una imágen:
  PImage img;
  img = loadImage("engine.jpg");  //la imagen es de 512x512
  background(img);
  
  //Comunicación con Arduino por medio de com. serial
  arduino=new Serial(this, "COM8", 9600);
  
  //println(Serial.list()); //saber el COM
  //Me voy al buscador (Windows): Administrador de dispositivos->Puertos COM 
  //y veo en donde esta el arduino
  //arduino=new Serial(this, "COM3", 9600);
}

void draw(){
  //Vuelvo a poner el fondo para que no se quede en el draw anterior lo que tenía
  //Sobretodo en las opciones de prendido/apagado (del sentido de giro del encendido)
  PImage img;
  img = loadImage("engine.jpg");
  background(img);
  
 //Titulo: 
  textSize(18);
  fill(255); //letra blanca
  text("Controlar un Motor con Processing y Arduino", 60, 30);
  text("Autor: Carranza Salzar Oscar Eduardo", 70, 60);
  
  fill(255); //blanco
  stroke(0); //negro
  rect(70, 450, 380, 55);
  
  textSize(15);
  fill(0); //letra negra
  text("Sistema de seguridad: Si presiona cualquier", 78, 470);
  text("tecla (del teclado), el motor se apagará", 78, 495);
  
  if(motor==false){
    fill(0, 255, 255); //aguamarina
    stroke(0); //negro
    rect(110, 80, 275, 55);
    
    //Mensaje al usuario
    textSize(15);
    fill(0); //letra negra
    text("Presione el botón de encendido (ON)", 115, 97);
    text("para comenzar", 115, 115);
    
    //botón
    fill(0, 128, 0); //verde oscuro
    stroke(0); //negro
    ellipse(240, 200, 90, 90);
    //mensaje botón
    textSize(15);
    fill(0); //letra negra
    text("ON", 230, 205);
  }
  
  if(motor==true){
    //fondo azul:
    fill(0, 255, 255); //aguamarina
    stroke(0); //negro
    rect(110, 80, 275, 55);
    
    //Mensaje al usuario
    textSize(15);
    fill(0); //letra negra
    text("Presione el botón de apagado (OFF)", 115, 97);
    text("para terminar", 115, 115);
    
    //botón
    fill(0, 128, 0); //verde oscuro
    stroke(0); //negro
    ellipse(240, 200, 90, 90);
    //mensaje botón
    textSize(15);
    fill(0); //letra negra
    text("OFF", 225, 205);
    
    sentidoGiro();

    if(ClickHorario()){
    sentido=1;
    }
  
   if(ClickAntihorario()){
      sentido=0;
    }
  
    //se pone diferente los cuadros cuando ya apreté un botón
    if(sentido==1){
      //sentido horario
      //Mensaje:
      fill(200,162,200); //lila
      rect(20, 265, 470, 33);
      textSize(15);
      fill(0); //letra negra
      text("Motor girando en sentido horario", 150, 290);
    
      //Se pone más oscuro letreto de 'sentido giro horario'
      fill(90); //gris 
      rect(45, 315, 180, 33);
      textSize(15);
      fill(0); //letra negra
      text("Sentido de giro horario", 50, 340);
    
      //Se pone en modo 'normal: gris claro' letrero de 'sentido giro antihorario'
      fill(200); //gris claro
      rect(245, 315, 205, 33);
      textSize(15);
      fill(0); //letra negra
      text("Sentido de giro antihorario", 250, 340); 
    }
    
    if(sentido==0){
      //sentido antihorario
      //Mensaje:
      fill(200,162,200); //lila
      rect(20, 265, 470, 33);
      textSize(15);
      fill(0); //letra negra
      text("Motor girando en sentido antihorario", 135, 290);
    
      //Se pone más oscuro letreto de 'sentido giro antihorario'
      fill(90); //gris claro
      rect(245, 315, 205, 33);
      textSize(15);
      fill(0); //letra negra
      text("Sentido de giro antihorario", 250, 340); 
    
      //Se pone en modo 'normal: gris claro' letrero de 'sentido giro horario'
      fill(200); //gris claro
      rect(45, 315, 180, 33);
      textSize(15);
      fill(0); //letra negra
      text("Sentido de giro horario", 50, 340);
    } 

  }
  
  if(ClickBoton()){
    motor= !motor;  //prendo o apago motor
    delay(100);
    sentido=-1; //sentido de giro se reinicia a valor -1 (no se activa nada en el draw automaticamnete)  
  }
  
  //Mando datos al arduino:
  int salida=1; //lo que le voy a mandar al Arduino
  if(motor==false){
    salida=1; //motor apagado
  }
  else{
    if(motor){
       salida=11; //sentido horario 
       //Sentido por default cuando recien se prende
    }
    if(sentido==1){
      salida=11; //sentido horario 
    }
    if(sentido==0){
      salida=12; //sentido antihorario
    }
  }

  arduino.write(salida); 
}



void keyPressed(){
  //Sistema de seguridad: Si presiono cualquier tecla (del teclado)
  //haré que el motor DC se apague
  motor=false; //Se apaga motor
  sentido=-1;  //sentido de giro se reinicia a valor -1 (no se activa nada en el draw automaticamnete)
}



boolean ClickBoton(){
  //Botón ON/OFF
  if(mouseX>=195 && mouseX<=285 && mouseY>=155 && mouseY<=245 && mouseButton==LEFT && mousePressed==true){
    return true;
  }
  else{
    return false;
  }
}

void sentidoGiro(){
  //imagenes del sentido de giro
  PImage horario;
  horario = loadImage("horario.jpg"); //la imagen es de 77x77
  image(horario, 120, 350); //indico esquina superior izquierda
  PImage antihorario;
  antihorario = loadImage("antihorario.jpg"); //la imagen es de 77x77
  image(antihorario, 305, 350);
  
  fill(0, 0, 255); //azul 
  rect(20, 265, 470, 33);
  textSize(15);
  fill(0); //letra negra
  text("Seleccione sentido de giro (por deafult está en sentido horario)", 23, 290);


  fill(200); //gris claro
  rect(45, 315, 180, 33);
  textSize(15);
  fill(0); //letra negra
  text("Sentido de giro horario", 50, 340);
  
  fill(200); //gris claro
  rect(245, 315, 205, 33);
  textSize(15);
  fill(0); //letra negra
  text("Sentido de giro antihorario", 250, 340);
  
}
  

boolean ClickHorario(){
  //Botón horario
  //Considero tanto el cuadro de texto como el simbolo
  boolean cond1; //Cuadro gris que dice 'Sentido de giro horario'
  boolean cond2; //Imagen con fondo blanco y flecha
  cond1=mouseX>=45 && mouseX<=225 && mouseY>=315 && mouseY<=348;
  cond2=mouseX>=120 && mouseX<=197 && mouseY>=350 && mouseY<=427;
  
  if( (cond1|| cond2) && mouseButton==LEFT && mousePressed==true){
    return true;
  }
  else{
    return false;
  }
}

boolean ClickAntihorario(){
  //Botón antihorario
  //Considero tanto el cuadro de texto como el simbolo
  boolean cond1; //Cuadro gris que dice 'Sentido de giro antihorario'
  boolean cond2; //Imagen con fondo blanco y flecha
  cond1=mouseX>=245 && mouseX<=450 && mouseY>=315 && mouseY<=348;
  cond2=mouseX>=305 && mouseX<=382 && mouseY>=350 && mouseY<=427;
  
  if( (cond1|| cond2) && mouseButton==LEFT && mousePressed==true){
    return true;
  }
  else{
    return false;
  }
}
