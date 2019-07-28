// hide_motors = 1;
// hide_belts = 1;
// hide_hotend = 1;
// hide_bed = 1;

car_y = -00;
car_x = -00;
bed_z = -00; // 0..-200

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
motorZ_y = (profile_l / 2) + profile_t;
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

////////// BOM /////////////

// closed belt GT2 800mm (900mm)
// 2020 300mm x15
// MGN9 250mm x5
// T8 screw & nut x2
// 20 tooth pulley GT2 bore 5mm (motor) x3
// 20/80 tooth pulley GT2 bore 8mm (lift) x2
// 20 tooth bearing pulley GT2 bore 5mm x6 https://www.aliexpress.com/item/32954658121.html?spm=a2g0o.productlist.0.0.c8cc1d7b4bBISq&algo_pvid=7e9dc438-ed66-47c7-b850-79f93b571fea&algo_expid=7e9dc438-ed66-47c7-b850-79f93b571fea-0&btsid=46aea855-1ff1-4ba2-b5c8-e5954d72a48e&ws_ab_test=searchweb0_0%2Csearchweb201602_4%2Csearchweb201603_52
// plain bearing pulley GT2 bore 5mm x2 https://www.aliexpress.com/item/32954658121.html?spm=a2g0o.productlist.0.0.c8cc1d7b4bBISq&algo_pvid=7e9dc438-ed66-47c7-b850-79f93b571fea&algo_expid=7e9dc438-ed66-47c7-b850-79f93b571fea-0&btsid=46aea855-1ff1-4ba2-b5c8-e5954d72a48e&ws_ab_test=searchweb0_0%2Csearchweb201602_4%2Csearchweb201603_52
// plain bearing pulley GT2 bore 8mm x3
// KFL08 x2
// 2020 nuts M3 (for MGN9)x
// 2020 nuts M5 x
// 2020 L connector x