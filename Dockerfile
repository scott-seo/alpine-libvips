FROM alpine:edge

WORKDIR /tmp
ENV LIBVIPS_VERSION_MAJOR 8
ENV LIBVIPS_VERSION_MINOR 3
ENV LIBVIPS_VERSION_PATCH 1

RUN apk add --no-cache --virtual .build-deps \
  gcc g++ make libc-dev \
  curl \
  automake \
  libtool \
  tar \
  gettext && \

  apk add --no-cache --virtual .libdev-deps \
  glib-dev \
  libpng-dev \
  libwebp-dev \
  libexif-dev \
  libxml2-dev \
  libjpeg-turbo-dev && \

  apk add --no-cache --virtual .run-deps \
  glib \
  libpng \
  libwebp \
  libexif \
  libxml2 \
  libjpeg-turbo && \

  LIBVIPS_VERSION=${LIBVIPS_VERSION_MAJOR}.${LIBVIPS_VERSION_MINOR}.${LIBVIPS_VERSION_PATCH} && \
  curl -O http://www.vips.ecs.soton.ac.uk/supported/${LIBVIPS_VERSION_MAJOR}.${LIBVIPS_VERSION_MINOR}/vips-${LIBVIPS_VERSION}.tar.gz && \
  tar zvxf vips-${LIBVIPS_VERSION}.tar.gz && \
  cd vips-${LIBVIPS_VERSION} && \
  ./configure --without-python --without-gsf && \
  make && \
  make install && \
  rm -rf /tmp/vips-* && \

  apk del .build-deps && \
  apk del .libdev-deps && \
  rm -rf /var/cache/apk/* && \
  rm -rf /tmp/vips-*

ENV CPATH /usr/local/include
ENV LIBRARY_PATH /usr/local/lib