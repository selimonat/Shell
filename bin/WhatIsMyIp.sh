#!/bin/sh

MyIP=`curl -s http://checkip.dyndns.org | sed 's/[a-zA-Z/<> :]//g'`;
echo $MyIP;
