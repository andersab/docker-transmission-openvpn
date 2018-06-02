#!/bin/sh

#To make it work after a nas restart, create an automated task in your synology web interface : 
#  -> go to **Settings Panel > Task Scheduler ** 
#  -> create a new task that run /volume1/foldername/syn-startup.sh as root (select 'root' in 'user' selectbox). 
# This task will start module that permit the container to run, 
# you can make a task that run on startup. These kind of task doesn't work on my nas so I just made a task that run every minute.

./syn-TUN.sh

docker start transmission
