$ErrorActionPreference = "Stop"
$Root = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
New-Item -ItemType Directory -Force -Path "$Root\cad\stl" | Out-Null
openscad -o "$Root\cad\stl\TF3D-SDC-01_Assembly.stl" "$Root\cad\assembly\TF3D-SDC-01_Assembly.scad"
