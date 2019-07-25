include <../NopSCADlib/vitamins/e3d.scad>

module bed_asm() {
  dx=0;
  dy=0;
  dz=-48;

  // glass
  T(0,bed_yo,bed_z+dz) color([0,0.5,0.5,0.3])
    cube([bed_s,bed_s,3],true);

  // bed
  T(0,bed_yo,bed_z+dz-3) color([0.7,0.7,0.7])
    cube([bed_s,bed_s,3],true);

}

bed_asm();