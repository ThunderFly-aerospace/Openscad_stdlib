$fn = $preview? 20:100;

module motor_c3548_900(){
    motor(outer_diameter = 35,
        height = 45, center_height = 38,
        axis_length = 20, axis_diameter = 5
    );
}


module motor(outer_diameter = 35, height, center_height, axis_length, axis_diameter){

    if ($preview){
        translate([0, 0, (height-center_height)/2]) cylinder(d = outer_diameter, h = center_height);
        translate([0, 0, 0]) cylinder(d1 = outer_diameter - 10, d2 = outer_diameter, h = (height - center_height)/2);
        translate([0, 0, center_height + (height-center_height)/2]) cylinder(d2 = outer_diameter - 10, d1 = outer_diameter, h = (height - center_height)/2);
        cylinder(d=axis_diameter, height + axis_length);
    } else {
        // Stredni plast
        color("black")
        translate([0, 0, (height-center_height)/2+1]) cylinder(d = outer_diameter, h = center_height-2);
        color("orange")
        translate([0, 0, (height-center_height)/2-0.5]) cylinder(d = outer_diameter-4, h = center_height+1);

        color("red")

        for(pos = [[0, 0], [180, (height)]])
        translate([0, 0, pos[1]]) rotate([pos[0], 0, 0])
            difference(){
            union(){
                translate([0, 0, 0]) cylinder(d1 = outer_diameter - 10, d2 = outer_diameter, h = (height - center_height)/2);
                translate([0, 0, (height - center_height)/2]) cylinder(d = outer_diameter, h = 0.5);
            }

            translate([0, 0, -0.1]) for(x = [1:6]){
                rotate([0, 0, 360/6*x]) hull() {
                    translate([10, 0, 0]) cylinder(d = 5, h=(height-center_height)/2);
                    translate([20, 0, 0]) cylinder(d = 14, h=(height-center_height)/2);
                }
            }
        }

        color("silver")
        translate([0, 0, -0.2]) cylinder(d=axis_diameter, height + axis_length);
    }
}


//motor_c3548_900();



module motor_axi_2826(){
    $fn=60;
    
    translate([0, 0, -49.4-2.5]) cylinder(d=5, h = 49.4+2.5+20);
    
    translate([0, 0, -49.4-2.5]){
        
        cylinder(d=9, h = 49.4+2.5);
        translate([0, 0, 8]) cylinder(d=34, h = 49.4-14);
        translate([0, 0, 2.5]) cylinder(d1=20, d2=35.2, h = 5);
        translate([0, 0, 2.5+5]) cylinder(d=35.2, h = 5);
        
        
        translate([0, 0, 2.5+5+5+0.7]) cylinder(d=35.2, h = 49.4-20-0.7*2);
        
        
        translate([0, 0, 2.5+5+5+0.5+0.5+(49.4-20-1)]) cylinder(d=35.2, h = 5+3);
        translate([0, 0, 2.5+5+5+0.5+0.5+(49.4-20-1)+5+3]) cylinder(d2=33, d1=35.2, h = 1.5);
    }
}



motor_axi_2826();
