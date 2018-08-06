#ssh-keygen -t  rsa -b 4096 -C 'nodejs-webapp@travis-ci.org' -f ./deploy_rsa

#ssh-copy-id -i deploy_rsa.pub azureadmin@104.211.299.97
echo "create this directory in azure"
mkdir test