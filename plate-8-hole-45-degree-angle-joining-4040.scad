// rob@openpart.co.uk 20140202-02:02
// 8 hole joining plate to connect 40mm to 20mm NOMINAL extrusion at 45 degrees
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
angle = 45;
hole = 5.5 / 2;
plate_width1 = 36;
plate_width2 = 36;
plate_length1 = 56;
plate_length2 = 16;
plate_thickness = 4;
extend_past_thickness = 2;
corner_radius = 1.4;
difference() {
	hull () {
		rotate([0,0,angle]) {
			translate([0, 10, 0])
				roundedRect ([plate_length1, plate_width1, plate_thickness], corner_radius);
		}
		translate([40, 10, 0])
				roundedRect ([plate_length2, plate_width2, plate_thickness], corner_radius);
		}
		translate([20,20,-1])
			cylinder(h = (extend_past_thickness+plate_thickness+2), r = hole);
		translate([20,0,-1])
			cylinder(h = (extend_past_thickness+plate_thickness+2), r = hole);
		translate([40,20,-1])
			cylinder(h = (extend_past_thickness+plate_thickness+2), r = hole);
		translate([40,0,-1])
			cylinder(h = (extend_past_thickness+plate_thickness+2), r = hole);

		rotate([0,0,angle]) {
			translate([-20,0,-1])
				cylinder(h = (extend_past_thickness+plate_thickness+2), r = hole);
			translate([-20,20,-1])
				cylinder(h = (extend_past_thickness+plate_thickness+2), r = hole);
			translate([0,20,-1])
				cylinder(h = (extend_past_thickness+plate_thickness+2), r = hole);
			translate([0,0,-1])
				cylinder(h = (extend_past_thickness+plate_thickness+2), r = hole);
		}
}
