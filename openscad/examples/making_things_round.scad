$fn=50;
 

color("Yellow") minkowski() {
  cube([50,50,51]);
  cylinder(r=4,h=1);
}


translate([150,0,0]) {
     color("Magenta") minkowski() {
       cube([10,10,10]);
       sphere(r=1,$fn=300);
     }    
}


translate([-100,0,0]) {
    color("Blue") hull() {
        sphere(r=4);
        translate([20,20,0])
            sphere(r=10);
        translate([20,20,20])
            sphere(r=4);
        translate([20,30,40])
            sphere(r=4);
        translate([-20,30,40])
            sphere(r=4);
   }    
}
