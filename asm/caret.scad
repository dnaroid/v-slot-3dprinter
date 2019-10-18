module CuRT(mx,my,mz, wy,wz, r,t=0,rot=0){
  rt = r+r*(sign(t));
  #T(mx,my,mz)Ry(rot)CuR(2,wy+t,wz+t,r=rt);
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

    fan_r = 25;

    if (!hide_hotend) {
        
        T(car_x + dx, car_y + dy + railY_yo, dz)
        {
            Rz(rz) mirror([1, 0, 0]) hotend_cr10();
            // T(20,-10,40)bl_touch();

            C(0.7,0.1,0.1){
                T(12,7,-34) R(30,50) Cy(6/3,10);  // wires
                T(15,4,-7) Cy(6/3,50);  // wires
            }

            nozzle_z = -48;
            nozzle_xo = 12;
            nozzle_zo = 3;
            nozzle_yo = 0*5;

            outlet_w = 20;
            outlet_h = 2;
            outlet_r = 2;

            channel_w = 16;
            channel_h = 4;
            channel_r = 2;

            blower_z = 12;

            // T(-7.5, -5, blower_z+explode) R(90,0,-90) blower_5015();
            T(10, -34, 32+explode) Rx(90+fan_r) Ry(-90) blower_4020();
            T(0, -24-explode, -10) Rx(-90+fan_r) Rz(0) fan_4010();
            T()
            // Rx(90) // for print
            // cutXZ(rx=18, y=-20)
            // cutYZ(x=-15,ry=18)
            U() {
                t=2;
                x=nozzle_xo;
                y=nozzle_yo;
                z=nozzle_z+nozzle_zo;
                D() {
                  U(){ with_mirror()
                  hulls() {
                      CuRT(x,y,z,      outlet_w,outlet_h,      outlet_r);
                      CuRT(x+8,y,z,    outlet_w,outlet_h,      outlet_r,0,45);
                      CuRT(x+10,y,z+5, channel_w,channel_h,    channel_r,0,0);
                      CuRT(x+8,y,z+10, channel_w,channel_h,    channel_r,0,-45);
                  }

                    // self holder
                    T(0,-12,-3)forX(14,2)hullZ(2)Rx(90)Cy(9/2,5); 

                    // fan holder
                    T(0, -13, -23) Rx(-90+fan_r) Rz(0)forX(24,2) hull(){Cy(5/2,5);T(0,-8,4)Cy(0.1,5);}
                  }

                  U(){ 
                    #with_mirror() hulls() {
                    }

                    // top cut blower
                    Tz(32)Cu(30,60,30);

                    // bottom cut blower
                    Tz(-45)Cu(24,30,10); 

                    // self holder
                    Tz(-3)forX(14,2)hullZ(2)Rx(90)Cy(4/2,50); 

                    // fan holder
                    T(0, -13, -23) Rx(-90+fan_r) Rz(0)forX(24,2) Tz(-2)Cy(2.5/2,5.01);

                  }
                }
                // supports
                T(nozzle_xo+2,nozzle_yo-4,nozzle_z+nozzle_zo)Cu(3.7,0.4,2.5);
                T(nozzle_xo+2,nozzle_yo,nozzle_z+nozzle_zo)Cu(3.7,0.4,2.5);
                T(nozzle_xo+2,nozzle_yo+4,nozzle_z+nozzle_zo)Cu(3.7,0.4,2.5);
               
                T(-nozzle_xo-2,nozzle_yo-4,nozzle_z+nozzle_zo)Cu(3.7,0.4,2.5);
                T(-nozzle_xo-2,nozzle_yo,nozzle_z+nozzle_zo)Cu(3.7,0.4,2.5);
                T(-nozzle_xo-2,nozzle_yo+4,nozzle_z+nozzle_zo)Cu(3.7,0.4,2.5);

                hull() {
                  T(-nozzle_xo-.2,nozzle_yo,nozzle_z+nozzle_zo+1.8)Cu(0.4,outlet_w-t,0.4);
                  T(-nozzle_xo-.2,nozzle_yo-4.5,nozzle_z+nozzle_zo+17.8)Cu(0.4,channel_w-t,0.4);
                }

                hull() {
                  T(nozzle_xo+.2,nozzle_yo,nozzle_z+nozzle_zo+1.8)Cu(0.4,outlet_w-t,0.4);
                  T(nozzle_xo+.2,nozzle_yo-4.5,nozzle_z+nozzle_zo+17.8)Cu(0.4,channel_w-t,0.4);
                }
            }
        }
    }
}

!caret_asm();














