include <NopSCADlib/lib.scad>
include <NopSCADlib/vitamins/e3d.scad>

use <lib/shortcuts.scad>

use <lib/v_slot.scad>
include <lib/utils.scad>
include <config.scad>

include <asm/rim.scad>
include <asm/rails.scad>
include <asm/caret.scad>
include <asm/bed.scad>
include <asm/motors.scad>
include <asm/belts.scad>
include <asm/electric.scad>

T(60,profile_l) color("red") S(3) R(90,0,180)
  text("FRONT");

//T(0, 130, -120)
//  #cube([300-40, 80, 200], true);