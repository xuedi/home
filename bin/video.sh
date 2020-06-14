#!/bin/bash

# make sure module is set up the right way
sudo modprobe -r v4l2loopback
sudo modprobe v4l2loopback devices=1 video_nr=10 card_label="OBS Cam" exclusive_caps=1

# start studio
obs
