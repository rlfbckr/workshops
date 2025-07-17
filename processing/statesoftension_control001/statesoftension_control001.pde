import controlP5.*;
import processing.serial.*;
import java.util.ArrayList;
import java.util.Collections;

ControlP5 cp5; // int gui objects

ArrayList<Constallation> constallations = new ArrayList<Constallation>();

volatile boolean doSTOP = false;
volatile boolean doDELETE = false;
int delete_constallation_index = 0;
boolean swap_constallations = false;
int swap_constallations_index_a = 0;
int swap_constallations_index_b = 0;

int CONTROL_VIEW = 0;
int THREE_D_VIEW = 1;
int VIEW = CONTROL_VIEW;

Button add_constallation;
Slider current_pos_1;
Slider current_pos_2;
Slider current_pos_3;
Slider current_pos_4;

/*
   TODO:
   store positions to file with name, position, timestamp
   load positions from file
   save positions to file
   control limits bettween motor positions for machine safety
   3d visualization of the machine
 */


int BOTTON_POS = -1000;
PFont font; // fonr object

// motor positions
volatile int MOTOR_POS_1 = BOTTON_POS;
volatile int MOTOR_POS_1_GOTO = BOTTON_POS;
volatile int MOTORS_CURRENT_POS_1 = 0;

volatile int MOTOR_POS_2 = BOTTON_POS;
volatile int MOTOR_POS_2_GOTO = BOTTON_POS;
volatile int MOTORS_CURRENT_POS_2 = 0;

volatile int MOTOR_POS_3 = BOTTON_POS;
volatile int MOTOR_POS_3_GOTO = BOTTON_POS;
volatile int MOTORS_CURRENT_POS_3 = 0;

volatile int MOTOR_POS_4 = BOTTON_POS;
volatile int MOTOR_POS_4_GOTO = BOTTON_POS;
volatile int MOTORS_CURRENT_POS_4 = 0;

Serial myPort;

void setup() {
	size(1500, 1000);

	println(Serial.list());

	// Replace with your actual port from the list
	String portName = Serial.list()[0]; // e.g., "COM3" or "/dev/ttyUSB0"
	myPort = new Serial(this, "/dev/cu.usbmodem21101", 115200);
	myPort.bufferUntil('\n'); // Read until newline
	font = loadFont("SourceCodePro-Regular-15.vlw");
	textFont(font);
	cp5 = new ControlP5(this);

	cp5.addButton("GO_HOME")
	.setPosition( 200, 950)
	.setSize(25, 25)
	.setColorValue(color(  255))
	.setColorForeground(color(250))
	.setColorBackground(color(60 ))
	.setColorActive(color(255, 0, 255))
	.setFont(font)
	;

	add_constallation = cp5.addButton("ADD_CONSTALLATION")
	                    .setPosition( 800, 50)
	                    .setSize(25, 25)
	                    .setColorValue(color(  255))
	                    .setColorForeground(color(250,0,255))
	                    .setColorBackground(color(60 ))
	                    .setColorActive(color(255, 0, 255))
	                    .setFont(font)
	;

	Button save_constallations_button = cp5.addButton("SAVE_CONSTALLATIONS")
	                                        .setPosition( 800, 100)
	                                        .setSize(25, 25)
	                                        .setColorValue(color(  255))
	                                        .setColorForeground(color(250,0,255))
	                                        .setColorBackground(color(60 ))
	                                        .setColorActive(color(255, 0, 255))
	                                        .setFont(font)
	;

	Button load_constallations_button = cp5.addButton("LOAD_CONSTALLATIONS")
	                                        .setPosition( 800, 150)
	                                        .setSize(25, 25)
	                                        .setColorValue(color(  255))
	                                        .setColorForeground(color(250,0,255))
	                                        .setColorBackground(color(60 ))
	                                        .setColorActive(color(255, 0, 255))
	                                        .setFont(font)
	;


	cp5.addSlider("MOTOR_POS_1_GOTO")
	.setPosition(80, 50)
	.setSize(20, 800)
	.setFont(font)
	.setRange(0, -67000)
	.setValue(BOTTON_POS)
	.setLabel("M1_G")
	;



	cp5.addSlider("MOTOR_POS_2_GOTO")
	.setPosition(280, 50)
	.setSize(20, 800)
	.setFont(font)
	.setRange(0, -67000)
	.setValue(BOTTON_POS) 
	.setLabel("M2_G")
	;

	cp5.addSlider("MOTOR_POS_3_GOTO")
	.setPosition(480, 50)
	.setSize(20, 800)
	.setFont(font)
	.setRange(0, -67000)
	.setValue(BOTTON_POS) 
	.setLabel("M3_G")
	;

	cp5.addSlider("MOTOR_POS_4_GOTO")
	.setPosition(680, 50)
	.setSize(20, 800)
	.setFont(font)
	.setRange(0, -67000)
	.setValue(BOTTON_POS) 
	.setLabel("M4_G")
	;

	current_pos_1 = cp5.addSlider("MOTORS_CURRENT_POS_1")
	                .setPosition(30, 50)
	                .setSize(20, 800)
	                .setColorBackground(color(255,0,0))
	                .setFont(font)
	                .setRange(0, -67000)
                  .setLabel("M1_C")
	                .setValue(0)
	;

	current_pos_2 = cp5.addSlider("MOTORS_CURRENT_POS_2")
	                .setPosition(230, 50)
	                .setSize(20, 800)
	                .setColorBackground(color(255,0,0))
	                .setFont(font)
	                .setRange(0, -67000)
                  .setLabel("M2_C")

	                .setValue(0)
	;

	current_pos_3 = cp5.addSlider("MOTORS_CURRENT_POS_3")
	                .setPosition(430, 50)
	                .setSize(20, 800)
	                .setColorBackground(color(255,0,0))
	                .setFont(font)
	                .setRange(0, -67000)
                  .setLabel("M3_C")
	                .setValue(0)
	;

	current_pos_4 = cp5.addSlider("MOTORS_CURRENT_POS_4")
	                .setPosition(630, 50)
	                .setSize(20, 800)
	                .setColorBackground(color(255,0,0))
	                .setFont(font)
	                .setRange(0, -67000)
                  .setLabel("M4_C")
	                .setValue(0)
	;
	
	// Load saved constellations at startup
	LOAD_CONSTALLATIONS();
}

