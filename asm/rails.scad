module
rails_asm()
{

    caretZ_o = -40;

    railY_xo = long;
    railY_z = 0;
    railY_placement_yo = 0;

    railX_z = railY_z + railY_car_h;

    // left Y
    Rz(90) T(railY_yo + railY_placement_yo, railY_xo, railY_z)
        rail(railY_type, railY_l, car_y - railY_placement_yo);

    // right Y
    Rz(90) T(railY_yo + railY_placement_yo, -railY_xo, railY_z)
        rail(railY_type, railY_l, car_y - railY_placement_yo);

    // X
    T(0, car_y + railY_yo + railX_yo-0, railX_z)
    Rx(180) rail(railX_type, railX_l, car_x);

    T(0, car_y + railY_yo + railX_yo+0, railX_z+railX_car_h-8)
    ALUMINUM() D(){
            Cu(profile_l+ profile_t*2,50,4);
            Ty(-15)Cu(profile_l-60,20.5,10);
        }

    // belts clip
    T(car_x, car_y + railY_yo + railX_yo+3, railX_z+railX_car_h-2)
    ALUMINUM()corn(40,2,30,40);

    bed_corn_h = 30;

    //  Z
     for (x = [ -railZ_xo, railZ_xo ])
        T(x, short-hpt, -railZ_l / 2 - railZ_zo) R(0,90,-90)
         rail(railZ_type, railZ_l, -railZ_l / 2 - caretZ_o - bed_z);

    T(0, bed_yo, bed_z + bed_zo - 26)
    Cu((hpl - railY_car_h) * 2 - 4, bed_s + 10, 2);

    ALUMINUM() T(0,-(-short+hpt+railZ_car_h+2), bed_z-80)Cu(bed_s,4,50);
}

rails_asm();




