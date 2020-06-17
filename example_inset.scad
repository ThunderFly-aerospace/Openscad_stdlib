use <inset.scad>

module cross(){
    cube([40, 10, 10], center = true);
    cube([10, 40, 10], center = true);
}

{
inset_shell(1)
    cross();
}
