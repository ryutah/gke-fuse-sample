#!/bin/sh -ex

if [ -z $GCS_BUCKET_NAME ]; then
  echo "Empty GCS_BUCKET_NAME..." >&2
  exit 1
fi

mkdir -p /mnt/gcs/$GCS_BUCKET_NAME

gcsfuse -o allow_other $GCS_BUCKET_NAME /mnt/gcs/$GCS_BUCKET_NAME

sample
