// hide_motors = 1;
// hide_belts = 1;
// hide_hotend = 1;
// hide_bed = 1;

car_y = -00;
car_x = -00;
bed_z = -200; // 0..-200

profile_l = 300; // x9
profileV_l = 300; // x6  = x15
profile_t = 20;

railX_type = MGN9; // x5
railX_l = 250;
railX_support_t = 3;
railY_type = MGN9;
railY_l = 250;
railY_yo = 5;
railY_car_h = railY_type[9][3];
railY_car_l = railY_type[9][0];
railY_car_w = railY_type[9][2];
railY_w = railY_type[1];
railZ_type = MGN9;
railZ_l = 250;
railZ_zo = 35;

hotEnd_type = E3D_clone; // JHeadMk5, JHeadMk4, E3Dv5, E3Dv6, E3D_clone

bed_s = 214;
bed_yo = -10;
bed_zo = -60;

motorXY_type = NEMA17;
motorXY_x = (profile_l / 2);
motorXY_y = (profile_l / 2) + profile_t;
motorXY_z = -10;
motorZ_type = NEMA17;
motorZ_x = 0;
motorZ_y = (profile_l / 2) + profile_t * 2;
motorZ_z = -profileV_l + 10;

screw_l = 250;
screw_xo = profile_l / 2 - 30;
screw_z = -(profileV_l - screw_l) - 25;

///////////// profile const

pl = profile_l;
vl = profileV_l;
pt = profile_t;
hpt = pt / 2;
hpl = pl / 2;
long = hpl + hpt;
short = hpl - hpt;
///////////////////////