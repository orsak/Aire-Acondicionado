#!/bin/bash
if [[ "$1" == "si" ]];then
	while true
	do
		test=`python /home/pi/proyecto/test.py|cut -d "=" -f 2| cut -d "." -f1`
		if [[ "$test" > "$2" ]]; then
			echo 1 > /sys/class/gpio/gpio17/value
			echo 0 > /sys/class/gpio/gpio26/value
		elif [[ "$test" < "$2" ]]; then
 			echo 0 > /sys/class/gpio/gpio17/value
 			echo 1 > /sys/class/gpio/gpio26/value
 		elif [[ "$test" == "$2" ]]; then
 			echo 0 > /sys/class/gpio/gpio17/value
 			echo 0 > /sys/class/gpio/gpio26/value
 		else
 			break
 		fi
 	done
 else
 	proceso=`ps -aux | grep "root" | grep "bash" | head -n 1| cut -d " " -f 7`
 	sudo kill -9 "$proceso"
 	echo 0 > /sys/class/gpio/gpio26/value
 	echo 0 > /sys/class/gpio/gpio17/value
 fi