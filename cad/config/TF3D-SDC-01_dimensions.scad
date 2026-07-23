// TriFusión 3D – Smart Dry Cabinet
// Modelo TF3D-SDC-01 | Sprint 3.2 | Rev A
// Unidades: mm

CABINET_W = 800;
CABINET_H = 1000;
CABINET_D = 500;
BOARD_T = 18;

INNER_W = CABINET_W - 2*BOARD_T;
INNER_H = CABINET_H - 2*BOARD_T;

BACK_W = INNER_W;
BACK_H = INNER_H;
BACK_T = BOARD_T;

// Compartimento técnico inferior
TECH_H = 160;
TECH_LID_Z = TECH_H;

// Puerta sobrepuesta
DOOR_GAP = 3;
DOOR_W = CABINET_W - 2*DOOR_GAP;
DOOR_H = CABINET_H - 2*DOOR_GAP;
DOOR_FRAME = 30;
DOOR_FRAME_D = 20;
ACRYLIC_T = 6;
EPDM_T = 4;

// Soportes de carrete
SPOOL_ROWS = 4;
SPOOLS_PER_ROW = 4;
SPOOL_CENTERS_X = [110, 300, 490, 680];
SPOOL_ROWS_Z = [270, 475, 680, 885];
SUPPORT_PAIR_GAP = 82; // separación entre soportes de una misma bobina
ROD_D = 10;
ROD_L = 120;

// Soporte impreso
SUPPORT_W = 28;
SUPPORT_H = 72;
SUPPORT_D = 92;
MOUNT_T = 8;
CRADLE_R = 7;

// Ventilador previsto
FAN_SIZE = 120;
FAN_HOLE_SPACING = 105;
FAN_HOLE_D = 4.5;

// Apariencia
MELAMINE = [0.94,0.94,0.94];
PRINTED = [0.08,0.25,0.75];
METAL = [0.12,0.12,0.12];
ACRYLIC = [0.55,0.82,1.0,0.25];
SEAL = [0.05,0.05,0.05];
