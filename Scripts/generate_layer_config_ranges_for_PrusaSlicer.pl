#!/usr/bin/perl
#
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
$d4=0.2; # last layer

# $t1 = 180; # temperature of interface layer
# $t2 = 190; # temperature of first layer after interface layer 
# $t3 = 210; # temperature of all other layers
$t1 = 210; # temperature of interface layer
$t2 = 230; # temperature of first layer after interface layer 
$t3 = 250; # temperature of all other layers

print  <<EOFA;
<?xml version="1.0" encoding="utf-8"?>
<objects>
 <object id="1">
EOFA

for (my $p = 1; $p < 8; $p++) {
$x1=$p*5+($p-1)*($d1+$d2+$d3);
$x2=$x1+$d1;
$x3=$x2+$d2;
$x4=$x3+$d;

$x5=$x1+5+$d2-$d4;
$x6=$x5+$d4;
    
print  <<EOFB;
  <range min_z="$x2" max_z="$x3">
   <option opt_key="bottom_solid_layers">0</option>
   <option opt_key="bridge_speed">6</option>
   <option opt_key="external_perimeter_speed">3</option>
   <option opt_key="extruder">0</option>
   <option opt_key="fill_density">100%</option>
   <option opt_key="fill_pattern">rectilinear</option>
   <option opt_key="gap_fill_speed">6</option>
   <option opt_key="infill_speed">6</option>
   <option opt_key="layer_height">0.3</option>
   <option opt_key="perimeter_speed">3</option>
   <option opt_key="perimeters">1</option>
   <option opt_key="small_perimeter_speed">3</option>
   <option opt_key="solid_infill_speed">6</option>
   <option opt_key="top_solid_infill_speed">6</option>
   <option opt_key="top_solid_layers">0</option>
  </range>
EOFB

print  <<EOFC;
  <range min_z="$x3" max_z="$x4">
   <option opt_key="bottom_solid_layers">0</option>
   <option opt_key="bridge_speed">30</option>
   <option opt_key="external_perimeter_speed">15</option>
   <option opt_key="extruder">0</option>
   <option opt_key="fill_density">100%</option>
   <option opt_key="fill_pattern">rectilinear</option>
   <option opt_key="gap_fill_speed">30</option>
   <option opt_key="infill_speed">30</option>
   <option opt_key="layer_height">0.3</option>
   <option opt_key="perimeter_speed">15</option>
   <option opt_key="perimeters">4</option>
   <option opt_key="small_perimeter_speed">15</option>
   <option opt_key="solid_infill_speed">30</option>
   <option opt_key="top_solid_infill_speed">30</option>
   <option opt_key="top_solid_layers">1</option>
  </range>
EOFC

print  <<EOFD;
  <range min_z="$x5" max_z="$x6">
     <option opt_key="extruder">0</option>
     <option opt_key="layer_height">0.2</option>
  </range>
EOFD

}

print  <<EOFE;
 </object>
</objects>
EOFE

