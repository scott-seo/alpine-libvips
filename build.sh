#!/bin/bash

VIPS_VERSION='8.5.4'

# docker images -q | xargs docker rmi -f

#docker build -t scott-seo/alpine-libvips:latest -t scott-seo/alpine-libvips:$VIPS_VERSION .
docker push scottseo/alpine-libvips:latest
docker push scottseo/alpine-libvips:$VIPS_VERSION

# docker run -i -t pyyoshi/alpine-libvips:latest /bin/sh
