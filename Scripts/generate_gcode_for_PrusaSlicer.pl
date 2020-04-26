#!/usr/bin/perl
#
$num = 20;

# first empty layer - layer height=$d1
# interface layer - layer height=$d2, temp=$t1
# second empty layer - layer height=$d3
# First layer of shield frame = temp=$t2, layer height = $d4
# All other shield layers = temp=$t3, layer height = $d

# deltas
$d=0.3; # standard layer height
$d1=0.0; # first empty layer height
$d2=0.3; # interface layer height
$d3=0.0; # second empty layer height
$d4=0.0; # first layer height after interface layer

#$t1 = 180; # temperature of interface layer
#$t2 = 190; # temperature of first layer after interface layer 
#$t3 = 210; # temperature of all other layers
$t1 = 215; # temperature of interface layer
$t2 = 230; # temperature of first layer after interface layer 
$t3 = 250; # temperature of all other layers
   
$high = 50.4;

print  <<EOFA;
<?xml version="1.0" encoding="utf-8"?>
<custom_gcodes_per_print_z>
EOFA

for (my $p = 1; $p < $num+1; $p++) {
$x1=$p*5+($p-1)*($d1+$d2+$d3);
$x2=$x1+$d1;
$x3=$x2+$d2;
$x4=$x3+$d;
$x5=$x4+$d;

$high = $x3 + 20;
print  <<EOFB;
<code print_z="$x3" 
gcode="; custom_layer_jes
M104 S$t1 ; set extruder temp low
G1 Z$high ; move up in z
;G1 X10 Y190  ; move over
M106 S255  ; set fan to 100 percent
M109 R$t1 ; wait for extruder temp to drop
G4 S20 ; wait 20 seconds
M109 S$t1 ; wait for extruder temp to stabilize
G1 E1.0 F180.0 ; extrude some slowly
G4 S20 ; wait 20 seconds
" extruder="1" color=""/>
<code print_z="$x4" gcode="; custom_layer_jes
M106 S255  ; set fan to 100 percent
M104 S$t2 ; set extruder temp to mid level
G1 Z$high ; move up in z
;G1 X10 Y190  ; move over
M109 S$t2  ; wait for extruder temp to increase
" extruder="1" color=""/>
<code print_z="$x5" gcode="M104 S$t3 ; set extruder temp to high level
M106 S84  ; set fan to 33 percent
" extruder="1" color=""/>
EOFB
}

print <<EOFC;
<mode value="MultiExtruder"/>
</custom_gcodes_per_print_z>
EOFC
