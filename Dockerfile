FROM alpine:3.4
MAINTAINER d@practicalmagic.co.za

RUN apk add --update \
    git \
    python \
    py-pip \
  && pip install pygments \
  && rm -rf /var/cache/apk/*

ENV HUGO_VERSION 0.17
ENV HUGO_BINARY hugo_${HUGO_VERSION}_linux_amd64
ENV HUGO_RESOURCE hugo_${HUGO_VERSION}_Linux-64bit

ADD https://github.com/spf13/hugo/releases/download/v${HUGO_VERSION}/${HUGO_RESOURCE}.tar.gz /tmp/

RUN  tar -xvzf /tmp/${HUGO_RESOURCE}.tar.gz -C /tmp/ \
	&& mv /tmp/${HUGO_BINARY}/${HUGO_BINARY} /usr/bin/hugo && rm -rf /tmp/hugo*

# The container will listen on port 80 using the TCP protocol.
EXPOSE 80
