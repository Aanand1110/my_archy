#!/bin/sh

path="/sys/class/backlight/"

for dir in /sys/class/backlight/*/; do
    # Check if it's a directory
    if [ -d "$dir" ]; then
	path+="$(basename "$dir")"
    fi
#echo $dir
done

#echo $path
max=$(cat $path"/max_brightness")
#echo max=$max
(( ten_per = max / 10 ))
#echo ten persent=$ten_per

current=$(cat $path"/brightness")
#echo current=$current
(( new = $current + $ten_per ))
#echo new=$new

if (( $new > $max )); then
	exit
else
	echo $new |sudo tee $path"/brightness"
fi