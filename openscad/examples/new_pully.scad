pully_height =24;
hole_diameter = 2;
pully_inner_diameter = 30;
pully_wall_width = 2;

$fn=100;

difference() {
    // cylinder(r=pully_inner_diameter/2,h=pully_height);
    // minion shape
    hull() {
        sphere(r=pully_inner_diameter/2);
        translate([0,0,pully_height]) sphere(r=pully_inner_diameter/2);
    } 
    
    // torus
    translate([0,0,pully_height/2] )
        rotate_extrude()
            translate([15, 0, 0])
                circle(r = (pully_height-(pully_wall_width*2))/2, $fn = 40);
        
    // axis hole      
    cylinder(r=hole_diameter/2,h=200,center=true);
}

 
