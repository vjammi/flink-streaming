# Flink Streaming App

###  Install 
```
apt get mvn

sudo apt install docker.io
sudo usermod -a -G docker $(whoami)
docker ps
grep -E "^docker:" /etc/group | cut -d: -f4
grep -E "^docker:" /etc/group | cut -d: -f4
id -nG

curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
```

### Build and Push Image
```
cd ~/ds/workspace/flink-streaming
docker login
./buildDocker.sh
docker build -t vjammi/flink:1.14.3-reactive-app .
docker push vjammi/flink:1.14.3-reactive-app
docker images
```
### kubectl cmds
```
minikube start
minikube kubectl get pods
minikube kubectl get services
minikube kubectl -- get po -A
```
### 
```
minikube ssh 'sudo ip link set docker0 promisc on'
minikube dashboard
kubectl create namespace reactive
kubectl config set-context --current --namespace=reactive
```

### launch
```
kubectl apply -f flink-configuration-configmap.yaml
kubectl apply -f jobmanager-application.yaml
kubectl apply -f jobmanager-rest-service.yaml
kubectl apply -f jobmanager-service.yaml
kubectl apply -f taskmanager-job-deployment.yaml
```

### Cleanup
```
docker image rm <id>
docker image prune
```
### Undeploy
```
kubectl delete -f flink-configuration-configmap.yaml
kubectl delete -f jobmanager-application.yaml
kubectl delete -f jobmanager-rest-service.yaml
kubectl delete -f jobmanager-service.yaml
kubectl delete -f taskmanager-job-deployment.yaml
```

### UnInstall
```
minikube stop
minikube delete

sudo systemctl stop docker
sudo systemctl status docker
sudo apt remove docker.io
```

### References
```
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
    https://github.com/rmetzger/flink-reactive-mode-k8s-demo
    https://nightlies.apache.org/flink/flink-docs-release-1.14/docs/deployment/resource-providers/native_kubernetes/
    https://github.com/apache/flink/tree/master/flink-examples/flink-examples-streaming/src/main/java/org/apache/flink/streaming/examples/windowing
```

### Start Minikube
```
😄  minikube v1.25.1 on Linuxmint 20.3 (vbox/amd64)
✨  Using the docker driver based on existing profile
👍  Starting control plane node minikube in cluster minikube
🚜  Pulling base image ...
🔄  Restarting existing docker container for "minikube" ...
🐳  Preparing Kubernetes v1.23.1 on Docker 20.10.12 ...
    ▪ kubelet.housekeeping-interval=5m
    ▪ Generating certificates and keys ...
    ▪ Booting up control plane ...
    ▪ Configuring RBAC rules ...
🔎  Verifying Kubernetes components...
    ▪ Using image gcr.io/k8s-minikube/storage-provisioner:v5
🌟  Enabled addons: storage-provisioner, default-storageclass
💡  kubectl not found. If you need it, try: 'minikube kubectl -- get pods -A'
🏄  Done! kubectl is now configured to use "minikube" cluster and "default" namespace by default

```

###./buildDocker.sh
```
java.lang.ClassLoader.defineClass(java.lang.String,byte[],int,int,java.security.ProtectionDomain)
[INFO] Scanning for projects...
[INFO] 
[INFO] ----------------< org.apache.flink:flink-reactive-app >-----------------
[INFO] Building Flink Reactive App 1.0
[INFO] --------------------------------[ jar ]---------------------------------
[INFO] 
[INFO] --- maven-clean-plugin:2.5:clean (default-clean) @ flink-reactive-app ---
[INFO] Deleting /home/vjammi/ds/workspace/flink-streaming/flink-reactive-app/target
.
.
.
[INFO] Installing /home/vjammi/ds/workspace/flink-streaming/flink-reactive-app/dependency-reduced-pom.xml to /home/vjammi/.m2/repository/org/apache/flink/flink-reactive-app/1.0/flink-reactive-app-1.0.pom
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time:  6.895 s
[INFO] Finished at: 2022-02-04T16:10:57-05:00
[INFO] ------------------------------------------------------------------------
Sending build context to Docker daemon  26.02MB
Step 1/2 : FROM apache/flink:1.14.3-scala_2.12-java8
 ---> a19e03dc73a3
Step 2/2 : COPY flink-reactive-app/target/flink-reactive-app-1.0.jar /opt/flink/usrlib/flink-reactive-app-1.0.jar
 ---> 64e6420e4af6
Successfully built 64e6420e4af6
Successfully tagged vjammi/flink:1.14.3-reactive-app
The push refers to repository [docker.io/vjammi/flink]
ef5485a91361: Pushed 
c8b33c007901: Layer already exists 
65602ef06f3e: Layer already exists 
e827ff71c043: Layer already exists 
a9711e0a60ea: Layer already exists 
10c287fa01fe: Layer already exists 
3be67cf73913: Layer already exists 
b4cfcb8385a8: Layer already exists 
2b730cf18c09: Layer already exists 
edeaba958753: Layer already exists 
8bf42db0de72: Layer already exists 
31892cc314cb: Layer already exists 
11936051f93b: Layer already exists 
1.14.3-reactive-app: digest: sha256:175a5d179e31264764e5b006e5a597ef5993145fff32c39f65cd8a42ff15c1e5 size: 3052
vjammi@linux-mint:~/ds/workspace/flink-streaming$

```
