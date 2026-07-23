// Soporte abierto para placa SHT31 típica de 20 x 20 mm.
// Confirmar placa real antes de fabricación definitiva.

plate_w=20;
plate_h=20;
wall=2.2;
depth=8;

difference() {
    union() {
        cube([plate_w+2*wall, depth, plate_h+2*wall]);
        translate([-8,0,0]) cube([8,depth,plate_h+2*wall]);
    }
    translate([wall,-1,wall])
        cube([plate_w,depth+2,plate_h]);
    translate([-4,-1,(plate_h+2*wall)/2])
        rotate([-90,0,0])
            cylinder(h=depth+2,d=3.5,$fn=24);
}
