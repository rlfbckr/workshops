/*
  Borad Configuration
  Board: ATtiny Microconstroller -> ATtiny 25/45/85
  Processor: ATtiny85
  Clock: Internal 16 MHz (NEVER select an extermal clock)
  ATTENTION! Programm Bootload first to set fuses

  please don't forget to change the programmes.txt file

  avrispmkii.name=AVRISP mkII
  avrispmkii.communication=usb
  avrispmkii.protocol=stk500v2
  avrispmkii.program.protocol=stk500v2
  avrispmkii.program.tool=avrdude
  avrispmkii.program.extra_params=-Pusb -B10 // <--- HERE change SPI speed! / after fuse is set to 16mhz not nessesarry
*/
// ATtiny85
//                         +-\/-+
//                 RESET  1|*   |8 VCC/5V
// [LIGHT0]         A3/3  2|    |7 2/A1            [LIGHT1]
// [SERIAL_TX/JMP]  A2/4  3|    |6 1/PWM           [BEEP]
//                   GND  4|    |5 0/PWM           [LED]
//                         +----+
// core:  attiny von  von David A. Mellis 1.0.2


#define BEEP_PIN 4
#define LED1_PIN 0


void setup() {
  // randomSeed(analogRead(LIGHT0_PIN) + analogRead(LIGHT1_PIN));  // generate randomSeed based on current analog readings
  // config pins

  pinMode(BEEP_PIN, OUTPUT);  // electromagnet speeker
  pinMode(LED1_PIN, OUTPUT);  // yellow LED
  digitalWrite(BEEP_PIN, HIGH);
  delay(100);
  digitalWrite(BEEP_PIN, LOW);
  delay(100);
}


void loop() {
  digitalWrite(BEEP_PIN, HIGH);
  digitalWrite(LED1_PIN, HIGH);
  delay(30);
  digitalWrite(BEEP_PIN, LOW);
  digitalWrite(LED1_PIN, LOW);
  delay(1000);
}
