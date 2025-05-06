import oscP5.*;
import netP5.*;
boolean  blink = false;
OscP5 oscP5;

 

void setup() {
  size(400,400);
  frameRate(25);
 
  oscP5 = new OscP5(this,9999);
 
}


void draw() {
  if (blink) {
    background(255); 
    blink = false;
  } else {
    background(0);  
  }
}

 

/* incoming osc message are forwarded to the oscEvent method. */
void oscEvent(OscMessage theOscMessage) {
  /* print the address pattern and the typetag of the received OscMessage */
  print("### received an osc message.");
  print(" addrpattern: "+theOscMessage.addrPattern());
  println(" typetag: "+theOscMessage.typetag());
  blink = true;
}
