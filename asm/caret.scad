
module leg() {
  hulls() {
    T(nozzle_xo,nozzle_yo,nozzle_z+nozzle_zo) CuR(outlet_r*2,outlet_w,outlet_h,r=outlet_r);
    T(nozzle_xo+3,nozzle_yo,nozzle_z+nozzle_zo+1) CuR(outlet_r*2,outlet_w,outlet_h,r=outlet_r);
    T(nozzle_xo+5,nozzle_yo-3,nozzle_z+nozzle_zo+10) CuR(channel_t,channel_w,channel_r*2,r=channel_r);
    T(nozzle_xo+3,nozzle_yo-10,nozzle_z+nozzle_zo+50) CuR(channel_t,channel_w,channel_r*2,r=channel_r);
    T(nozzle_xo+1,nozzle_yo-12,nozzle_z+nozzle_zo+55) CuR(channel_t,channel_w,channel_r*2,r=channel_r);
  }
}

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

    if (!hide_hotend) {
        
        T(car_x + dx, car_y + dy + railY_yo, dz)
        {
            Rz(rz) mirror([1, 0, 0]) hotend_cr10();
            // T(0, -24-explode, -14) Rx(-90) Rz(0)fan_3010();
            // T(-10, -24, 7+explode) R(90,0,0) blower_5015();
            // T(0,-10,40)bl_touch();
            C(0.7,0.1,0.1){
                T(12,7,-34) R(30,50) Cy(6/3,10);  // wires
                T(15,4,-7) Cy(6/3,50);  // wires
            }

            nozzle_z = -48;
            nozzle_xo = 12;
            nozzle_zo = 3;
            nozzle_yo = 0*5;
            outlet_w = 10;
            outlet_h = 3;
            outlet_r = 1.5;
            channel_w = 12;
            channel_t = 6;
            channel_r = 2;
            blower_z = 20;

            T(-10, -24, blower_z+explode) R(90,0,0) blower_5015();

            T()
            // Rx(90) // for print
            // cutXZ(rx=ax, y=-20)
            // cutYZ(x=-20)
                D() {
                  U(){ 
  
                  }

                  U(){ 
                    leg();
                    mirror([1,0,0])leg();
                  }
                }
        }
    }
}

caret_asm();














