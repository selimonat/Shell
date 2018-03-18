#!/bin/sh



last_file=`find ~/ -maxdepth 1 -printf "%T+ %p\n" | grep JPG | head -n 1 | rev | cut -d" " -f 1 | rev` 
date_now=`date`
mail_text="This is a visual taken from your GoPro camera at ${date_now}."
(echo ${mail_text}; uuencode ${last_file} visual.jpg) | mail -s "Visual from your home" onatselim@gmail.com
