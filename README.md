# Simple RTSP Object Detector
This project uses the YOLOv3-tiny pretrained model to identify objects from a RTSP stream using CPU-only inference. It's designed to run in a docker container for portibility.


## Installation
To install, clone the respository and run the install command:
```bash
make install
```

It will take care of building the docker container, and downloading the yolov3-tiny model if you don't already have it downloaded.

Next, create a settings.env file, and populate it with your stream URI
```bash
touch settings.env
export STREAM_URI=rtsp://username:password@stream_ip_address/stream_endpoint
echo "STREAM_URI=$STREAM_URI" >> settings.env
```

## Running
To run locally, use the following command:
```bash
make run
```


## Environment Variables
Environment variables for configuring things

```bash

# The URI to the stream
export STREAM_URI=rtsp://username:password@stream_ip_address/stream_endpoint

# FPS_LIMIT - limit the number of frames being processed
export FPS_LIMIT=10

# Display the frames per second in stdout
export DISPLAY_FPS=1

# Set the confidence threshold for detection reporting at 80%
export CONFIDENCE_THRESHOLD=0.8
```
