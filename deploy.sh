sudo snap install kubectl --classic

export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)"
echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
sudo apt-get update && sudo apt-get install google-cloud-sdk


wget https://github.com/kubernetes/kops/releases/download/1.10.0/kops-linux-amd64
chmod +x kops-linux-amd64
sudo mv kops-linux-amd64 /usr/local/bin/kops
kops get cluster
kops export kubecfg --name ${KOPS_CLUSTER_NAME}

echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
docker build -t phoenixking25/obscura-backend:latest -t phoenixking25/obscura-backend:$SHA .
docker push phoenixking25/obscura-backend:latest
docker push phoenixking25/obscura-backend:$SHA

kubectl apply -f kubernetes
kubectl set image deployment/backend-deployment server=phoenixking25/obscura-backend:$SHA