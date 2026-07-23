include <../config/common.scad>
use <../parts/TF3D-011_Soporte_Carrete_RevA.scad>

show_door = true;
show_supports = true;
show_rods = true;
door_angle = 12;

module cabinet_shell() {
    // Laterales
    board([BOARD_T,CABINET_D,CABINET_H]);
    translate([CABINET_W-BOARD_T,0,0])
        board([BOARD_T,CABINET_D,CABINET_H]);

    // Base y tapa
    translate([BOARD_T,0,0])
        board([INNER_W,CABINET_D,BOARD_T]);
    translate([BOARD_T,0,CABINET_H-BOARD_T])
        board([INNER_W,CABINET_D,BOARD_T]);

    // Fondo interior
    translate([BOARD_T,CABINET_D-BACK_T,BOARD_T])
        board([BACK_W,BACK_T,BACK_H]);

    // Tapa desmontable del compartimento técnico
    translate([BOARD_T,25,TECH_LID_Z])
        board([INNER_W,450,BOARD_T]);
}

module support_pair(center_x,z) {
    left_x = center_x - SUPPORT_PAIR_GAP/2 - SUPPORT_W/2;
    right_x = center_x + SUPPORT_PAIR_GAP/2 - SUPPORT_W/2;
    y = CABINET_D-BACK_T-SUPPORT_D;

    if(show_supports) {
        translate([left_x,y,z-50]) color(PRINTED) spool_support();
        translate([right_x,y,z-50]) color(PRINTED) spool_support();
    }

    if(show_rods) {
        translate([center_x-ROD_L/2,CABINET_D-BACK_T-17,z])
            rod();
    }
}

module spool_layout() {
    for(z=SPOOL_ROWS_Z)
        for(x=SPOOL_CENTERS_X)
            support_pair(x,z);
}

module door_assembly() {
    translate([DOOR_GAP,-DOOR_FRAME_D,DOOR_GAP])
        rotate([0,0,door_angle]) {
            color(METAL) {
                cube([DOOR_W,DOOR_FRAME_D,DOOR_FRAME]);
                translate([0,0,DOOR_H-DOOR_FRAME])
                    cube([DOOR_W,DOOR_FRAME_D,DOOR_FRAME]);
                cube([DOOR_FRAME,DOOR_FRAME_D,DOOR_H]);
                translate([DOOR_W-DOOR_FRAME,0,0])
                    cube([DOOR_FRAME,DOOR_FRAME_D,DOOR_H]);
            }
            translate([DOOR_FRAME,(DOOR_FRAME_D-ACRYLIC_T)/2,DOOR_FRAME])
                color(ACRYLIC)
                    cube([DOOR_W-2*DOOR_FRAME,ACRYLIC_T,DOOR_H-2*DOOR_FRAME]);
        }
}

cabinet_shell();
spool_layout();
if(show_door) door_assembly();
