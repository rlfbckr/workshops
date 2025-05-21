// code
schrauben_durchmesser = 8.124;
/*
color("Red")
    difference() {
        cube([100,200,10]);
        translate([50,100,-4])
            cylinder(h=30,r=schrauben_durchmesser/2,$fn=30);
    }
*/
    
translate([150,0,0])
    color("Green") union() {
        cylinder(h=40,r1 = 20, r2=6);
        translate([0,0,50]) sphere(r=14);
    }

/*
translate([300,0,0]) {
    intersection() {
        #sphere(r=40);
        cylinder(h=100,r=20,center=true);
    }
}
*/
    

