// proximal_arm.scad Proximal arm
size_per = 1/100;

proximal_arm();

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