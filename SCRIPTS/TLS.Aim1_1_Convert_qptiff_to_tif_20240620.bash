#!/bin/bash

# Convert qptiff files to tif files

sample="1C5.1 1P1.1 1S2.1 2X1.1 2Y1.1 2Z1.1 3D1.1 3E1.1 3F1.1 3G1.1 3P1.1"
images=/data/qango
converted=/data/qango/converted
script=/data/qango/SCRIPTS/save_image_at_spacing.py

for name in $sample
do

	img=$images/HE2mIF_${name}/${name}_HE_40x/HE2mIF_${name}_HE_40x.qptiff
	echo $img

	echo "-----Convert qptiff to tif for" $name

	python $script -i $img -s 0.5 -t /tmp -o $converted/HE2mIF_${name}_HE_40x_converted

	mv $converted/HE2mIF_${name}_HE_40x_converted/HE2mIF_${name}_HE_40x.tif /data/example/converted
	rm -r $converted/HE2mIF_${name}_HE_40x_converted

	echo "=========DONE converting" $name
	
done



# Do this for 1O2.1
# Change name for 1O2.1 (M to m)

echo "-----Convert qptiff to tif for 1O2.1"

python $script -i $images/HE2mIF_1O2.1/1O2.1_HE_40x/HE2MIF_1O2.1_HE_40x.qptiff -s 0.5 -t /tmp -o $converted/HE2mIF_1O2.1_HE_40x_converted

#/data/qango/HE2mIF_1O2.1/1O2.1_HE_40x/HE2MIF_1O2.1_HE_40x.qptiff

mv $converted/HE2mIF_1O2.1_HE_40x_converted/HE2MIF_1O2.1_HE_40x.tif /data/example/converted/HE2mIF_1O2.1_HE_40x.tif
rm -r $converted/HE2mIF_1O2.1_HE_40x_converted

echo "=========DONE converting 1O2.1"

echo "=========================================="


