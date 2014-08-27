// rob@openpart.co.uk 20140130-23:55
// 10 hole joining plate for 40mm NOMINAL extrusion
// MakerSlide, V-Slot 4020 & others

module roundedRect(size, radius)
{
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

hole = 5.5 / 2;
plate_width = 96;
plate_length = 36;
plate_thickness = 4;
extend_past_thickness = 2;
corner_radius = 0.7;

difference() {
	translate([0, 10, 0])
		roundedRect ([plate_length, plate_width, plate_thickness], corner_radius);
	
	// Holes
	translate([10,50,-1])
		cylinder(h = (extend_past_thickness+plate_thickness+2), r = hole);
	translate([-10,50,-1])
		cylinder(h = (extend_past_thickness+plate_thickness+2), r = hole);
	translate([10,30,-1])
		cylinder(h = (extend_past_thickness+plate_thickness+2), r = hole);
	translate([-10,30,-1])
		cylinder(h = (extend_past_thickness+plate_thickness+2), r = hole);
	translate([10,10,-1])
		cylinder(h = (extend_past_thickness+plate_thickness+2), r = hole);
	translate([-10,10,-1])
		cylinder(h = (extend_past_thickness+plate_thickness+2), r = hole);
	translate([10,-10,-1])
		cylinder(h = (extend_past_thickness+plate_thickness+2), r = hole);
	translate([-10,-10,-1])
		cylinder(h = (extend_past_thickness+plate_thickness+2), r = hole);
	translate([10,-30,-1])
		cylinder(h = (extend_past_thickness+plate_thickness+2), r = hole);
	translate([-10,-30,-1])
		cylinder(h = (extend_past_thickness+plate_thickness+2), r = hole);
}




