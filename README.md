# Flink Streaming App

###  Install 
apt get mvn

sudo apt install docker.io
sudo usermod -a -G docker $(whoami)
docker ps
grep -E "^docker:" /etc/group | cut -d: -f4
grep -E "^docker:" /etc/group | cut -d: -f4
id -nG

curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube


### Build and Push Image
cd ~/ds/workspace/flink-streaming
docker login
./buildDocker.sh
docker build -t vjammi/flink:1.14.3-reactive-app .
docker push vjammi/flink:1.14.3-reactive-app
docker images

### kubectl cmds
minikube start
minikube kubectl get pods
minikube kubectl get services
minikube kubectl -- get po -A

### Cleanup
minikube stop
minikube delete

docker image rm a60d24ee20bf
docker image prune

sudo systemctl stop docker
sudo systemctl status docker
sudo apt remove docker.io

### References
Github
    https://stackoverflow.com/questions/43378060/meaning-of-the-github-message-push-declined-due-to-email-privacy-restrictions

Install Docker on Linux Mint 20.2 Mate Edition
    https://gist.github.com/cstroe/d56256091f98e836c1a3de59a66aaa72
    https://docs.docker.com/engine/reference/commandline/docker/
    https://hub.docker.com/repository/docker/vjammi/flink

Kubernetes/Minikube Setup
    https://kubernetes.io/releases/download/
    https://kubernetes.io/docs/setup/
    https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/
    https://kubernetes.io/docs/reference/kubectl/cheatsheet/
    https://minikube.sigs.k8s.io/docs/start/


Flink 
    https://nightlies.apache.org/flink/flink-docs-release-1.14/docs/deployment/resource-providers/native_kubernetes/
    https://github.com/apache/flink/tree/master/flink-examples/flink-examples-streaming/src/main/java/org/apache/flink/streaming/examples/windowing
'''
