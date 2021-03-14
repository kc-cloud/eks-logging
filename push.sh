aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 452706865406.dkr.ecr.us-east-1.amazonaws.com
docker tag sample-web-app 452706865406.dkr.ecr.us-east-1.amazonaws.com/eks-test
docker push 452706865406.dkr.ecr.us-east-1.amazonaws.com/eks-test