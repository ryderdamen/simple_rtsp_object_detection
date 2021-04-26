import os
from camera_processor.camera_processor import CameraProcessor


def callback_object_detected(detection):
    """This function is executed when an object is detected"""
    detection.identify()


def get_stream_uri():
    """Gets the stream URI from an environment variable"""
    try:
        stream_uri = os.environ.get('STREAM_URI')
        print('Stream URI: {}'.format(stream_uri))
        return stream_uri
    except KeyError:
        print('STREAM_URI not defined')
        exit(1)


def main():
    """Run the container"""
    stream_uri = get_stream_uri()
    processor = CameraProcessor(stream_uri, 'default camera')
    try:
        while True:
            for detection in processor.get_detections():
                callback_object_detected(detection)
    except KeyboardInterrupt:
        print('Exiting')


if __name__ == '__main__':
    main()
