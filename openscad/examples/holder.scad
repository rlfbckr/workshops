
breite = 20;
durchmesser = 100;

translate([2,durchmesser+9,0]) lasche();
translate([2,-durchmesser+-9,0]) lasche();

module lasche() {
    difference(){
        cube([4,20,breite],center=true);
        rotate([0,90,0]) cylinder(r=3.1/2,h=10,$fn=30,center=true);
    }
}

difference() {
    cylinder(h=breite,r=durchmesser,$fn=80,center=true);
    cylinder(h=breite+1,r=durchmesser-4,$fn=80,center=true);
    translate([-300,-200,-20])
        cube([300,400,100]);
}