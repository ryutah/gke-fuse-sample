#!/bin/sh

docker run \
  -it \
  -p8080:8080 \
  -eGOOGLE_APPLICATION_CREDENTIALS=/tmp/sample/key.json \
  -eGCS_BUCKET_NAME=${GCS_BUCKET_NAME} \
  -v$(pwd):/tmp/sample \
  --rm \
  --privileged \
  ${DOCKER_IMAGE_NAME} \
  /tmp/sample/start.sh
