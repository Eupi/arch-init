#!/bin/bash

# Here is a method that will swap between mode :
#
#    both monitors in best resolution
#    external only
#    internal only
#    both in clone mode
#
# First execute the command: 'xrandr'
# in a shell to check the names of your plugged in monitors.
# In my case they are eDP-1 for the internal and DP-3 for the external.


EXTERNAL_OUTPUT="DP-3"
INTERNAL_OUTPUT="eDP-1"

# if we don't have a file, start at zero
if [ ! -f "/tmp/monitor_mode.dat" ] ; then
  monitor_mode="all"

# otherwise read the value from the file
else
  monitor_mode=`cat /tmp/monitor_mode.dat`
fi

if [ $monitor_mode = "all" ]; then
        monitor_mode="EXTERNAL"
        xrandr --output $INTERNAL_OUTPUT --off --output $EXTERNAL_OUTPUT --auto
elif [ $monitor_mode = "EXTERNAL" ]; then
        monitor_mode="INTERNAL"
        xrandr --output $INTERNAL_OUTPUT --auto --output $EXTERNAL_OUTPUT --off
elif [ $monitor_mode = "INTERNAL" ]; then
        monitor_mode="CLONES"
        xrandr --output $INTERNAL_OUTPUT --auto --output $EXTERNAL_OUTPUT --auto --same-as $INTERNAL_OUTPUT
else
        monitor_mode="all"
        xrandr --output $INTERNAL_OUTPUT --auto --output $EXTERNAL_OUTPUT --auto --left-of $INTERNAL_OUTPUT
fi
echo "${monitor_mode}" > /tmp/monitor_mode.dat


# then add this command to i3 to bind the toggle
# bindsym $mod+Shift+s exec --no-startup-id $HOME/.config/i3/scripts/toggle_monitor.sh
