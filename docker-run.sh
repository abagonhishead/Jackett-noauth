#!/usr/bin/bash
docker container rm jackett-noauth --force

docker build -f ./src/Jackett.Server/Dockerfile ./ -t jackett-noauth:dev

docker run --name jackett-noauth --rm -p 9117:9117 jackett-noauth:dev