# Use a base image which provides as many of your dependencies as possible
FROM benchbot/submission:base

RUN pip install matplotlib opencv-python  

# ------------------------------------------------------------------------------
# Tutorial Part III: Using Votenet for Object Detection

# RUN pip install 'torch<1.5.0' torchvision tensorflow matplotlib opencv-python plyfile 'trimesh>=2.35.39,<2.35.40' 'networkx>=2.2,<2.3'
RUN pip install tensorflow==2.4.1 
RUN pip install pip install torch==1.8.1+cu111 torchvision==0.9.1+cu111 -f https://download.pytorch.org/whl/torch_stable.html    
RUN pip install plyfile trimesh networkx

RUN git clone https://github.com/cheneeheng/votenet.git

# TAKEN from https://github.com/facebookresearch/detectron2/blob/master/docker/Dockerfile
# set FORCE_CUDA because during `docker build` cuda is not accessible
ENV FORCE_CUDA="1"
# This will by default build detectron2 for all common cuda architectures and take a lot more time,
# because inside `docker build`, there is no way to tell which architecture will be used.
ARG TORCH_CUDA_ARCH_LIST="Kepler;Kepler+Tesla;Maxwell;Maxwell+Tegra;Pascal;Volta;Turing"
ENV TORCH_CUDA_ARCH_LIST="${TORCH_CUDA_ARCH_LIST}"

# WORKDIR votenet/pointnet2
# RUN sudo python3 setup.py install
RUN cd votenet/pointnet2 && mkdir pointnet2 && pip install --user -e .

RUN sudo apt-get install -y unzip
RUN cd votenet && wget "https://drive.google.com/uc?export=download&id=1oem0w5y5pjo2whBhAqTtuaYuyBu1OG8l" \
	-O demo_files.zip && unzip demo_files.zip && rm demo_files.zip

# ------------------------------------------------------------------------------  
# Detectron2
RUN pip install pyyaml==5.1
RUN pip install detectron2 -f https://dl.fbaipublicfiles.com/detectron2/wheels/cu111/torch1.8/index.html
