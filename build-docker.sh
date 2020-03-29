#!/usr/bin/env bash
set -eux

mkdir -p docker-target

if [ false ]; then
    echo "setting up UT99"
    aws s3 cp s3://${S3_ARTIFACTS_BUCKET}/ut-server-436.tar.gz  docker-target/
    aws s3 cp s3://${S3_ARTIFACTS_BUCKET}/UTPGPatch451LINUX.tar.tar  docker-target/
    aws s3 cp s3://${S3_ARTIFACTS_BUCKET}/asu-0.6.tar.gz docker-target/
fi

docker build -t phasebash/ut99-server -f Dockerfile-Debian .