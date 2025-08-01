# How to build the Multi-Architecture images

## Method 1:
1. Build an image for each architecture
   docker build -t remoteuser/ubuntu:amd64 .
   docker build -t remoteuser/ubuntu:arm64 .

2. Push all images to docker hub repository
   sudo docker push remoteuser/ubuntu:amd64
   sudo docker push remoteuser/ubuntu:arm64

3. Create a multi-architecture image
   sudo docker manifest create remoteuser/ubuntu:latest remoteuser/ubuntu:amd64 remoteuser/ubuntu:arm64

4. Push the multi-architecture image
   sudo docker manifest push remoteuser/ubuntu:latest

5. The image is now ready to be pulled regardless of architecture
   docker pull remoteuser/ubuntu:latest

6. Login to the Ubuntu shell
   docker run -it remoteuser/ubuntu:latest bash

## Method 2: With Buildx tool
docker buildx build --push \
                    --platform linux/amd64,linux/arm64 \
                    --tag remoteuser/ubuntu:latest
