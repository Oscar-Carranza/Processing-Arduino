// Potenciometro

int pot=A0;
int lectura;

void setup() {
  Serial.begin(9600);
}

void loop() {
  lectura=analogRead(pot);
  lectura=map(lectura, 0, 1023, 0, 255);
  Serial.write(lectura);
}
