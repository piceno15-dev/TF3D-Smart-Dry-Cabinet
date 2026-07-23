include <../config/common.scad>

module door_frame() {
    // marco frontal conceptual de aluminio 30 x 20 mm
    color(METAL) {
        cube([DOOR_W, DOOR_FRAME_D, DOOR_FRAME]);
        translate([0,0,DOOR_H-DOOR_FRAME])
            cube([DOOR_W, DOOR_FRAME_D, DOOR_FRAME]);
        cube([DOOR_FRAME, DOOR_FRAME_D, DOOR_H]);
        translate([DOOR_W-DOOR_FRAME,0,0])
            cube([DOOR_FRAME, DOOR_FRAME_D, DOOR_H]);
    }
}

module acrylic_panel() {
    translate([DOOR_FRAME, (DOOR_FRAME_D-ACRYLIC_T)/2, DOOR_FRAME])
        color(ACRYLIC)
            cube([DOOR_W-2*DOOR_FRAME, ACRYLIC_T, DOOR_H-2*DOOR_FRAME]);
}

module epdm_seal() {
    // Representación del sello en la cara posterior del marco
    color(SEAL) {
        translate([8,DOOR_FRAME_D,8])
            cube([DOOR_W-16,EPDM_T,5]);
        translate([8,DOOR_FRAME_D,DOOR_H-13])
            cube([DOOR_W-16,EPDM_T,5]);
        translate([8,DOOR_FRAME_D,8])
            cube([5,EPDM_T,DOOR_H-16]);
        translate([DOOR_W-13,DOOR_FRAME_D,8])
            cube([5,EPDM_T,DOOR_H-16]);
    }
}

door_frame();
acrylic_panel();
epdm_seal();
