#!/bin/bash
docker buildx build --file ./src/Jackett.Server/Dockerfile --platform linux/amd64 -t abagonhishead/jackett-noauth:latest --push .