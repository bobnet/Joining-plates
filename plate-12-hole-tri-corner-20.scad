// rob@openpart.co.uk 20140204-03:26
// 12 hole joining plate to connect 3 off 20mm NOMINAL extrusion at 120 degrees
// V-Slot & others

module roundedRect(size, radius) {
	x = size[0];
	y = size[1];
	z = size[2];
	linear_extrude(height=z)
	hull()
	{
		// place 4 circles in the corners, with the given radius
		translate([(-x/2)+(radius/2), (-y/2)+(radius/2), 0])
		circle(r=radius);
		translate([(x/2)-(radius/2), (-y/2)+(radius/2), 0])
		circle(r=radius);
		translate([(-x/2)+(radius/2), (y/2)-(radius/2), 0])
		circle(r=radius);
		translate([(x/2)-(radius/2), (y/2)-(radius/2), 0])
		circle(r=radius);
	}
}
angle = 120;
hole = 5.5 / 2;
plate_width1 = 18;
plate_width2 = 18;
plate_width3 = 18;
plate_length1 = 40;
plate_length2 = 40;
plate_length3 = 40;
plate_thickness = 4;
extend_past_thickness = 2;
corner_radius = 2.8;

difference() {
hull () {
		rotate([0,0,(angle/2)]) {
			translate([30, 0, 0])
				roundedRect ([plate_length1, plate_width1, plate_thickness], corner_radius);
		}
		rotate([0,0,angle]) {
			translate([30, 0, 0])
				roundedRect ([plate_length3, plate_width1, plate_thickness], corner_radius);
		}

		translate([30, 0, 0])
				roundedRect ([plate_length2, plate_width2, plate_thickness], corner_radius);
		}



		rotate([0,0,angle]) {
			translate([45,00,-1])
					cylinder(h = (extend_past_thickness+plate_thickness), r = hole);
			translate([35,0,-1])
					cylinder(h = (extend_past_thickness+plate_thickness), r = hole);
			translate([25,0,-1])
					cylinder(h = (extend_past_thickness+plate_thickness), r = hole);
			translate([15,0,-1])
					cylinder(h = (extend_past_thickness+plate_thickness), r = hole);
		}

			translate([45,00,-1])
					cylinder(h = (extend_past_thickness+plate_thickness), r = hole);
			translate([35,0,-1])
					cylinder(h = (extend_past_thickness+plate_thickness), r = hole);
			translate([25,0,-1])
					cylinder(h = (extend_past_thickness+plate_thickness), r = hole);
			translate([15,0,-1])
					cylinder(h = (extend_past_thickness+plate_thickness), r = hole);

		rotate([0,0,(angle/2)]) {
			translate([15,0,-1])
					cylinder(h = (extend_past_thickness+plate_thickness), r = hole);
			translate([45,00,-1])
					cylinder(h = (extend_past_thickness+plate_thickness), r = hole);
			translate([35,0,-1])
					cylinder(h = (extend_past_thickness+plate_thickness), r = hole);
			translate([25,0,-1])
					cylinder(h = (extend_past_thickness+plate_thickness), r = hole);
		}
}
