durchmesser=50;
wandstaerke = 1;
lochdurchmesser =10;
$fn=100;
difference() {
    sphere(r=durchmesser/2,center=true);
    sphere(r=(durchmesser/2)-(wandstaerke),center=true);
   // translate([0,0,147])cube([250,250,durchmesser/2],center=true);
 translate([0,0,(durchmesser/2)-10]) cylinder(h=30,r=lochdurchmesser/2);
 }

 translate([0,0,durchmesser/2]) difference() {
 cylinder(r=(lochdurchmesser/2)+1,h=10,center=true);
 cylinder(r=(lochdurchmesser/2),h=30+2,center=true);
 }
    