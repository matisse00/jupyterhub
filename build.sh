#!/bin/sh

docker build -t jupyterhub .
docker stop jupyter
docker rm jupyter
docker run -d -v $PWD/notebooks:/home/admin -p 5000:8000 --name jupyter jupyterhub
