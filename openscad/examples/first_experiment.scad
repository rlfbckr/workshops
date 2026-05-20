translate([0,-20,0])
    text(text="diffrence",size=5);
difference() {
    cube([20,20,20]);
    translate([10,10,-1]) cylinder(h=25,r=5);
}

translate([100,-20,0]) text(text="intersection",size=5);

color("Red") intersection() {    
    translate([100,0,0]) cylinder(r=10,h=40,$fn=100,center=true);
    translate([100,0,0]) rotate([0,90,0]) cylinder(r=10,h=40,$fn=100,center=true);
}

translate([200,-20,0]) text(text="union",size=5);

union() {
    translate([200,0,0]) sphere(r=20,$fn=100);
    color("Blue") translate([220,20,0]) sphere(r=20,$fn=100);
}
translate([300,0,0]) difference() {
    cube([100,30,30]);
    translate([20,7,30]) text("HELLO");
}