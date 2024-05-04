// Inside Meassurement
$width = 240;
$depth = 100;
$height = 50;

$thick = 5;
$ear = 20;
$screw = 2;
$screwoffset = 15;



// Bottom
translate([$ear+$thick,0,0])
  cube([$width,$depth,$thick]);

// Left Side
translate([$ear,0,0])
    cube([$thick,$depth,$height]);  
// Right Side
translate([$width+$ear+$thick,0,0])
    cube([$thick,$depth,$height]);

// Left Ear with screwholes
difference()
{
    translate([0,0,$height])
        cube([$ear+$thick,$depth,$thick]);
    translate([0.5*$ear,$screwoffset,$height])
        cylinder($thick, $screw, $screw);
    translate([0.5*$ear,$depth-$screwoffset,$height])
        cylinder($thick, $screw, $screw);    
}

// Right Ear
difference()
{
    translate([$width+$ear+$thick,0,$height])
        cube([$ear+$thick,$depth,$thick]);
    translate([1.5*$ear+$width+2*$thick,$screwoffset,$height])
        cylinder($thick, $screw, $screw);
    translate([1.5*$ear+$width+2*$thick,$depth-$screwoffset,$height])
        cylinder($thick, $screw, $screw);  
}


// Ear Support
p0 = [0, 0];
p1 = [0, $ear];
p2 = [$height, $ear];
points = [p0, p1, p2];
// Left Ear Support Front
translate([0,$thick,$height])
    rotate([0,90,270])
    linear_extrude(height=$thick)
        polygon(points);
// Left Ear Support Back 
translate([0,$depth,$height])
    rotate([0,90,270])
    linear_extrude(height=$thick)
        polygon(points);
// Right Ear Support Front
translate([$width+2*$ear+2*$thick,0,$height])
    rotate([180,90,270])
    linear_extrude(height=$thick)
        polygon(points);
// Right Ear Support Back
translate([$width+2*$ear+2*$thick,$depth-$thick,$height])
    rotate([180,90,270])
    linear_extrude(height=$thick)
        polygon(points);














