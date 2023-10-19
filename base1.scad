
base1(100/100, 20/100);

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