void draw() { 
  if (doDELETE) {
    constallations.remove(delete_constallation_index);
    doDELETE = false;
    delete_constallation_index = 0;
  }
  if (swap_constallations) {
   Collections.swap(constallations, swap_constallations_index_a , swap_constallations_index_b);
   swap_constallations = false;
   swap_constallations_index_a = 0;
   swap_constallations_index_b = 0;
  }
	background(0);
	while (myPort.available() > 0) {
		//println("serialEvent");
		String inData = myPort.readStringUntil('\n');
		if (inData != null) {
			inData = trim(inData); // Remove whitespace
			if (inData.startsWith("pos")) {
				String[] parts = split(inData, ' ');
				if (parts.length == 5) {
					//println("incoming data: ", parts[1], parts[2], parts[3], parts[4]);
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
	if (MOTOR_POS_1!=MOTOR_POS_1_GOTO || MOTOR_POS_2!=MOTOR_POS_2_GOTO || MOTOR_POS_3!=MOTOR_POS_3_GOTO || MOTOR_POS_4!=MOTOR_POS_4_GOTO) {
		println("sending stuff");
		setPos(MOTOR_POS_1_GOTO, MOTOR_POS_2_GOTO, MOTOR_POS_3_GOTO, MOTOR_POS_4_GOTO);
    MOTOR_POS_1 = MOTOR_POS_1_GOTO;
    MOTOR_POS_2 = MOTOR_POS_2_GOTO;
    MOTOR_POS_3 = MOTOR_POS_3_GOTO;
    MOTOR_POS_4 = MOTOR_POS_4_GOTO;
	}
  if (doSTOP) {
    stopMachine();
    doSTOP = false;
  } 

	if (VIEW == CONTROL_VIEW) {
 
		list_constallations();
		// Draw button labels
		fill(255);
		text("ADD", 830, 45);
		text("SAVE", 830, 95);
		text("LOAD", 830, 145);
	} else {
		text("3D VIEW", 50, 50);
	}
  drawStopButton(1300, 950);
}

 

void list_constallations() {
	int y = 100;
	for (Constallation c : constallations) {
		
		int[] pos = c.getPos();
		c.draw(900, y);
		y += 30;
	}
}

void ADD_CONSTALLATION() {
	int[] current_pos = new int[4];
	current_pos[0] = MOTOR_POS_1_GOTO;
	current_pos[1] = MOTOR_POS_2_GOTO;
	current_pos[2] = MOTOR_POS_3_GOTO;
	current_pos[3] = MOTOR_POS_4_GOTO;
  
	Constallation c = new Constallation("constallation test", current_pos);
	c.setID(constallations.size());
	constallations.add(c);
	println("added constallation: ", c.name, c.pos);
}

// Save constellations to file
void SAVE_CONSTALLATIONS() {
	println("Saving constellations to JSON file...");
	JSONArray jsonArray = new JSONArray();
	
	for (int i = 0; i < constallations.size(); i++) {
		Constallation c = constallations.get(i);
		int[] pos = c.getPos();
		
		JSONObject constellation = new JSONObject();
		constellation.setString("name", c.name);
		constellation.setInt("id", c.getID());
		
		JSONArray positions = new JSONArray();
		positions.setInt(0, pos[0]);
		positions.setInt(1, pos[1]);
		positions.setInt(2, pos[2]);
		positions.setInt(3, pos[3]);
		constellation.setJSONArray("positions", positions);
		
		jsonArray.setJSONObject(i, constellation);
	}
	
	saveJSONArray(jsonArray, "constellations.json");
	println("Saved " + constallations.size() + " constellations to constellations.json");
}

// Load constellations from file
void LOAD_CONSTALLATIONS() {
	println("Loading constellations from JSON file...");
	JSONArray jsonArray = loadJSONArray("constellations.json");
	
	if (jsonArray != null) {
		constallations.clear(); // Clear existing constellations
		
		for (int i = 0; i < jsonArray.size(); i++) {
			JSONObject constellation = jsonArray.getJSONObject(i);
			String name = constellation.getString("name");
			int id = constellation.getInt("id");
			JSONArray positions = constellation.getJSONArray("positions");
			
			int[] pos = new int[4];
			pos[0] = positions.getInt(0);
			pos[1] = positions.getInt(1);
			pos[2] = positions.getInt(2);
			pos[3] = positions.getInt(3);
			
			Constallation c = new Constallation(name, pos);
			c.setID(id);
			constallations.add(c);
		}
		println("Loaded " + constallations.size() + " constellations from constellations.json");
	} else {
		println("No constellations JSON file found or file is empty");
	}
}

