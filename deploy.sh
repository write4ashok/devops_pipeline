#!/bin/bash

docker stop devopsapp 2>/dev/null || true
docker rm devopsapp 2>/dev/null || true

docker pull dockerfile:latest

docker run -d \
  --name devopsapp \
  -p 80:5000 \
  dockerfile:latest

