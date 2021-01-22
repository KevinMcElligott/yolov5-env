#!/bin/bash

YOLOV5_VERSION=3.1

mkdir -p /usr/src/app
cd /usr/src/app
curl -L https://github.com/ultralytics/yolov5/archive/v${YOLOV5_VERSION}.zip -o yolov5-${YOLOV5_VERSION}.zip
unzip yolov5-${YOLOV5_VERSION}.zip
rm yolov5-${YOLOV5_VERSION}.zip
cd 
