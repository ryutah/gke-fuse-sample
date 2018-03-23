FROM golang:1.9-alpine

ARG GCLOUD_SDK_VERSION=180.0.0

ENV GOPATH=/work
ENV PATH=${GOPATH}/bin:/google-cloud-sdk/bin:/google-cloud-sdk/platform/google_appengine:$PATH

RUN apk update \
 && apk add ca-certificates wget git make python2=2.7.13-r1 build-base fuse-dev curl-dev fuse curl \
 && update-ca-certificates

WORKDIR /

RUN wget https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-${GCLOUD_SDK_VERSION}-linux-x86_64.tar.gz \
 && tar xvf google-cloud-sdk-${GCLOUD_SDK_VERSION}-linux-x86_64.tar.gz \
 && google-cloud-sdk/install.sh --quiet \
 && rm google-cloud-sdk-${GCLOUD_SDK_VERSION}-linux-x86_64.tar.gz

ADD https://github.com/golang/go/raw/master/lib/time/zoneinfo.zip /google-cloud-sdk/platform/google_appengine/goroot-1.8/lib/time/zoneinfo.zip

RUN go get -u github.com/googlecloudplatform/gcsfuse

WORKDIR /work

COPY ./ /work/src/sample

RUN go install sample
