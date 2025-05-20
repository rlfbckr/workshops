hammer_length= 300;
hammer_head_length = 100;

translate([200,0,0]) difference() {
    cube([30,50,30]);
    translate([15,25,15]) cylinder(r=10,h=60,center=true,$fn=100);
}


translate([100,0,0]) union() {
    cube([30,50,30]);
    translate([15,25,15]) cylinder(r=10,h=60,center=true,$fn=30);
}


intersection() {
    cube([30,50,30]);
    translate([15,25,15]) sphere(r=20,h=60,center=true);
}



















module hammer() {
// hammer handle
color("Brown")
    cylinder(r=10,h=hammer_length);

// hammer head

translate([0,0,hammer_length-16])
    color("Blue")
        difference() {
            
            cube([30,hammer_head_length,30],center=true);
            cylinder(r=10,h=31,center=true);
        }

}