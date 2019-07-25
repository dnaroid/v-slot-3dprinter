include <NopSCADlib/lib.scad>
include <NopSCADlib/vitamins/ball_bearing.scad>
include <NopSCADlib/vitamins/rails.scad>
include <NopSCADlib/vitamins/rail.scad>

use <NopSCADlib/vitamins/nut.scad>
use <lib/shortcuts.scad>
use <lib/v_slot.scad>
include <config.scad>

Rz(90)
Ty(railLength/2)
rail_assembly(MGN9, railLength, carY);

Rz(90)
Ty(-railLength/2)
rail_assembly(MGN9, railLength, carY);

T(0,carY,10)
rail_assembly(MGN9, railLength, carX);

color([0.7,0.7,0.7])
Rx(90)
T(railLength/2,-15,-railLength/2)
extrusion_profile_20x20_v_slot(20,250);