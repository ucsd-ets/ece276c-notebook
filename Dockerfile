FROM ucsdets/datahub-base-notebook:2020.2.9

USER root

RUN apt-get install -y \
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
    libgl1-mesa-glx

COPY gym.yaml /usr/share/datahub/kernels/gym.yml

RUN conda env create --file /usr/share/datahub/kernels/gym.yml && \
    conda run -n gym /bin/bash -c "pip install torch==1.5.0+cu101 torchvision==0.6.0+cu101 pytorch-ignite -f https://download.pytorch.org/whl/torch_stable.html; ipython kernel install --name=gym"

USER $NB_USER