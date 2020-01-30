//Comunicacion processing-> arduino

char opcion;
int led=2;

void setup() {
  pinMode(led, OUTPUT);
  Serial.begin(9600);
}

void loop() {
  if(Serial.available()>0){
    opcion=Serial.read();
    if(opcion=='h'){
      digitalWrite(led, HIGH);
    }
    else{
      digitalWrite(led, LOW);
    }
  }
}
