#!/bin/bash

apk update && apk upgrade

set -xe \
	&& apk add --no-cache --virtual .build-deps \
		icu-dev \
		openssh \
		zlib-dev \
		git \
		icu-libs \
		g++ \
		make \
		autoconf \
		libxslt-dev \
 		wget \
		ca-certificates \
		curl \
		apache-ant
