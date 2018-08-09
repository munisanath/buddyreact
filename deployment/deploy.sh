#/bin/bash
#ssh-keygen -t  rsa -b 4096 -C 'nodejs-webapp@travis-ci.org' -f ./deploy_rsa

#ssh-copy-id -i deploy_rsa.pub azureadmin@104.211.299.97
echo script
function run_commands () {
	echo "login into github"
	pwd
	rm -rf nodejs-webapp
	mkdir -p volume
	#directory check
	# function die() {
	# echo "$@" 1>&2
	# exit 1
	# }
	# pwd=`pwd`
	# folder="${pwd}/volume"

	# if [[ ! -d "$folder" ]] && [[ ! -f "$folder" ]]; then
	# 	mkdir -p "$folder"
	# else
	# 	"$folder already exists but is not a directory"
	# fi
	git clone https://github.com/munisanath/nodejs-webapp.git
	pwd
	(cd nodejs-webapp && docker build -t nodejs-webapp deployment/.)
	pwd
	(cd nodejs-webapp/deployment && docker-compose up -d)
	
}
sshpass -p "Suventure@2012$" ssh -o StrictHostKeyChecking=no azureadmin@itasset.southindia.cloudapp.azure.com "$(typeset -f run_commands); run_commands"