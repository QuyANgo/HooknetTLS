#!/bin/bash

# Batch processing for generating Tissue Mask from converted tif files

images=/data/example/converted
#sample="1C5.1 1O2.1 1P1.1 1S2.1 2X1.1 2Y1.1 2Z1.1 3D1.1 3E1.1 3F1.1 3G1.1 3P1.1"

for img in $images/*.tif
do

	name=$(basename $img .tif)
	echo $name && echo $img
	#done
	echo "----Generate tissue mask for" $name
	
	docker run -it --rm -v $images:/tmp tiatoolbox_pyvips \
		python TissueMask.py -i /tmp/$name.tif -o /tmp/${name}_tissueMask.tif
		
	echo "------Tisse mask created for" $name
	
	mkdir /data/example/hooknettls_output/$name
	
	echo "======================================"

done

