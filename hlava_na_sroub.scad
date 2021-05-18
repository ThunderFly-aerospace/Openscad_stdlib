include <../../../parameters.scad>

// Diameter of the whole holder
diameter = 20;
// Tooth diameter
tooth_diameter = 3;

module hlava_na_sroub(){
	difference(){
		union(){
			cylinder(r=diameter/2, h=3, center=true, $fn = 600);
	        cylinder(d=3 * M3_screw_diameter, h = 3 * M3_screw_diameter, $fn = 50);
		}

		for ( i = [0 : 30 : 360] ){
			translate([sin(i)*diameter/2,cos(i)*diameter/2,-3]) cylinder(r=tooth_diameter/2,h=6, $fn=50);
		}

		translate([0,0,-1.5 -0.5]){
	        cylinder(d = M3_nut_diameter, h = M3_nut_height+1, $fn=6);
		translate([0,0, M3_nut_height+1 + layer_thickness])
	       # cylinder(d = M3_screw_diameter, h=14, $fn=16);
            }

	}
}

hlava_na_sroub();
