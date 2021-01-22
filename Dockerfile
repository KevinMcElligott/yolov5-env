FROM nvcr.io/nvidia/l4t-pytorch:r32.4.4-pth1.6-py3

MAINTAINER kevin@odd.bot

WORKDIR /

COPY requirements.txt requirements.txt
COPY install_opencv.sh install_opencv.sh
COPY download_yolov5.sh download_yolov5.sh

RUN apt-get update &&\
apt-get -y upgrade &&\
./install_opencv.sh &&\
./download_yolov5.sh &&\
pip3 install -r requirements.txt &&\
rm requirements.txt install_opencv.sh download_yolov5.sh

WORKDIR /usr/src/app
