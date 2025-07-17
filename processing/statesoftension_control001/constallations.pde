class Constallation {
	String name = "";
int id = 0;
	int[] pos = new int[4];

	Constallation(String _name,  int[] _pos) {
		name = _name;
		pos = _pos;
	}

	int getIndex(ArrayList<Constallation> list) {
		return list.indexOf(this);
	}

	void setID(int _id) {
		id = _id;
	}

	int getID() {
		return id;
	}

	void setPos(int[] _pos) {
		pos = _pos;
	}

	void setPos(int _pos1, int _pos2, int _pos3, int _pos4) {

		pos[0] = _pos1;
		pos[1] = _pos2;
		pos[2] = _pos3;
		pos[3] = _pos4;
	}
	int[] getPos() {
		return pos;
	}
	void gotoPos() {
		println(millis()+" -----> goto ", name);
		// current_pos_1.setValue(pos[0]);
		// current_pos_2.setValue(pos[1]);
		// current_pos_3.setValue(pos[2]);
		// current_pos_4.setValue(pos[3]);
		MOTOR_POS_1_GOTO = pos[0];
		MOTOR_POS_2_GOTO = pos[1];
		MOTOR_POS_3_GOTO = pos[2];
		MOTOR_POS_4_GOTO = pos[3];
	}

	void draw(int x,int y) {
		// goto button
		fill(20);
		stroke(255);
		if (dist(mouseX, mouseY, x, y) < 10) {
			fill(255);
			if (mousePressed) {
				println(millis()+" -----> goto ", name);
				gotoPos();
				delay(100);
			}

		}

		ellipse(x, y-5, 20, 20);
		fill(255);
		text(id +" : " + pos[0] + " " + pos[1] + " " + pos[2] + " " + pos[3], x+20, y);
		if (button(x+300, y-13, 15, 50, "up")) {
            println("-->up", getIndex(constallations));
			swap_constallations_index_a = getIndex(constallations);
			if (swap_constallations_index_a > 0) {
				swap_constallations = true;
				 
				swap_constallations_index_b = getIndex(constallations)-1;
                delay(100);
			}
		}

		if (button(x+360, y-13, 15, 50, "down")) {
			println("-->down", getIndex(constallations));
			swap_constallations_index_a = getIndex(constallations);
			if (swap_constallations_index_a < constallations.size()-1) {
				swap_constallations = true;
				swap_constallations_index_b = getIndex(constallations)+1;
				delay(100); 
			}
		}

        if (button(x+430, y-13, 15, 50, "del")) {
            println("-->del", getIndex(constallations));
			delete_constallation_index = getIndex(constallations);
			doDELETE = true;
			delay(100);
		}
	}

}

 
 
boolean button(int x, int y,  int height, int width,String text) {
boolean pressed = false;
	fill(20);
	stroke(255);

	fill(20);
	if (mouseX > x && mouseX < x+width && mouseY > y && mouseY < y+height) {
		fill(255);
		rect(x, y, width, height);
		fill(0);
		text(text, x+10, y+11);
        if (mousePressed) {
            pressed = true;
        }
	} else {
		fill(10);
		rect(x, y, width, height);
		fill(255);
		text(text, x+10, y+11);
	}


	return pressed;
}