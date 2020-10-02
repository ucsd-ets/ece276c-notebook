FROM ucsdets/datahub-base-notebook:2020.2-stable

USER root

RUN apt-get update --fix-missing && \
    apt-get install -y \
        libglu1-mesa-dev \
        libgl1-mesa-dev \
        libosmesa6-dev \
        xvfb \
        ffmpeg \
        patchelf \
        libglfw3 \
        libglfw3-dev \
        cmake \
        zlib1g \
        zlib1g-dev \
        swig \
        libgl1-mesa-glx \
        apt-utils \
        build-essential \
        software-properties-common \
        g++  \
        git  \
        curl  \
        cmake \
        cython3  \
        unzip \
        xvfb \
        libopenblas-base  \
        xorg-dev \
        dpkg \
        xvfb \
        xserver-xephyr \
        gnupg \
        pbuilder \
        ubuntu-dev-tools \
        apt-file \
        keyboard-configuration \
     && apt-get clean \
     && rm -rf /var/lib/apt/lists/*

COPY gym.yaml /usr/share/datahub/kernels/gym.yml

RUN conda env create --file /usr/share/datahub/kernels/gym.yml && \
    conda run -n gym /bin/bash -c "pip install torch==1.5.0+cu101 torchvision==0.6.0+cu101 pytorch-ignite -f https://download.pytorch.org/whl/torch_stable.html; ipython kernel install --name=gym"

ENV DISPLAY=':99.0'

COPY run_jupyter.sh /
RUN chmod +x /run_jupyter.sh

USER $NB_USER