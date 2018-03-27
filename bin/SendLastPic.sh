#!/bin/sh

#Sends an email with the latest created file in a folder.
#Argument 1 is the path to folder where jpg file is located. Must have jpg as extension.
#Argument 2 contains additional text to be sent.
#Argument 3 is the subject of the email.
#Argument 4 must be a valid email address.

echo Searching for .jpg file in $1
last_file=`find $1 -maxdepth 1 -printf "%T+ %p\n" | grep jpg | sort -r | head -n 1 | rev | cut -d" " -f 1 | rev` 
echo Found file $last_file
date_now=`date`
mail_text="The following message has been sent to you at ${date_now}:\n"
mail_text="${mail_text} $2"
echo Sending email to $4
(echo ${mail_text}; uuencode ${last_file} ${last_file}) | mailx -s "${3}" ${4}

