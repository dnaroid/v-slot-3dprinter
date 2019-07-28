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
	color([0.66, 0.64, 0.6])
	translate([0, 0, -l / 2])
	cylinder(r = 4, h = l, center = true);
	color([0.8, 0.7, 0.4]) {
		translate([0, 0, -pos])
		cylinder(r = 8, h = 15, center = true);
		translate([0, 0, -pos - 4.5])
		cylinder(r = 11, h = 3.5, center = true);
	}
}

module kfl08() {
	color([0.66, 0.64, 0.6]) {
		translate([0, 0, 4])
		cylinder(r = 12, h = 13, center = true);
		hull() {
			translate([-18, 0, 0])
			cylinder(r = 6, h = 4, center = true);
			cylinder(r = 12, h = 4, center = true);
			translate([18, 0, 0])
			cylinder(r = 6, h = 4, center = true);

		}
	}
}

module draw_belt(from, to, a, pr = 6) {
	color("black") {
		hull() {
			T(from)
			T(pr * cos(a[0]), pr * sin(a[0]), -3)
			cube([2, 2, 6]);
			T(to)
			T(pr * cos(a[1]), pr * sin(a[1]), -3)
			cube([2, 2, 6]);
		}
	}
}

module draw_belts(pulleys) {
	for (i = [0: len(pulleys) - 1]) {
		p = pulleys[i];
		prev = i > 0 ? pulleys[i - 1] : undef;
		if (p[3]) {
			T(p[0], p[1], p[2])
			pulley_assembly(p[3]);
		}
		if (prev != undef) {
			draw_belt(
				[p[0], p[1], p[2]],
				[prev[0], prev[1], prev[2]],
				[p[4][0], prev[4][1]]
			);
		}
	}
}