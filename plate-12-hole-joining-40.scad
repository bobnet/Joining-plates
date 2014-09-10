// rob@openpart.co.uk 20140202-02:23
// 12 hole joining plate for 40mm NOMINAL extrusion
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
plate_width = 116;
plate_length = 36;
plate_thickness = 4;
extend_past_thickness = 2;
corner_radius = 0.7;

difference() {
	translate([0, 10, 0])
		roundedRect ([plate_length, plate_width, plate_thickness], corner_radius);
	
	// Holes
	translate([10,60,-1])
		cylinder(h = (extend_past_thickness+plate_thickness+2), r = hole);
	translate([-10,60,-1])
		cylinder(h = (extend_past_thickness+plate_thickness+2), r = hole);
	translate([10,40,-1])
		cylinder(h = (extend_past_thickness+plate_thickness+2), r = hole);
	translate([-10,40,-1])
		cylinder(h = (extend_past_thickness+plate_thickness+2), r = hole);
	translate([10,20,-1])
		cylinder(h = (extend_past_thickness+plate_thickness+2), r = hole);
	translate([-10,20,-1])
		cylinder(h = (extend_past_thickness+plate_thickness+2), r = hole);
	translate([10,0,-1])
		cylinder(h = (extend_past_thickness+plate_thickness+2), r = hole);
	translate([-10,0,-1])
		cylinder(h = (extend_past_thickness+plate_thickness+2), r = hole);
	translate([10,-20,-1])
		cylinder(h = (extend_past_thickness+plate_thickness+2), r = hole);
	translate([-10,-20,-1])
		cylinder(h = (extend_past_thickness+plate_thickness+2), r = hole);
	translate([10,-40,-1])
		cylinder(h = (extend_past_thickness+plate_thickness+2), r = hole);
	translate([-10,-40,-1])
		cylinder(h = (extend_past_thickness+plate_thickness+2), r = hole);
}
