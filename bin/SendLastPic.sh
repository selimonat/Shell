#!/bin/sh

#Argument must be a valid email address.


last_file=`find $1 -maxdepth 1 -printf "%T+ %p\n" | grep JPG | head -n 1 | rev | cut -d" " -f 1 | rev` 
date_now=`date`
mail_text="This is a visual taken from your GoPro camera at ${date_now}."
echo Sending email to $2
(echo ${mail_text}; uuencode ${last_file} visual.jpg) | mail -s "Visual from your home" $2
