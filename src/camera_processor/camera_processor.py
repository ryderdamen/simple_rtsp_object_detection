import cv2
from object_detection.object_detector import ObjectDetector


detector = ObjectDetector()


class CameraProcessor():
    """Class for processing input from camera"""

    def __init__(self, stream_uri, name='Undefined Camera'):
        self.stream_uri = stream_uri
        self.name = name
        self.client = cv2.VideoCapture(stream_uri)

    def get_still(self):
        """Returns a still from the camera"""
        _, frame = self.client.read()
        return frame
    
    def get_detections(self):
        """Returns a list of detections visible in the camera"""
        frame = self.get_still()
        return detector.process_frame(frame, False)
