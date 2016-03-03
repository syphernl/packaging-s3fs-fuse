#!/bin/bash
source vars.sh

echo "Cleanup old.."
rm *.deb

echo "Building package..."

cd s3fs-fuse
PKG_REVISION=$(git rev-parse --short HEAD)
./autogen.sh
./configure
make

rm "$PWD/dist" -rf
mkdir "dist"

make install DESTDIR="$PWD/dist"

cd ../dist

fpm -s dir -t deb \
--url "https://github.com/s3fs-fuse/s3fs-fuse" \
--description " FUSE-based file system backed by Amazon S3 ." \
--license "GPL" \
--maintainer "$PKG_MAINTAINER" \
--vendor "$PKG_VENDOR" \
--iteration "$PKG_REVISION" \
-d fuse \
-d libfuse2 \
-a amd64 \
-n s3fs usr

mv *.deb ../packages
