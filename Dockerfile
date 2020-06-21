FROM python:3.8-slim

WORKDIR /app

COPY app requirements.txt docker-entrypoint.sh ./

RUN apt-get update && pip3 install --no-cache-dir -r requirements.txt

EXPOSE 80

ENTRYPOINT bash docker-entrypoint.sh