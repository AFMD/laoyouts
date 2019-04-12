// generates the substrate holder
// grey@mutovis.com
// 12 april 2019

cir_rad = 114;
flat_spacing = 197;
pocket_xy = 30.2;
pocket_x_spacing = pocket_xy + 5;
pocket_y_spacing = pocket_xy + 3.8;
m2_tap_drill_d = 1.6;
thickness = 3;

module plate(){
    intersection(){
        circle(r=cir_rad);
        square([flat_spacing,1000],center=true);
    }
}

module pocket(){
    corner_drill_d = 1.6;
    union(){
        square([pocket_xy,pocket_xy],center=true);
        translate([pocket_xy/2,pocket_xy/2]) circle(d=corner_drill_d);
        translate([-pocket_xy/2,pocket_xy/2]) circle(d=corner_drill_d);
        translate([pocket_xy/2,-pocket_xy/2]) circle(d=corner_drill_d);
        translate([-pocket_xy/2,-pocket_xy/2]) circle(d=corner_drill_d);
    }
}

linear_extrude(height=thickness){
    difference(){
        plate();
        // middle line
        translate([0,pocket_y_spacing/2,0]){
            pocket();
            translate([0,pocket_y_spacing,0]) pocket();
            translate([0,2*pocket_y_spacing,0]) pocket();
            translate([0,-1*pocket_y_spacing,0]) pocket();
            translate([0,-2*pocket_y_spacing,0]) pocket();
            translate([0,-3*pocket_y_spacing,0]) pocket();
        }
        // one left of middle
        translate([pocket_x_spacing,pocket_y_spacing/2,0]){
            pocket();
            translate([0,pocket_y_spacing,0]) pocket();
            translate([0,2*pocket_y_spacing,0]) pocket();
            translate([0,-1*pocket_y_spacing,0]) pocket();
            translate([0,-2*pocket_y_spacing,0]) pocket();
            translate([0,-3*pocket_y_spacing,0]) pocket();
        }
        // one right of middle
        translate([-pocket_x_spacing,pocket_y_spacing/2,0]){
            pocket();
            translate([0,pocket_y_spacing,0]) pocket();
            translate([0,2*pocket_y_spacing,0]) pocket();
            translate([0,-1*pocket_y_spacing,0]) pocket();
            translate([0,-2*pocket_y_spacing,0]) pocket();
            translate([0,-3*pocket_y_spacing,0]) pocket();
        }
        // right line
        translate([-2*pocket_x_spacing,pocket_y_spacing/2,0]){
            pocket();
            translate([0,pocket_y_spacing,0]) pocket();
            translate([0,-1*pocket_y_spacing,0]) pocket();
            translate([0,-2*pocket_y_spacing,0]) pocket();
        }
        // left line
        translate([2*pocket_x_spacing,pocket_y_spacing/2,0]){
            pocket();
            translate([0,pocket_y_spacing,0]) pocket();
            translate([0,-1*pocket_y_spacing,0]) pocket();
            translate([0,-2*pocket_y_spacing,0]) pocket();
        }
        // inner support holes
        translate([pocket_x_spacing/2,-pocket_y_spacing,0]) circle(d=m2_tap_drill_d);
        translate([pocket_x_spacing/2,pocket_y_spacing,0]) circle(d=m2_tap_drill_d);
        translate([-pocket_x_spacing/2,-pocket_y_spacing,0]) circle(d=m2_tap_drill_d);
        translate([-pocket_x_spacing/2,pocket_y_spacing,0]) circle(d=m2_tap_drill_d);
        // outer support holes
        translate([3*pocket_x_spacing/2,-2*pocket_y_spacing,0]) circle(d=m2_tap_drill_d);
        translate([3*pocket_x_spacing/2,2*pocket_y_spacing,0]) circle(d=m2_tap_drill_d);
        translate([-3*pocket_x_spacing/2,2*pocket_y_spacing,0]) circle(d=m2_tap_drill_d);
        translate([-3*pocket_x_spacing/2,-2*pocket_y_spacing,0]) circle(d=m2_tap_drill_d);        
    }
}