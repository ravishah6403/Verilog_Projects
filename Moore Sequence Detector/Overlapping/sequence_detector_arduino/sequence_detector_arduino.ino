int incomingByte = 0;
enum {state0, state1, state2, state3, state4};
unsigned char state = state0;
int inputs[] = {1,0,1,0,1,1,0,1,1,0,1,1,0,0,1,0,1};

void FSM() {
  switch (state) {
    case state0:
      if (incomingByte == 1) {
        state = state1;
      }
      else if (incomingByte == 0) {
        state = state0;
      }
      break;
    case state1:
      if (incomingByte == 1) {
        state = state1;
      }
      else if (incomingByte == 0) {
        state = state2;
      }
      break;
    case state2:
      if (incomingByte == 1) {
        state = state3;
      }
      else if (incomingByte == 0) {
        state = state0;
      }
      break;
    case state3:
      if (incomingByte == 1) {
        state = state4;
      }
      else if (incomingByte == 0) {
        state = state2;
      }
      break;
    case state4:
      if (incomingByte == 1) {
        state = state1;
      }
      else if (incomingByte == 0) {
        state = state2;
      }
      break;
    }
}

void blink() {
  if (state == state4) {
    digitalWrite(13, HIGH);
  } else {
    digitalWrite(13, LOW);
  }
}

void setup() {
  Serial.begin(9600);
  pinMode(13, OUTPUT);
  digitalWrite(13, LOW);
}

void loop() {
  for (int i = 0; i < 17; i++) {
    incomingByte = inputs[i];
    FSM();
    blink();
    Serial.println(state);
    delay(1000);
  }
}