#!/bin/bash

# Batch processing for Hooknet-TLS

images=/data/example/converted
out=/data/example/hooknettls_output
#sample="1C5.1 1O2.1 1P1.1 1S2.1 2X1.1 2Y1.1 2Z1.1 3D1.1 3E1.1 3F1.1 3G1.1 3P1.1"

for img in $images/*.tif
do
	name=$(basename $img .tif)
	wsi=${name}.tif
	mask=${name}_tissueMask.tif
	
	echo "+++++++++++++++++" && echo $wsi
	
	echo "-----Hooknet-TLS for" $name
	mkdir -p $out/${name}/images/tls-gc
	
	docker run --runtime=nvidia --shm-size 16G --gpus all -it -v $images:/tmp -v $out/${name}:/output hooknettls \
		python3 -m hooknettls \
		hooknettls.default.image_path=/tmp/$wsi \
		hooknettls.default.mask_path=/tmp/$mask \
		hooknettls.default.model_weights=/tmp/weights.h5

	echo "------Hooknet-TLS done for" $name
	echo "-------------------------------------------------------------"
	
done

echo "DONE !!! ========================================================"



# # 2. For Lung example
# echo "Lung example"

# mkdir -p /data/example/hooknettls_docker_output/Lung_40X_redo_Scan1/images/tls-gc

# docker run --runtime=nvidia --shm-size 16G --gpus all -it -v /data/example/converted:/tmp -v /data/example/hooknettls_output/Lung_40X_redo_Scan1:/output hooknettls \
	# python3 -m hooknettls \
	# hooknettls.default.image_path=/tmp/Lung_40X_redo_Scan1.tif \
	# hooknettls.default.mask_path=/tmp/Lung_40X_redo_Scan1_TissueMask.tif \
	# hooknettls.default.model_weights=/tmp/weights.h5

# echo "------Hooknet-TLS done for Lung example"
# echo "==================================================="

	
