#/bin/bash
pwd
docker build -t nodejs-webapp:latest .

docker login --username=$DOCKER_USER --password=$DOCKER_PASS

docker tag nodejs-webapp:latest munisanath/nodejs-webapp

docker push munisanath/nodejs-webapp

echo script
function run_commands () {
	echo "login into github"
	rm -rf nodejs-webapp
	mkdir -p volume
	git clone -b master https://github.com/munisanath/nodejs-webapp.git
	pwd
	(cd nodejs-webapp && docker build -t nodejs-webapp .)
	pwd
	(cd nodejs-webapp/deployment && docker-compose up -d)
	
}
sshpass -p "Suventure@2012$" ssh -o StrictHostKeyChecking=no azureadmin@itasset.southindia.cloudapp.azure.com "$(typeset -f run_commands); run_commands"