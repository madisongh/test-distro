#!/bin/sh
gst-launch-1.0 nvarguscamerasrc ! 'video/x-raw(memory:NVMM),width=1920,height=1080,format=(string)NV12,framerate=(fraction)30/1' ! nvoverlaysink
