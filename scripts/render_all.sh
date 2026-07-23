#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
mkdir -p "$ROOT/cad/stl"
openscad -o "$ROOT/cad/stl/TF3D-SDC-01_Assembly.stl" "$ROOT/cad/assembly/TF3D-SDC-01_Assembly.scad"
