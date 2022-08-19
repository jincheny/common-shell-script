#! /bin/bash -ex
# 压缩/输出目录
ZIP_DIR="/data/app/FlyFishComponents/components"
OUTPUT_DIR="/data/app/ffCompZip"

if [ ! -d "$OUTPUT_DIR" ]; then
    mkdir -p $OUTPUT_DIR
fi

if [ ! -x "$(command -v zip)" ]; then
    echo 'Install zip'
    yum install zip unzip -y
fi

# zip
list=$(cd $ZIP_DIR && ls -1)
for var in $list; do
    echo "Start compression $var"
    zip -r $OUTPUT_DIR/$var.zip $ZIP_DIR/$var
done