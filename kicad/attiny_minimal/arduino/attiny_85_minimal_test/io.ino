#ifdef DO_IO_TEST_ON_BOOT

void doIOtest() {
  randomSeed(__VERSION__ * 10);
  // short IO test
  // with light and sound
  analogWrite(LED_PIN, MAX_LIGHT);
  testBeep(random(1, 5) * 200, random(2, 9));
  analogWrite(LED_PIN, 0);
  delay(200);
  testBeep(random(1, 5) * 80, random(2, 9));
  for (int r = 0; r < __VERSION__; r++) {
    for (int i = 20; i >= 0; i--) {
      testBeep(30 * i, 6);
    }
    delay(100);
  }
  delay(100);

}
void testBeep(int f, int cycles) {
  for (int i = 0; i < cycles; i++) {
    digitalWrite(BEEP_PIN, HIGH);
    delayMicroseconds(1 + f);
    digitalWrite(BEEP_PIN, LOW);
    delayMicroseconds(1 + f);
  }
  digitalWrite(BEEP_PIN, LOW);
}


void doNoise() {
  delayMicroseconds(random(NOISE_MIN, NOISE_MAX));
  digitalWrite(BEEP_PIN, HIGH);
  digitalWrite(LED_PIN, HIGH);
  delayMicroseconds(random(NOISE_MIN, NOISE_MAX));
  digitalWrite(LED_PIN, LOW);
  digitalWrite(BEEP_PIN, LOW);
}
#endif
