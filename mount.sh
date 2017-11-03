#!/bin/sh

########
#
# Mount an EFS filesystem
#
# Usage:
#   ./mount.sh
# Examples:
#   -west-1 ./list-efs-filesystems.sh
#   PROFILE=production ./list-efs-filesystems.sh
#   PROFILE=development REGION=us-east-1 ./list-efs-filesystems.sh
########

set -eo pipefail

EFS_FILESYSTEM="${EFS_FILESYSTEM:?EFS_FILESYSTEM environment variable required}"

mount -t nfs -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2 $EFS_FILESYSTEM:/ /efs
