include <../config/common.scad>

// Soporte individual inspirado en la referencia proporcionada por el usuario.
// Imprimir dos unidades por carrete.
// Material recomendado de prototipo: PETG.
// Orientación recomendada: placa de montaje sobre la cama.

module spool_support() {
    difference() {
        union() {
            // placa de montaje
            rounded_box([SUPPORT_W, MOUNT_T, SUPPORT_H], 2.5);

            // brazo inclinado
            hull() {
                translate([4,MOUNT_T,18])
                    cube([SUPPORT_W-8,10,20]);
                translate([4,SUPPORT_D-24,34])
                    cube([SUPPORT_W-8,18,18]);
            }

            // cuna semicircular para varilla
            translate([SUPPORT_W/2,SUPPORT_D-13,50])
                rotate([90,0,0])
                    cylinder(h=22,r=CRADLE_R+5,$fn=48);
        }

        // cavidad de la varilla
        translate([SUPPORT_W/2,SUPPORT_D-15,50])
            rotate([90,0,0])
                cylinder(h=30,r=CRADLE_R,$fn=48);

        // apertura superior de la cuna
        translate([SUPPORT_W/2-CRADLE_R,SUPPORT_D-25,50])
            cube([2*CRADLE_R,30,25]);

        // orificios M5 de montaje
        for (z=[18,54])
            translate([SUPPORT_W/2,-1,z])
                rotate([-90,0,0])
                    cylinder(h=MOUNT_T+2,d=5.5,$fn=32);
    }
}

spool_support();
