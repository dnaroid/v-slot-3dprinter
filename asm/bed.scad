include <../NopSCADlib/vitamins/e3d.scad>

module bed_asm() {
  dx=0;
  dy=0;
  dz=-48;

  // glass
  T(0,bedOy,bedZ+dz) color([0,0.5,0.5,0.3])
    cube([bedS,bedS,3],true);

  // bed
  T(0,bedOy,bedZ+dz-3) color([0.7,0.7,0.7])
    cube([bedS,bedS,3],true);

}

bed_asm();