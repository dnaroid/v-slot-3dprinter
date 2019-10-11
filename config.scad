car_y = -100;
car_x = 100;
bed_z = -200; // 0..-200

profile_l = 300;  // x9
profileV_l = 300; // x6  = x15
profile_t = 20;

railX_type = MGN9H; // x5
railX_l = 250;
railX_yo = 0;
railX_support_t = 3;
railY_type = MGN9H;
railY_l = 250;
railX_car_w = railX_type[9][2];
railX_car_h = railX_type[9][3];
railY_yo = 25;
railY_car_h = railY_type[9][3];
railY_car_l = railY_type[9][0];
railY_car_w = railY_type[9][2];
railY_w = railY_type[1];
railZ_type = MGN9H;
railZ_car_h = railZ_type[9][3];
railZ_l = 250;
railZ_zo = 20;
railZ_xo = 50;

hotEnd_type = E3Dv6; // JHeadMk5, JHeadMk4, E3Dv5, E3Dv6, E3D_clone

bed_s = 220;
bed_yo = 10;
bed_zo = -12;

motorXY_type = NEMA17;
motorXY_x = (profile_l / 2) - 7;
motorXY_y = (profile_l / 2) + profile_t + 10;
motorXY_z = 0;
motorZ_type = NEMA17S;
motorZ_x = 0;
motorZ_y = profile_l / 2 - 42;
motorZ_z = -profileV_l - 5;

screw_l = 300;
screw_xo = profile_l / 2 - 30;
screw_z = -(profileV_l - screw_l) - 20;

///////////// profile const

pl = profile_l;
vl = profileV_l;
pt = profile_t;
hpt = pt / 2;
hpl = pl / 2;
long = hpl + hpt;
short = hpl - hpt;





