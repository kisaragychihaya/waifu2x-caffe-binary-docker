
FROM nvidia/cuda:11.4.0-cudnn8-runtime-ubuntu18.04
RUN export DEBIAN_FRONTEND=noninteractive DEBCONF_NONINTERACTIVE_SEEN=true && apt update && apt install -y  libboost-system1.65.1 libboost-filesystem1.65.1 \
libboost-thread1.65.1 libopenblas-base libboost-iostreams1.65.1 libhdf5-100 libprotobuf10 libleveldb1v5 libsnappy1v5 libopencv-contrib3.2  \ 
libgoogle-glog0v5 libgflags2.2&& apt clean 
RUN apt install -y liblmdb0 libatlas3-base && apt clean
ADD https://github.com/kisaragychihaya/waifu2x-caffe-binary-docker/releases/download/0.0.0/waifu2x-caffe.tar.gz /opt/waifu2x-caffe.tar.gz
RUN cd /opt/ && tar xzvf waifu2x-caffe.tar.gz && rm waifu2x-caffe.tar.gz && mkdir libcaffe && \
cp bin/libcaffe*  libcaffe/ &&cd bin && echo /opt/libcaffe/ > /etc/ld.so.conf.d/caffe.conf && ldconfig &&mv waifu2x-caffe /usr/local/bin/waifu2x-caffe
RUN waifu2x-caffe --help
WORKDIR /opt/bin
