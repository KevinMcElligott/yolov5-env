# Requirements for running yolov5-3.1

- Jetson Xavier AGX
- Jetpack version 4.4.1

# Yolov5 version

On the Jetson Xavier (aarch64) it is not possible to use the latest yolov5 due to the required python packages. The latest yolov5 that can satisfy all python requirements for yolov5 is version 3.1. Note that this might change in the near future.

# To create the docker yolov5-env image

```bash
sudo docker-compose build yolov5-env
```

# To run the docker container 

If you want to run the container without shared volume
```bash
sudo docker run -it --rm --runtime nvidia --network host --ipc=host yolov5-env-image:1.0
```

Run docker container with shared volume:

```bash
sudo docker run -it --rm --runtime nvidia --network host --ipc=host -v /mnt/XavierSSD/<FOLDER_NAME>:/usr/src/app/<FOLDER_NAME>  yolov5-env-image:1.0
```
# To delete a container

First you need to exit the docker container by running this command:

```bash
exit
```

To check if the container is removed run command:

```bash
sudo docker container ls -a
```

Removing a container is easy if you know the container id. Delete the container by running command:
```bash
sudo docker container rm <CONTAINER_ID>
```
