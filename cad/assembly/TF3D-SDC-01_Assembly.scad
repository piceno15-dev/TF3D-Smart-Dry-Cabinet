include <../config/common.scad>
show_door=true; door_open_angle=18;
module cabinet_structure(){
 translate([0,0,0]) board([BOARD_T,CABINET_D,CABINET_H]);
 translate([CABINET_W-BOARD_T,0,0]) board([BOARD_T,CABINET_D,CABINET_H]);
 translate([BOARD_T,0,0]) board([INNER_W,CABINET_D,BOARD_T]);
 translate([BOARD_T,0,CABINET_H-BOARD_T]) board([INNER_W,CABINET_D,BOARD_T]);
 translate([BOARD_T,CABINET_D-BACK_T,BOARD_T]) board([BACK_W,BACK_T,BACK_H]);
 translate([BOARD_T,25,TECH_H]) board([SHELF_W,SHELF_D,SHELF_T]);
 translate([BOARD_T,25,SHELF_Z_1]) board([SHELF_W,SHELF_D,SHELF_T]);
 translate([BOARD_T,25,SHELF_Z_2]) board([SHELF_W,SHELF_D,SHELF_T]);
 translate([BOARD_T,25,SHELF_Z_3]) board([SHELF_W,SHELF_D,SHELF_T]);
}
module conceptual_door(){
 door_gap=3; door_w=CABINET_W-2*door_gap; door_h=CABINET_H-2*door_gap; frame=30; acrylic_t=6;
 module bar(size){ color(METAL) cube(size); }
 module geo(){
  bar([door_w,frame,frame]); translate([0,door_h-frame,0]) bar([door_w,frame,frame]);
  bar([frame,door_h,frame]); translate([door_w-frame,0,0]) bar([frame,door_h,frame]);
  translate([frame,frame,(frame-acrylic_t)/2]) color(ACRYLIC) cube([door_w-2*frame,door_h-2*frame,acrylic_t]);
 }
 translate([door_gap,-frame,door_gap]) rotate([90,0,door_open_angle]) geo();
}
cabinet_structure(); if(show_door) conceptual_door();
