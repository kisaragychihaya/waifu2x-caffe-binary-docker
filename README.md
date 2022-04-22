# waifu2x-caffe-binary-docker
To Avoid Compile the elephant

### Setup NVIDIA-Docker
see [here](https://github.com/NVIDIA/nvidia-docker)

### Build Docker
```
git clone https://github.com/kisaragychihaya/waifu2x-caffe-binary-docker
cd waifu2x-caffe-binary-docker
docker build -t <YOUR_TAG>   .
```
or if you want build it,you can pull it from docker
```
docker pull kiana423/waifu2x-caffe
```

### Run 
```
cd <YOUR_IMAGE_DIR>
docker run -it --gpus all -v $(pwd):/opt/image waifu2x:latest /usr/local/bin/waifu2x-caffe  -i /opt/image/input.jpg -o /opt/image/out.jpg <OTHER-ARGS>
```
