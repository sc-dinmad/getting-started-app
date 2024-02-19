FROM ubuntu:latest

LABEL version = "1.0"

RUN mkdir /app
ADD . /app

WORKDIR /app

EXPOSE 5000
