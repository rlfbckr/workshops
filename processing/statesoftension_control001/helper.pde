void drawStopButton(int x, int y) {
    fill(255,0,0);
    stroke(255);
    if (dist(mouseX, mouseY, x, y) < 20) {
        fill(255);
        if (mousePressed) {
            println(millis()+" -----> stop");
            doSTOP = true;
        }
    }
    ellipse(x, y,40, 40);
    fill(255);
    text("STOP", x+30, y+7);
}