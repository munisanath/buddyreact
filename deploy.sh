#/bin/bash
#ssh-keygen -t  rsa -b 4096 -C 'nodejs-webapp@travis-ci.org' -f ./deploy_rsa

#ssh-copy-id -i deploy_rsa.pub azureadmin@104.211.299.97
function run_commands () {
	echo "login into github"
	git clone https://github.com/munisanath/nodejs-webapp.git
	cd nodejs-webapp
	docker build -t nodejs-webapp deployment/.
	cd nodejs-webapp/deployment
	docker-compose up -d
}
sshpass -p "Suventure@2012$" ssh azureadmin@itasset.southindia.cloudapp.azure.com "$(typeset -f run_commands); run_commands"
