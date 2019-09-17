include <NopSCADlib/lib.scad>
include <NopSCADlib/vitamins/e3d.scad>

use <lib/materials.scad>
use <lib/shortcuts.scad>

include <config.scad>
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

!T()
{
    gap = 18;
    // ÍcutZ(s = 20)
    Rx(180)
    D()
    {
        plate(70, 70, 5, 2);
        forX(gap, 4) forY(gap, 4) U()
        {
            Cy(3.5 / 2, 50);
            Tz(-1.5) Cy(4.6 / 2, 5.01);
        }
    }
}