// base1.scad - Lowest base of arm

size_per = 1/100;

base1(100*size_per, 20*size_per);

base_moving(100*size_per, 50*size_per, 21*size_per);

proximal_arm();

// The $fn parameter will influence all objects inside this module
// It can, optionally, be overridden when instantiating the module
module base1(size=50, height=20, $fn=100) {
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

module proximal_arm(length=200*size_per, width=35*size_per, base_rad=50*size_per, end_rad=50*size_per, start_coord=[0,0,40*size_per], $fn=100) {
    
    translate(start_coord) cylinder(h=length, r=width);
    
    
    // Temporary variables
    /*
    hole = size*0.8;
    cutCylinderHeight = size;
    hole_z = tx + (hole/2) + 15;
    // One positive object (sphere) and three negative objects (cylinders)
    
    difference() {
        translate([0, 0, tx]) cylinder(d=size, h=height);
        
        translate([0, 0, hole_z]) cube([hole*0.9, cutCylinderHeight, hole], center=true);
        // The '#' operator highlights the object
        //#rotate([90, 0, 0]) cylinder(d=hole, h=cylinderHeight, center=true);
        //rotate([0, 90, 0]) cylinder(d=hole, h=cylinderHeight, center=true);
    }
    */
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

