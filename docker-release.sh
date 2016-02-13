docker_login_cmd=`aws ecr get-login --region us-east-1`
$docker_login_cmd
docker tag -f python3-base:develop 607520688049.dkr.ecr.us-east-1.amazonaws.com/python3-base:latest
docker push 607520688049.dkr.ecr.us-east-1.amazonaws.com/python3-base:latest
git push origin HEAD:master
