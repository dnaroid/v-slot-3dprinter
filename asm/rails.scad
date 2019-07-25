module rails_asm() {

  // teft
  Rz(90) Ty(profileL/2-profileT/2)
    rail_assembly(railTypeY, railYL, carY);

  // right
  Rz(90) Ty(-profileL/2+profileT/2)
    rail_assembly(railTypeY, railYL, carY);

  // center
  T(0,carY+2,14) Rx(90)
    rail_assembly(railTypeX, railXL, carX);

}

rails_asm();