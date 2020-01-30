// Ejecicio 20/enero

int boton=2;

void setup() {
  // put your setup code here, to run once:
  pinMode(boton, INPUT);  //lo puse en configuracion pull down
  Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:
  if(digitalRead(boton)==HIGH){
    Serial.write(1);  //apretado
    delay(500);
  }
  else{
    Serial.write(0);  //no apretado
    delay(500);
  }
}
