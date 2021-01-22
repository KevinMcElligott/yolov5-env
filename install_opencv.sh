#!/bin/bash

OPENCV_VERSION=4.5.0
CUDA_ARCH_BIN=7.2

apt-get -y install --no-install-recommends \
build-essential \
pkg-config \
unzip \
cmake \
cython3 \
g++ \
gcc \
curl \
apt-utils \
gfortran \
hdf5-tools \
python3-dev \
python3-setuptools \
python3-pip \
python-tk \
protobuf-compiler \
openssl \
libprotobuf-dev \
libopencv-dev \
libatlas-base-dev \
libssl-dev \
libcurl4-openssl-dev \
libhdf5-serial-dev \
libxml2-dev \
libxslt1-dev \
libtbb2 \
libtbb-dev \
libavcodec-dev \
libavformat-dev \
libswscale-dev \
libxvidcore-dev \
libavresample-dev \
libtiff-dev \
libjpeg-dev \
libpng-dev \
libgtk-3-dev \
libcanberra-gtk-module \
libcanberra-gtk3-module \
libv4l-dev \
libdc1394-22-dev \
libgl1-mesa-dri \
libfreetype6-dev \
mesa-va-drivers \
mesa-vdpau-drivers

curl -L https://github.com/opencv/opencv/archive/${OPENCV_VERSION}.zip -o opencv-${OPENCV_VERSION}.zip
curl -L https://github.com/opencv/opencv_contrib/archive/${OPENCV_VERSION}.zip -o opencv_contrib-${OPENCV_VERSION}.zip
unzip opencv-${OPENCV_VERSION}.zip
unzip opencv_contrib-${OPENCV_VERSION}.zip
rm opencv-${OPENCV_VERSION}.zip opencv_contrib-${OPENCV_VERSION}.zip

cd opencv-${OPENCV_VERSION}
mkdir build
cd build

cmake \
-D CMAKE_BUILD_TYPE=RELEASE \
-D CMAKE_INSTALL_PREFIX=/usr/local \
-D WITH_CUDA=OFF \
-D WITH_CUBLAS=OFF \
-D WITH_LIBV4L=ON \
-D BUILD_opencv_python3=ON \
-D BUILD_opencv_python2=OFF \
-D BUILD_opencv_java=OFF \
-D WITH_GSTREAMER=OFF \
-D WITH_GTK=OFF \
-D BUILD_TESTS=OFF \
-D BUILD_PERF_TESTS=OFF \
-D BUILD_EXAMPLES=OFF \
-D OPENCV_ENABLE_NONFREE=ON \
-D OPENCV_EXTRA_MODULES_PATH=~/opencv_contrib-${OPENCV_VERSION}/modules \
..

make package -j$(nproc)
make install
ldconfig


