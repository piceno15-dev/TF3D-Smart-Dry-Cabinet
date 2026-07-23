include <../config/common.scad>

plate=4;
border=12;

difference() {
    cube([FAN_SIZE+2*border, plate, FAN_SIZE+2*border]);

    // apertura
    translate([FAN_SIZE/2+border,-1,FAN_SIZE/2+border])
        rotate([-90,0,0])
            cylinder(h=plate+2,d=114,$fn=96);

    // patrón 105 mm
    for (x=[border+(FAN_SIZE-FAN_HOLE_SPACING)/2,
            border+(FAN_SIZE+FAN_HOLE_SPACING)/2])
      for (z=[border+(FAN_SIZE-FAN_HOLE_SPACING)/2,
              border+(FAN_SIZE+FAN_HOLE_SPACING)/2])
        translate([x,-1,z])
            rotate([-90,0,0])
                cylinder(h=plate+2,d=FAN_HOLE_D,$fn=24);
}
