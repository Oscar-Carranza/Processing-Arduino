//Controlar servo con Processing
//El data del servolo conecto al pin digital 3

#include <Servo.h>

Servo miServo;
int pinServo=3;
int dato=0;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  miServo.attach(pinServo);
}

void loop() {
  // put your main code here, to run repeatedly:
  if(Serial.available()>0){
    dato=Serial.read();  //leemos datos de processing

    miServo.write(dato);
  }
}
