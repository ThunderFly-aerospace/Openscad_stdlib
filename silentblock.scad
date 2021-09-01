module silentblock(do=8, l=8, dt=3, l1=6, l2=-3){

  difference(){
    union(){
      color("gray") cylinder(d=do, h=l, center=true, $fn=30);
      if(l1 > 0){
        translate([0, 0, l/2])
          color("silver") cylinder(d=dt, h=l1, $fn=15);
      }
      if(l2 > 0){
        translate([0, 0, -l/2-l2])
          color("silver") cylinder(d=dt, h=l2, $fn=15);
      }
    }
      if(l1 < 0){
        translate([0, 0, l/2-l1+0.1])
          cylinder(d=dt, h=l1, $fn=15);
      }
      if(l2 < 0){
        translate([0, 0, -l/2-0.1])
          cylinder(d=dt, h=l2, $fn=15);
      }
  }


}
