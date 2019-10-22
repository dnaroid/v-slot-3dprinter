module
caret_asm()
{
    dx = 0;
    dy = -18;
    dz = 35;
    rz = 180;

    railY_xo = long;
    railY_z = 0;
    railX_z = railY_z + railY_car_h;

    T(car_x, car_y + railY_yo + railX_yo + 3, railX_z + railX_car_h + 1+10) corn(30, 2, 30, 45);

    T(car_x - 18-6, car_y + railY_yo - 10, 35)  R(90, 0, -90) optical_endstop();

    explode = 0*150;

    fan_r = 20;

    if (!hide_hotend) {
        
        T(car_x + dx, car_y + dy + railY_yo, dz)
        {
            Rz(rz) mirror([1, 0, 0]) hotend_cr10();
            // T(20,-10,40)bl_touch();

            C(0.7,0.1,0.1){
                T(12,7,-34) R(30,50) Cy(6/3,10);  // wires
                T(15,4,-7) Cy(6/3,50);  // wires
            }
            
            T(10, -25, 38+explode) Rx(90+fan_r*0) Ry(-90) blower_4020();
            T(0, -26-explode, -10) Rx(-90+fan_r) Rz(0) fan_4010();
            Rx(-170)import_stl("models/4010duct.stl", convexity = 5);
        }
    }
}

caret_asm();














