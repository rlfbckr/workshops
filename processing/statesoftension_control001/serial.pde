void setPos(int a, int b, int c, int d) {
	if (a <=BOTTON_POS && b <=BOTTON_POS && c <=BOTTON_POS && d <=BOTTON_POS) {

		String command = "setPos " + a + "," + b + "," + c + "," + d + "\n";
		println(millis()+" -----> Sending: " + command);
		myPort.write(command);
	} else {
		println("not save to go");
	}
}
void stopMachine() {
	String command = "stop\n";
	println("Sending: " + command);
	myPort.write(command);
}
void goHome() {
	String command = "goHome\n";
	println("Sending: " + command);
	myPort.write(command);
}



/*

   void serialEvent(Serial myPort) {
   println("serialEvent");
        String inData = myPort.readStringUntil('\n');
        if (inData != null) {
                inData = trim(inData); // Remove whitespace
                if (inData.startsWith("pos")) {
                        String[] parts = split(inData, ' ');
                        if (parts.length == 5) {
        println("incoming data: ", parts[1], parts[2], parts[3], parts[4]);
                                MOTORS_CURRENT_POS_1 = int(parts[1]);
        current_pos_1.setValue(MOTORS_CURRENT_POS_1);
                                MOTORS_CURRENT_POS_2 = int(parts[2]);
        current_pos_2.setValue(MOTORS_CURRENT_POS_2);
                                MOTORS_CURRENT_POS_3 = int(parts[3]);
        current_pos_3.setValue(MOTORS_CURRENT_POS_3);
                                MOTORS_CURRENT_POS_4 = int(parts[4]);
        current_pos_4.setValue(MOTORS_CURRENT_POS_4);
                        }
                }
        }
   }
 */