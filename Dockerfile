FROM nvidia/cuda:11.7.0-cudnn8-runtime-ubuntu20.04

RUN apt-get update -y && apt-get install -y --no-install-recommends build-essential \
                       ca-certificates \
                       wget \
                       curl \
                       unzip \
                       ssh \
                       git \
                       vim \
                       jq

ENV DEBIAN_FRONTEND="noninteractive" TZ="Europe/London"
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8
ENV TOKENIZERS_PARALLELISM="true"
ENV WANDB_PROJECT=minimal-text-diffusion

RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt-get install -y python3.9-dev python3-pip python3-setuptools python3-mpi4py
RUN apt-get clean
RUN ln -s /usr/bin/python3.9 /usr/bin/python

RUN python -m pip install --upgrade pip

RUN pip install torch==1.13.1+cu117 torchvision==0.14.1+cu117 torchaudio==0.13.1 --extra-index-url https://download.pytorch.org/whl/cu117

COPY requirements.txt .
RUN pip install -r requirements.txt

RUN python -m spacy download en

WORKDIR /minimal-text-diffusion
COPY . /minimal-text-diffusion

RUN pip install numpy==1.23.3
RUN pip install --ignore-installed mpi4py==3.1.4

RUN pip cache purge 
