include <../NopSCADlib/vitamins/e3d.scad>

module caret_asm() {
  dx=0;
  dy=-16;
  dz=12;

  T(carX+dx,carY+dy,0+dz) Rz(90)
    e3d_hot_end_assembly(hotEndType, 1.75, false);

}

caret_asm();