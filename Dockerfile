FROM nvcr.io/nvidia/l4t-tensorflow:r32.5.0-tf2.3-py3

RUN echo "Build our Container based on L4T Tensorflow"
RUN nvcc --version

WORKDIR /app

COPY . ./

# Needed for accessing Jetpack 4.5.1
COPY  /docker-requirements/nvidia-l4t-apt-source.list /etc/apt/sources.list.d/nvidia-l4t-apt-source.list
COPY  /docker-requirements/jetson-ota-public.asc /etc/apt/trusted.gpg.d/jetson-ota-public.asc

RUN apt-get update && \ 
    apt-get install -y git unzip libopencv-python libboost-python-dev libboost-thread-dev && \
    apt-get install -y --no-install-recommends \
    python3-pip \
    python3-dev \
    build-essential \
    zlib1g-dev \
    zip \
    python3-setuptools \
    libjpeg8-dev && \ 
    rm -rf /var/lib/apt/lists/*

RUN pip3 install -U \
    pip \
    setuptools \
    wheel && \
    pip3 install \
    -r requirements.txt \
    && \
    rm -rf ~/.cache/pip

WORKDIR /
RUN git clone https://github.com/IW276/IW276SS21-P15.git && cd IW276SS21-P15 && git checkout master

WORKDIR /IW276SS21-P15/data/pictures/
# MOT20-04
# RUN wget "https://www.dropbox.com/s/ta98ehmt7c4chvu/images_all.zip"
# MOT20-07
RUN wget "https://www.dropbox.com/s/2dfvimao4tt4nqx/images_all.zip"
RUN unzip images_all.zip

WORKDIR ../../

WORKDIR checkpoints/
RUN wget "https://www.dropbox.com/s/zuv2sq9awowvy61/yolov4-416.zip"
RUN unzip yolov4-416.zip

WORKDIR ../
