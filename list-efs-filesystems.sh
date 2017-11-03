#!/bin/sh

########
#
# List all the EFS filesytems of a region
#
# Usage:
#   ./list-efs-filesystem.sh
# Examples:
#   REGION=eu-west-1 ./list-efs-filesystems.sh
#   PROFILE=production ./list-efs-filesystems.sh
#   PROFILE=development REGION=us-east-1 ./list-efs-filesystems.sh
########

set -eo pipefail

PROFILE="${PROFILE}"
REGION="${REGION:-us-east-1}"

aws --profile "$PROFILE" --region "$REGION" efs describe-file-systems --output text --query "FileSystems[*].[FileSystemId,Name]" | awk 'BEGIN { print "ID\tFilesystem URL\tNAME" } { print $1"\t"$1".efs."ENVIRON["REGION"]".amazonaws.com\t"$2 }' | column -ts $'\t'
