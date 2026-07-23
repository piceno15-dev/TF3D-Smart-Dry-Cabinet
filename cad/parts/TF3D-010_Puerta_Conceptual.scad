include <../config/common.scad>
door_gap=3; door_w=CABINET_W-2*door_gap; door_h=CABINET_H-2*door_gap; frame=30; acrylic_t=6;
module frame_bar(size){ color(METAL) cube(size); }
module door(){
 frame_bar([door_w,frame,frame]);
 translate([0,door_h-frame,0]) frame_bar([door_w,frame,frame]);
 frame_bar([frame,door_h,frame]);
 translate([door_w-frame,0,0]) frame_bar([frame,door_h,frame]);
 translate([frame,frame,(frame-acrylic_t)/2]) color(ACRYLIC) cube([door_w-2*frame,door_h-2*frame,acrylic_t]);
}
door();
