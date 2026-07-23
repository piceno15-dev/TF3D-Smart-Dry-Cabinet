include <TF3D-SDC-01_dimensions.scad>

module board(size=[100,100,18], c=MELAMINE) {
    color(c) cube(size, center=false);
}

module rod(length=ROD_L, diameter=ROD_D) {
    color([0.65,0.65,0.68])
        rotate([0,90,0])
            cylinder(h=length, d=diameter, $fn=48);
}

module rounded_box(size=[20,20,20], r=3) {
    minkowski() {
        cube([size[0]-2*r,size[1]-2*r,size[2]-2*r]);
        sphere(r=r,$fn=24);
    }
}
