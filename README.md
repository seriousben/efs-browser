# efs-browser

[![Docker Automated build](https://img.shields.io/docker/automated/seriousben/efs-browser.svg)](https://hub.docker.com/r/seriousben/efs-browser)

## Usage

`docker run --cap-add=SYS_ADMIN -it -e EFS_FILESYSTEM="FS-XXXXX.efs.REGION.amazonaws.com" seriousben/efs-browser`

Get the right `EFS_FILESYSTEM` using `./list-efs-filesystems.sh`.
