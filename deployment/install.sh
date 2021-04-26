#!/bin/bash
# install.sh

cd ../

SAMPLE_MODEL=src/object_detection/models/yolov3-tiny.weights

if [[ -f "$SAMPLE_MODEL" ]]; then
    echo "Skipping Downloading Weights"
else
    echo "Downloading pretrained models"
    wget https://pjreddie.com/media/files/yolov3-tiny.weights
    mv yolov3-tiny.weights src/object_detection/models/
fi

docker build -t $IMAGE_NAME .
