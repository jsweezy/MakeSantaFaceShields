# MakeSantaFaceShields
Face shield project for MakeSantaFe for COVID-19 aid for Santa Fe, NM.  

## Summary
Slight modification of the 3DVerkstan face shield frame to support stacking with PETG.

## Details
This was developed for stacking with PETG on a Prusa i3 Mk3. The original 3DVerkstan design is imported into 
OpenSCAD. A custom interface layer of 0.3mm is added between frames.  The interface layer consists of small 
cylinders along the arms of the frame.  Over the drip tray a bridge is added to support the next frame. The print 
settings for this layer are modified in Prusa Slicer. The nozzle temperature is lowered to 215C from the standard 250C, 
the fan is turned to 100%, and the print speed is slowed significantly.  This causes a delamination layer where the 
interface layer will fail to adhere to the frame below it. The interface layer will adhere to the frame above. 

There are two Perl scripts provided that generate custom GCODE and layer information for Prusa Slicer. These
are in the `Scripts` directory and include:\
`generate_gcode_for_PrusaSlicer.pl` - Generates custom GCODE\
`generate_layer_config_ranges_for_PrusaSlicer.pl` - Generates custom layer ranges

These scripts are used to modify Prusa project files, which are contained in a zip format.  If the print temperatures
need to modified then the Scripts need to be modified, the temperatures are set with a variable. The nozzle and bed temperatures need to also be set in Prusa Slicer. The procedure for modifying a project file is:

1) Make a directory for the project files and change to that director:\
`mkdir test_project`\
`cd test_project`
 
2) Unzip the Prusa project file.\
`unzip ../PrusaProjectFiles/8stack_test_petg.3mf`

3) Apply the custom GCODE generating script:\
`../Scripts/generate_gcode_for_PrusaSlicer.pl > Metadata/Prusa_Slicer_custom_gcode_per_print_z.xml`

4) Apply the layer config ranges script:\
`../Scripts/generate_layer_config_ranges_for_PrusaSlicer.pl > Metadata/Prusa_Slicer_layer_config_ranges.xml`

5) Recombine the files into a single Prusa project file:\
`zip ../PrusaProjectFiles/new_project.3mf -r *`

Now the new project file can be opened in Prusa Slicer and sliced. 

## Variations from the standard 3DVerkstan design

The goals was to make as few modifications to the 3DVerkstan design as possible. Such as maintaining the sweat drip tray. 
Some modifications for stacking fill in the drip tray. But the drip tray seems like an important design feature.  

### Drip Tray

The drip tray is slightly thickened to prevent damage when seperating the frames.  The original design was only 2 layers
thick for a 0.3mm layer height.  This also seemed to allow small holes if slight imperfections are made during a layer.  The
drip has been thickened to be 4 layers thick for strength and to prevent small holes. 

The interface layer contains a bridge below the drip tray.  The bridge will generally adhere well to the drip tray and provide another layer.  

### Arms

Small cylinders to seperate and support the frames have been added.  The design has been modified from IQLess (see reference below).  These cylinders can be easily removed but are not generally significant.   

### 


## References

### National Institues of Health page for this design:
https://3dprint.nih.gov/discover/3dpx-013306

### 3DVerkstan Page:
https://3dverkstan.se/protective-visor/

### Matterhackers Page for 3DVerkstan Design:
https://www.matterhackers.com/store/l/protective-face-shield/sk/M7LP9Q7M

### IQLess YouTube Channel
OpenSCAD support idea from: https://www.youtube.com/watch?v=apcrs6d_irc\
"Covid: Stacking Prusa RC3 and 3Dverkstan face shields Using Openscad"\
By iqless. OpenSCAD here is a modification of his file which can be found at:\
https://gist.github.com/patmandenver/847a0bf508b523487a3708c39c799950

