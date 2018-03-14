#!/bin/bash

 #Enter your ip of your device here
declare -a DEVICES=("192.168.2.1" "192.168.2.2" "192.168.2.3" "192.168.2.4" "192.168.2.5" "192.168.2.6")
declare -a OUTPUT=()
for i in ${DEVICES[@]}; do
    # Change dev and eth0 if needed
    ip neigh flush dev eth0 $i
    hping3 -2 -c 10 -p 5353 -i u1 $i -q >/dev/null 2>&1
    sleep 1
    # Only arp specific device, grep for a mac-address
    status=`arp -an $i | awk '{print $4}' | grep "..:..:..:..:..:.."`
    #statusMessage="OFF"
    #A mac will be 17 characters including the ":"
    if [ ${#status} -eq 17 ]; then
        #echo "Phone $i is detected!"
        #statusMessage="ON"
        OUTPUT+=('1')
    else
        #echo "Phone $i is not present"
        #statusMessage="OFF"
        OUTPUT+=('0')
    fi
done
echo ${OUTPUT[@]} `date`
