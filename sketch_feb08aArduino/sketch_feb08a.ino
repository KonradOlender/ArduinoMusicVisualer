int led[] = {9, 8, 7, 6, 5, 4, 3, 2};
bool done = false;

void setup() {
  for(int i = 0; i<8; i++){
    pinMode(led[i], OUTPUT);
  }
  
  Serial.begin(9600);
}

void loop() {
  if(Serial.available() > 0){
    char state = Serial.read();
    if(state == '1'){
      digitalWrite(led[7], HIGH);
      digitalWrite(led[6], HIGH);
      digitalWrite(led[5], HIGH);
      digitalWrite(led[4], HIGH);
      digitalWrite(led[3], HIGH);
      digitalWrite(led[2], HIGH);
      digitalWrite(led[1], HIGH);
      digitalWrite(led[0], HIGH);
      
      delay(20);
      digitalWrite(led[7], LOW);
      digitalWrite(led[6], LOW);
      digitalWrite(led[5], LOW);
      digitalWrite(led[4], LOW);
      digitalWrite(led[3], LOW);
      digitalWrite(led[2], LOW);
      digitalWrite(led[1], LOW);
      digitalWrite(led[0], LOW);
    }
    if(state == '2'){
      digitalWrite(led[6], HIGH);
      digitalWrite(led[5], HIGH);
      digitalWrite(led[4], HIGH);
      digitalWrite(led[3], HIGH);
      digitalWrite(led[2], HIGH);
      digitalWrite(led[1], HIGH);
      digitalWrite(led[0], HIGH);
      
      delay(10);
      digitalWrite(led[6], LOW);
      digitalWrite(led[5], LOW);
      digitalWrite(led[4], LOW);
      digitalWrite(led[3], LOW);
      digitalWrite(led[2], LOW);
      digitalWrite(led[1], LOW);
      digitalWrite(led[0], LOW);
    }
    if(state == '3'){
      digitalWrite(led[5], HIGH);
      digitalWrite(led[4], HIGH);
      digitalWrite(led[3], HIGH);
      digitalWrite(led[2], HIGH);
      digitalWrite(led[1], HIGH);
      digitalWrite(led[0], HIGH);
      
      delay(10);
      digitalWrite(led[5], LOW);
      digitalWrite(led[4], LOW);
      digitalWrite(led[3], LOW);
      digitalWrite(led[2], LOW);
      digitalWrite(led[1], LOW);
      digitalWrite(led[0], LOW);
    }
    if(state == '4'){
      digitalWrite(led[4], HIGH);
      digitalWrite(led[3], HIGH);
      digitalWrite(led[2], HIGH);
      digitalWrite(led[1], HIGH);
      digitalWrite(led[0], HIGH);
      
      delay(10);
      digitalWrite(led[4], LOW);
      digitalWrite(led[3], LOW);
      digitalWrite(led[2], LOW);
      digitalWrite(led[1], LOW);
      digitalWrite(led[0], LOW);
    }
    if(state == '5'){
      digitalWrite(led[3], HIGH);
      digitalWrite(led[2], HIGH);
      digitalWrite(led[1], HIGH);
      digitalWrite(led[0], HIGH);
      
      delay(10);
      digitalWrite(led[3], LOW);
      digitalWrite(led[2], LOW);
      digitalWrite(led[1], LOW);
      digitalWrite(led[0], LOW);
    }
    if(state == '6'){
      digitalWrite(led[2], HIGH);
      digitalWrite(led[1], HIGH);
      digitalWrite(led[0], HIGH);
      
      delay(10);
      digitalWrite(led[2], LOW);
      digitalWrite(led[1], LOW);
      digitalWrite(led[0], LOW);
    }
    if(state == '7'){
      digitalWrite(led[1], HIGH);
      digitalWrite(led[0], HIGH);
      
      delay(10);
      digitalWrite(led[1], LOW);
      digitalWrite(led[0], LOW);
    }
    if(state == '8'){
      digitalWrite(led[0], HIGH);
      delay(10);
      digitalWrite(led[0], LOW);
    }
    
  }

  //for(int i = 0; i<8; i++){
  //  digitalWrite(led[i], HIGH);
  //}
}
void pulse(){
  if(done){
    done = false;
    for(int i = 255; i>=0; i--){
      //analogWrite(LED1, i);
      //analogWrite(LED2, i);
      //analogWrite(LED3, i);
      //delay(0.5);
    }
  }
  done = true;
}
