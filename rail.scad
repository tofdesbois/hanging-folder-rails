/*
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */
 
$fn=100;
lg=200;
label=true;

module arrondi() {
    cylinder(r=1, h=lg);
}

module renfort1() {
    //resize([0, 0, 0])
    translate([3, 16, 0]) {
        intersection() {
            difference() {
                cylinder(r=15, h=lg);
                cylinder(r=10, h=lg);
            }
            translate([0, 0, 0]) {
                cube([10, 10, lg]);
            }
        }
    }
}

module renfort2() {
    //resize([0, 0, 0])
    intersection() {
        translate([6, 9, 0]) {
            scale([0.5, 1, 1])
            {
                difference() {
                    cylinder(r=10, h=lg);
                    cylinder(r=6, h=lg);
                    
                }
            }
        }
        translate([3, 2, 0])
            cube([3, 7, lg]);
    }
}

module renfort3() {
    //resize([0, 0, 0])
    intersection() 
    {
        translate([6, 13.5, 0]) {
            scale([1, 1.5, 1])
            {
                difference() {
                    cylinder(r=11, h=lg);
                    cylinder(r=7, h=lg);
                    
                }
            }
        }
        translate([6, 2, 0])
            cube([7, 11, lg]);
    }
}

module PassageVis(posZ) {
    rTete  = 4;
    rCorps = 2;
    posX   = -3;
    posY   = 45;
    translate([posX, posY-10, posZ])
        rotate([90, 0, 0])
            cylinder(h=10, r=rCorps);
    
    translate([posX, posY-20, posZ])
        rotate([90, 0, 0])
            cylinder(h=10, r=rTete);
    
    translate([posX, posY-18, posZ])
        rotate([90, 0, 0])
            cylinder(h=2, r1=rCorps, r2=rTete);
}

module rail() {

    union() {
        translate([0, 1, 0]) {
            arrondi();
        }
        
        if (label) {
            cube([18, 2, lg]);
        }
        else {
            cube([14, 2, lg]);
        }
        
        translate([-1, 1, 0]) {
            cube([4, 9, lg]);
        }
        
        translate([1, 10, 0]) {
            cylinder(r=2, h=lg);
        }
        
        if (label) {
            translate([13, 0, 0]) {
                cube([2, 28, lg]);
            }
        }
        else {
            translate([13, 1, 0]) {
                cube([2, 26, lg]);
            }
        }
        
        if (label) {
            translate([17, 1, 0]) {
                cube([2, 4, lg]);
            }
        }
        
        if (label) {
            translate([18, 1, 0]) {
                arrondi();
            }
        }
        else {
            translate([14, 1, 0]) {
                arrondi();
            }
        }
        
        // haut
        translate([-8, 26, 0]) {
            if (label) {
                cube([26, 2, lg]);
            }
            else {
                cube([22, 2, lg]);
            }
        }
        
        if (label) {
            translate([18, 27, 0]) {
                arrondi();
            }
            
            translate([17, 23, 0]) {
                cube([2, 4, lg]);
            }
        }
        else {
            translate([14, 27, 0]) {
                arrondi();
            }
        }
        
        translate([-8, 27, 0]) {
            arrondi();
        }
        
        renfort1();
        renfort2();
        renfort3();
    }
}

difference() {
    rail();
    if (lg<50) {
        PassageVis(lg/2);
    }
    else if (lg<250) {
        PassageVis(15);
        PassageVis(lg-15);
    }
    else {
        PassageVis(15);
        PassageVis(lg/2);
        PassageVis(lg-15);
    }
}