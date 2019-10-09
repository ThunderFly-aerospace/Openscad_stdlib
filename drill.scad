include <../../../parameters.scad>

//     pipe_drill(pipe_diameter = 10, drill_diameter = 3.2, end = true, cube_side = 30, height = 35, clamp_length = 10, clamp_thickness = 1, holes = [5, 15], text_a = "drill 888_1030  ", text_b = "zadni drz pylonu  ");
module pipe_drill(pipe_diameter = beam_main_pipe_thickness, drill_diameter = M3_screw_diameter, end = true, cube_side = 30, height = 50, clamp_length = 15, clamp_thickness = 1, holes = [5, 10, 15, 20], text_a = "", text_b = "", draft = false){

    difference(){
        translate([-cube_side/2, -cube_side/2, end? -5: 0]) cube([cube_side, cube_side, height + (end?5:0)]);
        cylinder(d = pipe_diameter, h=height+1, $fn = draft? 10 : 60);

        for(i = holes){
            translate([0, 0, i])
                rotate([0, 90, 0])
                    cylinder(d = drill_diameter, h = cube_side+2, center = true, $fn = draft? 10 : 60);
        }

        translate([-clamp_thickness/2, -cube_side/2, height - clamp_length])
            cube([clamp_thickness, cube_side, clamp_length]);

        for(i = [1, -1]){
            translate([-cube_side/2, i*(pipe_diameter/2+2), height - clamp_length/2])
                rotate([0, 90, 0])
                    cylinder(d = M3_screw_diameter, h = cube_side, $fn = draft? 10 : 60);

            translate([-cube_side/2, i*(pipe_diameter/2+2), height - clamp_length/2])
                rotate([0, 90, 0])
                    cylinder(d = M3_nut_diameter, h = cube_side/2 - pipe_diameter/3, $fn = 6);

            translate([pipe_diameter/3, i*(pipe_diameter/2+2), height - clamp_length/2])
                rotate([0, 90, 0])
                    cylinder(d = M3_nut_diameter, h = cube_side/2 - pipe_diameter/3, $fn = 6);
        }

        translate([-cube_side/4, -cube_side/2, height/2]) rotate([90, -90, 0]) linear_extrude(0.3, center = true) text(text_a, valign = "center", halign = "center", size = 4);
        translate([cube_side/4, -cube_side/2, height/2]) rotate([90, -90, 0]) linear_extrude(0.3, center = true) text(text_b, valign = "center", halign = "center", size = 4);
    }
}
