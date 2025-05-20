seed = 25;
size_factor = 1;
num_fungi = 140;
pizza_radius = 500;
random_angles = rands(0,360,num_fungi+1,seed);
random_radius = rands(40,pizza_radius,num_fungi+1,seed+1);
random_height= rands(10,200,num_fungi+1,seed+2);
random_size= rands(10,90,num_fungi+1,seed+3);
random_twist= rands(30,900,num_fungi+1,seed+4);
color([0,0.4,0,0.2]) cylinder(r=pizza_radius,h=2);
translate([0,-600,300])
    rotate([90,0,90]) color("Yellow")
        text("Welcome to the Fungi Garden!",size=60,center=true);

for(i = [0:num_fungi]) {
 echo(i);
 
 rotate([0,0,random_angles[i]]) 
    translate([random_radius[i],0,0])
        fungi(random_height[i]*size_factor,random_size[i]*size_factor,random_twist[i]);
}

module fungi(cap_height, cap_size,stem_twists) {
    color("Brown") translate([0,0,cap_height]) difference() {
        sphere(r=cap_size/2); 
        translate([0,0,-cap_size/4])
            cube([100,100,cap_size/2],center=true);
    }

    //color("Pink") cylinder(r=2,h=40,$fn=30);
    linear_extrude(height = cap_height, center = false, twist = stem_twists)
        translate([2, 0, 0])
            circle(r = 2);
}