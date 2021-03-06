#/bin/bash
pwd

docker login --username=$DOCKER_USER --password=$DOCKER_PASS

#docker tag nodejs-webapp:latest munisanath/nodejs-webapp

#docker push munisanath/nodejs-webapp

#PARENT_DIR=$(basename "${PWD%/*}")
#CURRENT_DIR="${PWD##*/}"
IMAGE_NAME="nodejs-webapp"
#TRAVIS_BUILD_NUMBER="newversion"
#BUILD_DATE="date -u +%Y-%m-%dT%H:%M:%SZ"
#BUILD_DATE="$(date)"

REGISTRY="munisanath"

docker build -t ${REGISTRY}/${IMAGE_NAME}:${TRAVIS_BUILD_NUMBER} .
docker tag ${REGISTRY}/${IMAGE_NAME}:${TRAVIS_BUILD_NUMBER} ${REGISTRY}/${IMAGE_NAME}:latest
docker push ${REGISTRY}/${IMAGE_NAME}
docker tag ${REGISTRY}/${IMAGE_NAME}:latest ${REGISTRY}/${IMAGE_NAME}:${TRAVIS_BUILD_NUMBER}
docker push ${REGISTRY}/${IMAGE_NAME}

echo script
function run_commands () {
	echo "login into Docker hub"
	# rm -rf nodejs-webapp
	# mkdir -p volume
	# git clone -b master https://github.com/munisanath/nodejs-webapp.git
	# pwd
	# (cd nodejs-webapp/deployment && docker build -t nodejs-webapp .)
	# pwd
	# (cd nodejs-webapp/deployment && docker-compose up -d)

	docker pull munisanath/nodejs-webapp
	docker stop deployment_nodejsapp_1
	#docker rm deployment_nodejsapp_1
	docker run -t --name deployment_nodejsapp_1 -p 3000:3000 -d munisanath/nodejs-webapp
	
}
ssh -i ./deploy_key -o StrictHostKeyChecking=no azureadmin@itasset.southindia.cloudapp.azure.com "$(typeset -f run_commands); run_commands"
#sshpass -p "password" ssh -o StrictHostKeyChecking=no azureadmin@itasset.southindia.cloudapp.azure.com "$(typeset -f run_commands); run_commands"
