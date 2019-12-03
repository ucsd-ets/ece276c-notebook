# 1) choose base container
# generally use the most recent tag

# data science notebook
# https://hub.docker.com/repository/docker/ucsdets/datascience-notebook/tags
#ARG BASE_CONTAINER=ucsdets/datascience-notebook:2019.4.7

# scipy/machine learning (tensorflow)
# https://hub.docker.com/repository/docker/ucsdets/scipy-ml-notebook/tags
ARG BASE_CONTAINER=ucsdets/scipy-ml-notebook:2019.4.6

FROM $BASE_CONTAINER

LABEL maintainer="UC San Diego ITS/ETS <ets-consult@ucsd.edu>"

# 2) change to root to install packages
USER root

# 3) install packages
RUN apt-get update && \
  apt-get install -y libgl1-mesa-dev libgl1-mesa-glx libglew-dev \
    libosmesa6-dev software-properties-common net-tools \
    virtualenv xpra xserver-xorg-dev libglfw3-dev patchelf \
    libplib-dev libopenal-dev libalut-dev

# 4) change back to notebook user
USER $NB_UID
