include <NopSCADlib/lib.scad>
include <NopSCADlib/vitamins/e3d.scad>

use <lib/materials.scad>
use <lib/shortcuts.scad>

include <config.scad>
include <lib/elements.scad>
include <lib/metal_parts.scad>
use <lib/v_slot.scad>

include <asm/bed.scad>
include <asm/belts.scad>
include <asm/caret.scad>
include <asm/electric.scad>
include <asm/motors.scad>
include <asm/rails.scad>
include <asm/rim.scad>

T(60, profile_l) color("red") S(3) R(90, 0, 180) text("FRONT");
