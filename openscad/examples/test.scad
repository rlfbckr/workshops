height = 200;
difference() {
    cube([100,height,100],center=true);
    for (i=[0:1:100]){ 
    translate([0,i,0])cylinder(h=200,r=20,$fn=40,center=true);
    }
 }