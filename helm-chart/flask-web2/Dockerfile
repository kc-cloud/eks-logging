FROM ubuntu:latest
RUN apt-get update -y && \
    apt-get install -y python3-pip python3-dev
WORKDIR /app
RUN pip3 install Flask
COPY . /app
ENTRYPOINT [ "python3" ]
CMD [ "app.py" ]
