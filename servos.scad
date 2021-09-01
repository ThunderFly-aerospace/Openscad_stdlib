

module paka_jednostranna(){
    difference(){
        union(){
            cylinder(d=7, h=4, center=true, $fn=30);
            hull(){
                cylinder(d=6, h=2, center=true, $fn=20);
                translate([15, 0, 0]) cylinder(d=4, h=2, center=true, $fn=20);
            }
        }
        cylinder(d=3, h=10, center=true, $fn=20);
        translate([0, 0, 1.5]) cylinder(d=6, h=10, $fn=20);
    }
}


module servo_bms_115(angle = 0){
    
    translate([0, -23.2/4, 5+3/2]) rotate([0, 0, angle]) children(0);
    
    difference(){
        union(){
            translate([-10/2, -23.2/2, -20+5]) cube([10, 23.2, 20]);
            translate([-1.2/2, -23.2/2-5, -7/2]) cube([1.2, 23.2+10, 7]);
            
            hull(){
                translate([-10/2, 23.2/2-5, -20+5]) cube([10, 5, 23]);
                translate([-5/2, 23.2/2-10, -20+5]) cube([5, 10, 23]);
            }
            
            translate([0, -23.2/4, 5]) cylinder(d = 5, h = 3, $fn=25);
        }
        
        translate([0, 27/2, 0]) rotate([0, 90, 0]) hull(){
            cylinder(d=2, h=20, center=true, $fn=20);
            translate([0, 5, 0]) cylinder(d=2, h=20, center=true, $fn=20);
        }
        
        translate([0, -27/2, 0]) rotate([0, 90, 0]) hull(){
            cylinder(d=2, h=20, center=true, $fn=20);
            translate([0, -5, 0]) cylinder(d=2, h=20, center=true, $fn=20);
        }
        
    }
    
    hull(){
        translate([-4, -5-23/2, -20+5+3/2]) cube([8, 5, 2]);
        translate([-4, -23/2, -20+5+2/2]) cube([8, 1, 3]);
    }
}



servo_bms_115(20){ paka_jednostranna(); }