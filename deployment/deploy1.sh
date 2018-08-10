#/bin/bash

docker build -t nodejs-webapp:latest .

docker login --username=$DOCKER_USER --password=$DOCKER_PASS

docker tag nodejs-webapp:latest munisanath/nodejs-webapp

docker push munisanath/nodejs-webapp