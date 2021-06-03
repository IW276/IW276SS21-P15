# IW276SS21P15 Person Tracking

The goal of the project is to create a model that is able to detect and track people throughout consecutive frames. 
Detection is visualised through bounding boxes and tracking is shown by unique ids for every person.

<p align="center">
   <img src="detektor_tracker.jpg">
</p>

> This work was done by Atanas Atanasov, Nikolay Dimitrov, Stefan Hristov during the IW276 Autonome Systeme Labor at the Karlsruhe University of Applied Sciences (Hochschule Karlruhe - Technik und Wirtschaft) in SS2021.

## Table of Contents

* [Requirements](#requirements)
* [Running](#running)
* [Docker](#docker)
* [Acknowledgments](#acknowledgments)
* [Contact](#contact)

## Requirements
* Python 3.6 (or above)
* OpenCV 4.1 (or above)
* Jetson Nano
* Jetpack 4.5
* Tensorflow 2.3 (or above)



## Running

Open the terminal and navigate to the project folder. Then execute the following commands:

```
sh build-docker-image.sh

sudo docker run -it as15_my_img

sh run-tracker.sh
``` 
If you want a different configuration you can choose from the flags bellow. 
In order to use the flags, you should add or remove them in the `run-tracker.sh` file.  

```
 --video: path to input video (use 0 for webcam)
    (default: './data/video/test.mp4')
  --output: path to output video (remember to set right codec for given format. e.g. XVID for .avi)
    (default: None)
  --output_format: codec used in VideoWriter when saving video to file
    (default: 'XVID)
  --[no]tiny: yolov4 or yolov4-tiny
    (default: 'false')
  --weights: path to weights file
    (default: './checkpoints/yolov4-416')
  --framework: what framework to use (tf, trt, tflite)
    (default: tf)
  --model: yolov3 or yolov4
    (default: yolov4)
  --size: resize images to
    (default: 416)
  --iou: iou threshold
    (default: 0.45)
  --score: confidence threshold
    (default: 0.50)
  --dont_show: dont show video output
    (default: False)
  --info: print detailed info about tracked objects
    (default: False)
  --count: count objects being tracked on screen
    (default: false)
  --pictures_path: path to input pictures folder
    (default: /data/pictures/)
  --is_output_pictures: the output is stored as pictures
    (default: false)
  --output_pictures: path to output pictures folder
    (default: /outputs/)

```
## Docker

### How to export the images to the host

When the detection and tracking is executed, the images are saved in the docker container. To save the images
from the container to the host directory the following steps should be followed.
The container id should be found and the commands bellow should be executed.

``` 
// Find the container id (container name - my_container_as_15)
sudo docker ps -a 

// Copy the images from the docker container to the host directory
sudo docker cp {CONTAINERID}:/IW276SS21-P15/outputs /home/{USER}
```

## Acknowledgments

This repo is based on
  - [YOLOv4 Deeosort](https://github.com/theAIGuysCode/yolov4-deepsort)
  - [MOT20 Challenge](https://motchallenge.net/data/MOT20/)
  - [IW276WS20-P10](https://github.com/IW276/IW276WS20-P10)
  - [darknet](https://github.com/AlexeyAB/darknet)



Thanks to the original authors for their work!

## Contact
Please email `mickael.cormier AT iosb.fraunhofer.de` for further questions.
