// base_static.scad - Lowest base of arm

size_per = 1/100;

base_static(100*size_per, 20*size_per);

base_moving(100*size_per, 50*size_per, 21*size_per);

proximal_arm();
distal_arm();

// The $fn parameter will influence all objects inside this module
// It can, optionally, be overridden when instantiating the module
module base_static(size=50, height=20, $fn=100) {
    // Temporary variables
    hole = size/2;
    cylinderHeight = size * 0.25;
    cylinder(d=size, h=height);

    // One positive object (sphere) and three negative objects (cylinders)
    /*
    difference() {
        
        cylinder(d=hole, h=cylinderHeight, center=true);
        // The '#' operator highlights the object
        #rotate([90, 0, 0]) cylinder(d=hole, h=cylinderHeight, center=true);
        rotate([0, 90, 0]) cylinder(d=hole, h=cylinderHeight, center=true);
    }
    */
}

// The $fn parameter will influence all objects inside this module
// It can, optionally, be overridden when instantiating the module
module base_moving(size=50, height=20, tx, $fn=100) {
    // Temporary variables
    hole = size*0.8;
    cutCylinderHeight = size;
    hole_z = tx + (hole/2) + 15*size_per;
    // One positive object (sphere) and three negative objects (cylinders)
    
    difference() {
        translate([0, 0, tx]) cylinder(d=size, h=height);
        
        translate([0, 0, hole_z]) cube([hole*0.9, cutCylinderHeight, hole], center=true);
        // The '#' operator highlights the object
        //#rotate([90, 0, 0]) cylinder(d=hole, h=cylinderHeight, center=true);
        //rotate([0, 90, 0]) cylinder(d=hole, h=cylinderHeight, center=true);
    }
    
}

module proximal_arm(length=200, width=35, base_rad=50, end_rad=50*size_per,start_x =0,start_y=0, start_z=40, $fn=100) {
    length = length*size_per;
    width = width*size_per;
    base_rad = base_rad*size_per;
    end_rad = end_rad*size_per;
    
    start_coord = [start_x*size_per, start_y*size_per, start_z*size_per];
    
    difference(){
        translate(start_coord) cylinder(h=length, r=width);
        translate([20*size_per, -length/4, (start_z*(4.5))*size_per]) cube(length);
        translate([-length-(20*size_per), -length/4, (start_z*(4.5))*size_per]) cube(length);
        translate([-length/2,0,(start_z*size_per/2)+length]) rotate([0,90,0]) cylinder(h=length,r=10*size_per);
        translate([0,0,200*size_per]) arm_radius_cutter();

        }
    }

module arm_radius_cutter($fn=100){
    cube_size = 100*size_per;
    
    difference(){
        translate([-cube_size/2, -cube_size/2, 0]) cube(cube_size);
        rotate([0,90,0]) cylinder(h=cube_size*1.1, r=35*size_per,center=true);
    }
}


module distal_arm(length=200, width=35, base_rad=50, end_rad=50*size_per,start_x =0,start_y=0, start_z=200, $fn=100) {
    length = length*size_per;
    width = width*size_per;
    base_rad = base_rad*size_per;
    end_rad = end_rad*size_per;
    cut_width = 42*size_per;
    start_coord = [start_x*size_per, start_y*size_per, start_z*size_per];
    
    difference(){
        translate(start_coord) cylinder(h=length, r=width);
        translate([-cut_width/2, -length/4, (start_z-1)*size_per]) cube([cut_width, length, cut_width]);
        //translate([-length-(20*size_per), -length/4, (start_z*5)*size_per]) cube(length);
        translate([-length/2,0,(20*size_per)+length]) rotate([0,90,0]) cylinder(h=length,r=10*size_per);
        rotate([0,180,0]) translate([0,0,-240*size_per]) arm_radius_cutter();
        }
    }


echo(version=version());
// Written by Clifford Wolf <clifford@clifford.at> and Marius
// Kintel <marius@kintel.net>
//
// To the extent possible under law, the author(s) have dedicated all
// copyright and related and neighboring rights to this software to the
// public domain worldwide. This software is distributed without any
// warranty.
//
// You should have received a copy of the CC0 Public Domain
// Dedication along with this software.
// If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

