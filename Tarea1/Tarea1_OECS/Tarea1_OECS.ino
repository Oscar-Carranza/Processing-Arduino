//Tarea 1 Curso Arduino Avanzado
//Carranza Salazar Oscar Eduardo

int entrada; 
//De Processing recibo un 1 si el motor está apagado
//Si está prendido e indico sentido horario=11
//Si está prendido e indico sentido antihorario=12

//Pines Arduino
int entrada1=7;
int entrada2=6;
int enable=9;

void setup() {
  Serial.begin(9600);
  pinMode(entrada1, OUTPUT);
  pinMode(entrada2, OUTPUT);
  pinMode(enable, OUTPUT);
  digitalWrite(enable, HIGH);   
}



void loop() {  
  if(Serial.available()>0){
    entrada=Serial.read();

    if(entrada==1){
      digitalWrite(entrada1, LOW);
      digitalWrite(entrada2, LOW);
    }

    if(entrada==11){  
      digitalWrite(entrada1, LOW);
      digitalWrite(entrada2, HIGH); 
    }

    if(entrada==12){
      digitalWrite(entrada1, HIGH);
      digitalWrite(entrada2, LOW);
    }  
  }
  //NOTA: No poner delays
  //Si pongo delays, estos se van acumulando tras cada lectura recibida
  //y provoca fallos en el programa
}
