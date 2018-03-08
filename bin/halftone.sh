#!/bin/bash


#size of the patch circles are drawn
patch_size=$3
echo "size of the patch: $patch_size"

#number of circles
t_circle=`expr "$patch_size" / 2`
t_circle=`expr "$t_circle" - 1`
echo number of circles: `expr "$t_circle" + 1`

#center of the circle
circle_center=`echo "$patch_size / 2 - 0.5" | bc`
cc=$circle_center
echo center of the circle: $cc

#max radius
circle_max_radius=`expr "$patch_size" / 2`
cmr=$circle_max_radius
echo maximum circle radius: $cmr

#create the circles
for i in `seq 0 "$t_circle"`; 
	do
	j=`echo "$i + $cc" | bc`
	convert -size "$patch_size"x"$patch_size" xc: -draw "circle $cc,$cc $cc,$j" miff:-
	done | convert - circle_array.gif

convert circle_array.gif +append circle_list.gif

image_size_x=480
image_size_y=400
pixelated_size_x=`expr "$image_size_x" / "$patch_size"`
pixelated_size_y=`expr "$image_size_y" / "$patch_size"`
scale_factor=`expr "$patch_size" \* 100`

target_name=`basename $1.jpg`_pixelated_$3.png
target_name2=`basename $1 .jpg`_pixelated_$3_circle.png


convert $1 -colorspace gray -resize "$image_size_x"x"$image_size_y"+0+0 +repage -resize "$pixelated_size_x"x"$pixelated_size_y" -scale "$scale_factor"% $target_name

convert $target_name -negate circle_array.gif -virtual-pixel tile -fx u[floor\($t_circle.9999*u\)+1] $target_name2


mv $target_name2 $2

