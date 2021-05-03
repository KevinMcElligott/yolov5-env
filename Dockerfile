FROM nvcr.io/nvidia/l4t-pytorch:r32.5.0-pth1.7-py3

MAINTAINER kevin@odd.bot

WORKDIR /

COPY requirements.txt requirements.txt
COPY install_opencv.sh install_opencv.sh
COPY download_yolov5.sh download_yolov5.sh

RUN apt-get update &&\
apt-get -y upgrade

RUN ./install_opencv.sh


RUN ./download_yolov5.sh &&\
pip3 install -r requirements.txt


#rm requirements.txt install_opencv.sh download_yolov5.sh

WORKDIR /usr/src/app
