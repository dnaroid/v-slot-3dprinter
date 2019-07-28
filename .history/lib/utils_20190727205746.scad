module corn(l, t = 2, s1 = 20, s2) {
	so = (s2 == undef) ? s1 : s2;
	translate([-l / 2, 0, 0])
	difference() {
		cube([l, s1, so]);
		translate([-0.05, t, t])
		cube(l + 0.1, s1 + 0.1, so + 1);
	}
}

module t8(l, pos) {
	color([0.6, 0.6, 0.6])
	translate([0, 0, -l / 2])
	cylinder(r = 4, h = l, center = true);
	translate([0, 0, -pos])
	cylinder(r = 8, h = 15, center = true);
	translate([0, 0, -pos - 4.5])
	cylinder(r = 11, h = 3.5, center = true);
}