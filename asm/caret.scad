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

            nozzle_z = -48;
            nozzle_xo = 12;
            nozzle_zo = 4;
            nozzle_yo = 0;

            ow = 20;   oh = 5;
            cw = 16;   ch = 8;
            fw = 19;   fh = 9;
            t=2.4;

            blower_z = 12;
            nodes=[
                [0,0,0,  ow,oh],

                [8,0,0,  ow,oh],
                [11,-1,2, cw,ch],
                [12,-3,6, cw,ch],
                [10,-6,11, cw,ch],
                [6,-7,14,  cw,ch],

                [4,-8,20, cw,ch],
                [4,-13,43, cw,ch],
                [2,-14.5,47, cw,ch],
                [-1,-16,50, cw,ch],
                [-6,-18,55, cw,ch],

                [-9,-19.5,61, fw,fh],
                [-9,-19.5,65, fw,fh]
            ];

            T(10, -25, 38+explode) Rx(90+fan_r*0) Ry(-90) blower_4020();
            T(0, -26-explode, -10) Rx(-90+fan_r) Rz(0) fan_4010();
            !T()
            // Rx(180-10) // for print
            // cutXZ(rx=18, y=-20)
            // cutYZ(x=-15,ry=18)
            U() {
                D() {
                  U(){ 
                    with_mirror() T(nozzle_xo,nozzle_yo,nozzle_z+nozzle_zo)snake(nodes);
                    // self holder
                    T(0,-11,-2)CuR(28,6,14,r=2); 
                    // fan holder
                    T(0, -30, 5) Rx(-90+fan_r) Rz(0)forX(32,2) Tz(6)Cy(5/2,6);
                    // blower insert
                    T(0,-20,20)CuR(16.6,25,10,r=2);
                  }

                  U(){ 
                    with_mirror() T(nozzle_xo,nozzle_yo,nozzle_z+nozzle_zo)snake(nodes,-t);
                    // top cut blower
                    T(0,-30,35)Rx(10)Cu(100,60,30);
                    // bottom cut blower
                    Tz(-45)Cu(24,30,10); 
                    // self holder
                    Tz(-3)forX(14,2)hullZ(2)Rx(90)Cy(5/2,50); 
                    // fan holder
                    T(0, -30, 5) Rx(-90+fan_r) Rz(0)forX(32,2) Tz(6)Cy(2.55/2,6.1);
                    // blower holder
                    T(11,-42.5,20.5)Ry(90)Cy(3/2,10);
                    T(11,-7.5,55.5)Ry(90)Cy(3/2,10);
                    T(11,-26,38)Ry(90)Cy(30/2,10);
                  }
                }
                // outlet supports
                with_mirror() T(nozzle_xo+4,nozzle_yo,nozzle_z+nozzle_zo)
                forY(5,4) Cu(8,.4,oh);

                with_mirror() T(nozzle_xo+.2,nozzle_yo,nozzle_z+nozzle_zo+oh/2)U(){
                  hull(){
                    Cu(.4,ow-1,.1);
                    T(2.5,-7,10) Cu(.4,cw-4,.1);
                  }
                  hull(){
                    T(6)Cu(.4,ow-1,.1);
                    T(5.5,-7,6.8) Cu(.4,cw-4,.1);
                  }
                  hull(){
                    T(3)Cu(.4,ow-1,.1);
                    T(3.7,-7,8) Cu(.4,cw-4,.1);
                  }
                }
                D(){ // blower insert support
                  T(0,-20,20)Cu(.4,20,10);
                  T(0,-30,35)Rx(10)Cu(20,60,30);
                }
            }
        }
    }
}

caret_asm();














