import oscP5.*;
import netP5.*;
boolean  blink = false;
OscP5 oscP5;
int inputval = 0;


void setup() {
//  size(400, 400);
  fullScreen();
  frameRate(25);

  oscP5 = new OscP5(this, 9999);
}


void draw() {
  /*
  if (blink) {
   background(255);
   blink = false;
   } else {
   background(0);
   }
   */
  background(map(inputval, 0, 4095, 0, 255));
}



/* incoming osc message are forwarded to the oscEvent method. */
void oscEvent(OscMessage theOscMessage) {
  /* print the address pattern and the typetag of the received OscMessage */
  print("### received an osc message.");
  print(" addrpattern: "+theOscMessage.addrPattern());
  println(" typetag: "+theOscMessage.typetag());
  blink = true;
  if (theOscMessage.addrPattern().equals("/knobralf")) {
    inputval = theOscMessage.get(0).intValue();
  }
}
