#!/bin/bash


#creates small versions of images in input folder and creates animated gifs with the same name
#deletes the small version images.
for i in `find $1 -type d`

do 
Save="$i.gif";
echo "processing $i"
if [ -f "$Save" ]
	then
	echo "$Save is already computed.";
else
	echo "Creating Small Images"
	for im in `ls $i/*.*`
	do
		convert -resize 200x200 $im `dirname $im`/small_`basename $im`
	done
	echo "Animating and Deleting Small Images."
	convert -delay 25 `dirname $im`/small_* $Save
	rm `dirname $im`/small_*


fi


done

