#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
OPENSCAD="${OPENSCAD:-openscad}"
mkdir -p "$ROOT/cad/stl"

"$OPENSCAD" -o "$ROOT/cad/stl/TF3D-SDC-01_Assembly_v0.3.2.stl" \
  "$ROOT/cad/assembly/TF3D-SDC-01_Assembly_v0.3.2.scad"

"$OPENSCAD" -o "$ROOT/cad/stl/TF3D-011_Soporte_Carrete_RevA.stl" \
  "$ROOT/cad/parts/TF3D-011_Soporte_Carrete_RevA.scad"

"$OPENSCAD" -o "$ROOT/cad/stl/TF3D-014_Soporte_Sensor_SHT31.stl" \
  "$ROOT/cad/parts/TF3D-014_Soporte_Sensor_SHT31.scad"

"$OPENSCAD" -o "$ROOT/cad/stl/TF3D-015_Soporte_Ventilador_120.stl" \
  "$ROOT/cad/parts/TF3D-015_Soporte_Ventilador_120.scad"

echo "Render completado."
