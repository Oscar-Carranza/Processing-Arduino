void setup(){
 //Funcion que se ejecuta un sola vez 
 size(500, 250);
 background(255, 255, 255); //fondo blanco
}

void draw(){
 //Funcion que se ejecuta en loop
 
 //background(255, 255, 255); //fondo blanco   puedo mover el circulo que hago al final libremente
 fill(255, 0, 0);  //uso codigo RGB, en este caso uso todo el rojo para color figura
 stroke(0, 0, 255); //RGB para contorno
 rect(250, 100, 50, 50);
 
 fill(255, 255, 0); //Color amarillo
 stroke(255);  //Contorno blanco
 //ellipse(0, 0, 50, 50);
 
 //mouseX posicion; 'x' del mouse
 //mouseY posicion 'y' del mouse
 //ellipse(mouseX, mouseY, 50, 50);
 
 fill(50); //color gris oscuro
 noStroke(); //quito contorno
 textSize(15); 
 text("Hola mundo", 200, 90);
 
 
 if(mousePressed){
   fill(0, 255, 0);
 }
 rect(250, 100, 50, 50);
 
}
