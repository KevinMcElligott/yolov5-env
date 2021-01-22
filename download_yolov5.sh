#!/bin/bash

YOLOV5_VERSION=3.1

mkdir -p /usr/src/app
curl -L https://github.com/ultralytics/yolov5/archive/v${YOLOV5_VERSION}.zip -o /usr/src/app/yolov5-${YOLOV5_VERSION}.zip
unzip /usr/src/app/yolov5-${YOLOV5_VERSION}.zip
rm /usr/src/app/yolov5-${YOLOV5_VERSION}.zip

