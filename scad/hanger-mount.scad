// Inside Meassurement
width = 240;
depth = 100;
height = 50;

thick = 5;
ear = 20;
screw = 5;          // Screwhole diameter
screwoffset = 15;

bventOffset=8;
bventDepth=8;

tol=0.2;

// Bottom
difference(){
   
translate([ear+thick,0,0])
    cube([width,depth,thick]);

btmOffset=ear+thick;
    
for (x=[10:5:width-10]){
     for (y=[10:5:depth-10]){
       translate([x+btmOffset,y,-tol/2]){
           //cube(thick+tol);
          cube([4,4,thick+tol]);
         //cylinder(r=4,h=thick+tol,$fn=30);
           
         
       }
     }
   }
    
}


// Left Side
translate([ear,0,0])
    cube([thick,depth,height]);  
// Right Side
translate([width+ear+thick,0,0])
    cube([thick,depth,height]);

// Left Ear with screwholes
difference()
{
    translate([0,0,height])
        cube([ear+thick,depth,thick]);
    translate([0.5*ear,screwoffset,height])
        cylinder(thick+tol, d=screw, $fn=20);
    translate([0.5*ear,depth-screwoffset,height])
        cylinder(thick+tol, d=screw, $fn=20);    
}

// Right Ear
difference()
{
    translate([width+ear+thick,0,height])
        cube([ear+thick,depth,thick]);
    translate([1.5*ear+width+2*thick,screwoffset,height])
        cylinder(thick+tol, d=screw, $fn=20);
    translate([1.5*ear+width+2*thick,depth-screwoffset,height])
        cylinder(thick+tol, d=screw, $fn=20);  
}


// Ear Support
p0 = [0, 0];
p1 = [0, ear];
p2 = [height, ear];
points = [p0, p1, p2];
// Left Ear Support Front
translate([0,thick,height])
    rotate([0,90,270])
    linear_extrude(height=thick)
        polygon(points);
// Left Ear Support Back 
translate([0,depth,height])
    rotate([0,90,270])
    linear_extrude(height=thick)
        polygon(points);
// Right Ear Support Front
translate([width+2*ear+2*thick,0,height])
    rotate([180,90,270])
    linear_extrude(height=thick)
        polygon(points);
// Right Ear Support Back
translate([width+2*ear+2*thick,depth-thick,height])
    rotate([180,90,270])
    linear_extrude(height=thick)
        polygon(points);



// Bottom
if(0){
    
difference()
{
    translate([ear+thick,0,0])
        cube([width,depth,thick]);
    translate([ear+thick+bventOffset,bventOffset,0])
        cube([width-2*bventOffset,bventDepth,thick]);
    translate([ear+thick+bventOffset,2*bventOffset+bventDepth,0])
        cube([width-2*bventOffset,bventDepth,thick]); 
    translate([ear+thick+bventOffset,3*bventOffset+2*bventDepth,0])
        cube([width-2*bventOffset,bventDepth,thick]);    
}

}








