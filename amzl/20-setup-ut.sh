#!/usr/bin/env bash
set -eux

pwd
find .

echo "setting up UT99"
aws s3 cp s3://${S3_ARIFACTS_BUCKET}/ut-server-436.tar.gz  .

tar -zxf ut-server-436.tar.gz
pushd ut-server
chmod +x ucc

echo "patching UT99"
aws s3 cp s3://${S3_ARIFACTS_BUCKET}/UTPGPatch451LINUX.tar.tar  .
tar xfj UTPGPatch451LINUX.tar.tar
rm UTPGPatch451LINUX.tar.tar

echo "installing asu addon"
aws s3 cp s3://${S3_ARIFACTS_BUCKET}/asu-0.6.tar.gz .
tar -zxf asu-0.6.tar.gz
rm asu-0.6.tar.gz
chmod +x asu.sh

echo "
I


1



X
" | ./asu.sh

echo "fixing System"
pushd System
ln -s libSDL-1.1.so.0 libSDL-1.2.so.0
chmod +x ucc-bin
popd

echo "unpacking UTPUre"
tar xzvf Patches/UTPure-RC5v-patch.tar.gz
