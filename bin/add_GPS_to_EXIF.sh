#simple script to add GPS information to EXIF metadata for all pics in a folder.

dir_im=/home/onat/Desktop/photos/;
cd /home/onat/Desktop/photos/;
mkdir cropped;
convert *.jpg -crop 2444x3508+0+0 +repage ./cropped/img.jpg

#rennes:48.111724, -1.684925
#kadikoy:40.987157, 29.028206
#montsaintmichel: 48.636115, -1.511336
#saumur: 47.262055, -0.081523
#zurich: 47.376736, 8.547700

exiftool "-GPSLatitudeRef=North" "-GPSLongitudeRef=East" "-GPSLatitude=47.376736"  "-GPSLongitude=8.54770" "-CreateDate=2000:01:01 00:00:00" "-DateTimeOriginal=2000:01:01 00:00:00" "-OwnerName=Selim Onat" "-UserComment=Partie au tour des horizons." cropped/img-*
