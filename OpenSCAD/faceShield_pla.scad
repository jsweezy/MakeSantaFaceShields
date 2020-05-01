// File to stack 3DVerkstan Face Shield Frames
// OpenSCAD here is a modification of OpenSCAD file 
// which can be found at:
// https://gist.github.com/patmandenver/847a0bf508b523487a3708c39c799950

$fn=100;
num=12;
heigth=5;
floor_thickness=1.2;
bump=0.2;
space=0.2;
cylinder_size=0.8;
extend_for_testing=0; //Set to 10 to see cylinders
test=0;  // 0 = no, 1 = yes
hide_bottom = 1; // 0 = no, 1=yes

headband_file="../STLs/frame.stl";

main();

module main(){ 

rotate(180){
  
  if( num > 1 ) {  
  for(x=[0:num-2]){
    translate([0,0,x*(heigth+bump+space)]){
       import(headband_file, convexity=3); 
       color("blue") mirror_copy() floor(floor_thickness);
       //rotate(180) supports();
        
       translate([0,0,space]) { 
       color("blue") translate([0,0,heigth]) mirror_copy() bridge(bump);
       mirror_copy() cylinder_supports();
       }
    }
  }
  }
  
  translate([0,0,(num-1)*(heigth+bump+space)]){
      import(headband_file, convexity=3); 
      color("blue") mirror_copy() floor(floor_thickness);
      if( test > 0 ) {
        translate([0,0,space]) {
        //rotate(180) supports();
        translate([0,0,heigth]) mirror_copy() bridge(bump);
        mirror_copy() cylinder_supports();
        }
      }
  }
  
}
}

module cylinder_supports() {
    //Supports on just one side
support_locs=[
             [12.5,31],
             //[12.5,17.3],
             //[48.3,4.6],
             [5,28.8],
             [25,26.9],  
             [40,24.0],  
             [51,20.5],  
             [54.3,12],
             [56.5,6],
             [62,1.5],
             [69.5,-1],
             [77.5,-13],
             [73,-13],
             [73,-28],
             [77.0, -38.2],
             [72.5, -38.2],
             [70.0, -55],
             [67.0,-67],
             [56,-95],
             [62.7,-80],
             [47.2,-110],
             [26.3,-135],
             [29, -147.1],
             [37.8, -146],
             [38.3, -134.5],
             [25, -142.0],
             [40.25, -140.0],
             [35.8,-125]
             ];
             
  for(y = [0:len(support_locs)-1]){
    translate([0,0,heigth])
    translate(support_locs[y]){
      color("#FF0000"){
        cylinder(bump+extend_for_testing, 
                 cylinder_size, cylinder_size);
      }
    }
  }
}


//See https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/Tips_and_Tricks#Create_a_mirrored_object_while_retaining_the_original
module mirror_copy(v = [1, 0, 0]) {
    children();
    mirror(v) children();
}

module floor(ft){
  color("#FF0000"){
    linear_extrude(ft){
        polygon([
                 
                 [0,29.1],
                 [10,28.8],
                 [15,28.4],
                 [20,28.0],
                 [25,27.3],
                 [30,26.6],
                 [35,25.6],
                 [40,24.5],
                 [45,23.2],
                 [48.1,22.4],
                 [48.1,20.1],
                 [49.0,19],
                 [50.5,16],
                 [49.8,6.5],
                 [49.5,5.5],
                 [49,5],
                 [48,4.55],
                 [47,4.7],
                 [46,5.3],
                 [44,6.5],
                 [43,7.1],
                 [39,9.2],
                 [35,11.05],
                 [32.5,12.07],
                 [30,13.0],
                 [25,14.7],
                 [20,16.0],
                 [15,17.0],
                 [10,17.7],
                 [5,18.15],
                 [0,18.3],
                ]
            );
    }
  }
}

module bridge(ft){
  overlap = 1.5;
  color("#FF0000"){
    linear_extrude(ft){
        polygon([
                 
                 [0,25.95+overlap],
                 [10,25.7+overlap],
                 [15,25.2+overlap],
                 [20,24.8+overlap],
                 [25,24.05+overlap],
                 [30,23.3+overlap],
                 [35,22.3+overlap],
                 [40,21.2+overlap],
                 [45,19.9+overlap],
                 [48.4,19.0+overlap],
                 [48.4,19.0+overlap],
                 [49.1+overlap,17.3+overlap],
                 [50.5,16],
                 [49.8,6.5],
                 [49.5,5.5],
                 [49,5],
                 [48,4.55],
                 [47,4.7],
                 [46,5.3],
                 [44,6.5],
                 [43,7.1],
                 [39,9.2],
                 [35,11.05],
                 [32.5,12.07],
                 [30,13.0],
                 [25,14.7],
                 [20,16.0],
                 [15,17.0],
                 [10,17.7],
                 [5,18.15],
                 [0,18.3],
                ]
            );
    }
  }
}

module supports() {
    support(43,-14.5,11.0,-26);
    support(50,-21.5,17.0);
    support(49.5,-22.0,17.0);
    support(44,-23.5,16.1); 
    support(36,-25.5,15.2); 
    support(27.5,-27,14.4); 
    support(19,-28.5,14.8);
    support(13,-32.5,19.8);
    support(-0,-29.5,16.2);
    support(-10,-29.5,20.0);
    support(-21.5,-28.0,21.5,40);
    support(-31,-26.5,28.0,40);
    support(-41,-24.5,17,35);
    support(-50,-18.0,13.5,-40);
    support(-49.25,-18.5,13.5,-40);
}

module support(x,y,l,r=45) {
    color("green"){
//        translate([x,y,floor_thickness]) rotate(r) 
//        cube([1,l,heigth-floor_thickness+bump+extend_for_testing]);
        translate([x,y,heigth]) rotate(r) 
        cube([1,l,bump+extend_for_testing]);
    }
}
