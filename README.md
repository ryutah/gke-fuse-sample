# FUSE on GKE Sample
Use [gscfuse](https://github.com/GoogleCloudPlatform/gcsfuse/) on GKE example.

## Reference
* [GKEでCloud Storageをマウントしてみる - Toku's Blog](https://www.sce-toku.jp/blog/2016/12/03/k8s-gcsfuse/)

## Enable application credential

```console
# Download service account keyfile as `key.json` and place project root directory

# Set up environment.
export GCS_BUCKET_NAME={MOUNT_GCS_BUCKET_NAME}
export DOCKER_IMAGE_NAME={BUILD_DOCKER_IMAGE_NAME}

# Use service account
export GOOGLE_APPLICATION_CREDENTIALS=/work/src/test/key.json

# Enable mount
mkdir /mnt/sandbox-hara
gcsfuse -o allow_other sandbox-hara /mnt/sandbox-hara
```
