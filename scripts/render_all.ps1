$ErrorActionPreference = "Stop"
$Root = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
$OpenScad = if ($env:OPENSCAD) { $env:OPENSCAD } else { "openscad" }
New-Item -ItemType Directory -Force -Path "$Root\cad\stl" | Out-Null

& $OpenScad -o "$Root\cad\stl\TF3D-SDC-01_Assembly_v0.3.2.stl" `
 "$Root\cad\assembly\TF3D-SDC-01_Assembly_v0.3.2.scad"
& $OpenScad -o "$Root\cad\stl\TF3D-011_Soporte_Carrete_RevA.stl" `
 "$Root\cad\parts\TF3D-011_Soporte_Carrete_RevA.scad"
& $OpenScad -o "$Root\cad\stl\TF3D-014_Soporte_Sensor_SHT31.stl" `
 "$Root\cad\parts\TF3D-014_Soporte_Sensor_SHT31.scad"
& $OpenScad -o "$Root\cad\stl\TF3D-015_Soporte_Ventilador_120.stl" `
 "$Root\cad\parts\TF3D-015_Soporte_Ventilador_120.scad"

Write-Host "Render completado."
