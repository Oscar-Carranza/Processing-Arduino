//centro: un cuadrado
//cuando pase el raton encima del cuadrado, este cambie de color

void setup(){
 //Funcion que se ejecuta un sola vez 
 size(400, 300);
}

void draw(){
 //Funcion que se ejecuta en loop
 
 background(255, 255, 255); //fondo blanco
 fill(255, 0, 0);  //rojo
 rect(250, 100, 50, 50); //rectangulo
 
 if(encimaCuadrado()){
    fill(0, 255, 0); //verde
    rect(250, 100, 50, 50);
 }
    

 
  
}

 boolean encimaCuadrado(){
   if(mouseX>=250 && mouseX<=300 && mouseY>=100 && mouseY<=150){
      return true;
   }
   else{
     return false;
   }
 }
