#!/bin/bash

cd flink-reactive-app
mvn clean install
cd ..

docker build -t vjammi/flink:1.14.3-reactive-app .
docker push vjammi/flink:1.14.3-reactive-app
