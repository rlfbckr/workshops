void sendDataOSC() {
  AsyncUDPMessage udpMsg;
  OSCMessage oscMsg("/knobralf");

  oscMsg.add((int)analogRead(32));  // sends readout fron analog pin (integer)

  oscMsg.send(udpMsg);
  oscMsg.empty();
  udpOut.broadcastTo(udpMsg, networkOutPort);  // sends it too all devices in the network (broadcast)
}