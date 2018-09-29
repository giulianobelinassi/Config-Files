#!/bin/bash
#
# Script to adjust external screen brightness. 
# Requisites: 
#   1-) The screen must be connected through a digital interface (DVI, HDMI).
#   2-) The screen must support the i2c protocol.
#   3-) The user must be member of the 'i2c' group.
#   4-) The kernel module 'i2c-dev' must be loaded.
#   5-) The packages 'ddcutil' and 'i2c-tools' must be installed.
#
# Current issues:
#   1-) Set brightness requests do not stack.

# Brightness command on LG 22MP58. Use 'ddcutil environment --verbose' to scan
# for capable devices and features that it supports.
BRIGHTNESS_BYTE=0x10 

# i2c bus that the screen is connected. 
SCREEN_BUS=8

get_current_brightness()
{
    ddcutil --bus=$SCREEN_BUS getvcp $BRIGHTNESS_BYTE | sed 's/.*current value = [ ]*\([0-9]*\).*/\1/g'    
}

set_brightness()
{
    ddcutil --bus=$SCREEN_BUS setvcp $BRIGHTNESS_BYTE $1    
}

add_brightness()
{
    local curr_brightness=$(get_current_brightness)
    local new_brightness=$(($curr_brightness+5))

    set_brightness $new_brightness
}

sub_brightness()
{
    local curr_brightness=$(get_current_brightness)
    local new_brightness=$(($curr_brightness-5))

    set_brightness $new_brightness
}

if [ $# -ge 1 ]; then
    if [ $1 == 'add' ]; then
        add_brightness
    elif [ $1 == 'sub' ]; then
        sub_brightness
    fi
else
    echo "Current brighness: $(get_current_brightness)."
fi
