#!/bin/bash -x
### Build a 32bit image for installing nsenter and docker-enter.
### Based on: https://github.com/jpetazzo/nsenter

### go to the script directory
cd $(dirname $0)

### get a copy of https://github.com/jpetazzo/nsenter
git clone https://github.com/jpetazzo/nsenter

### replace the base image on Dockerfile
sed -i nsenter/Dockerfile -e "/^FROM/ c FROM 32bit/debian:jessie"

### build the image
docker build -t 32bit/nsenter nsenter/

### push image to Docker Hub
docker push 32bit/nsenter

### cleanup
rm -rf nsenter/
