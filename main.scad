include <NopSCADlib/lib.scad>
use <lib/shortcuts.scad>
use <lib/v_slot.scad>
include <config.scad>

include <asm/rim.scad>
include <asm/rails.scad>
include <asm/caret.scad>
include <asm/bed.scad>

T(60,profileL) color("red") S(3) R(90,0,180)
  text("FRONT");
