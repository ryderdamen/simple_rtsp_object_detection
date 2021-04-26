FROM python:3.9
WORKDIR /code
RUN apt-get clean && apt-get update && apt-get install -y \
    ffmpeg \
    libsm6 \
    libxext6
COPY src/requirements.txt /code/
RUN pip install -r requirements.txt
COPY ./src/ /code/
ENV PYTHONUNBUFFERED=1
ENTRYPOINT [ "python" ]
CMD [ "app.py" ]
