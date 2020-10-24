
### To create the cluster
```
eksctl create cluster --name getting-started-eks \
--region us-east-2 \
--version 1.17 \
--managed \
--node-type t2.small \
--nodes 1 \
--node-volume-size 200 \
--ssh-access \
--ssh-public-key=Wahaj-ohio 
```

### agenda
```
Jenkins does deployment to the lambda functions. Jenkins-slave pod is triggered and does the deployment
```
```
After installing kubernetes-plugin for Jenkins

Go to Manage Jenkins | Bottom of Page | Cloud | Kubernetes (Add kubenretes cloud)
Fill out plugin values
Name: kubernetes
Kubernetes URL: https://kubernetes.default:443
Kubernetes Namespace: jenkins
Credentials | Add | Jenkins (Choose Kubernetes service account option & Global + Save)
Test Connection | Should be successful! If not, check RBAC permissions and fix it!
Jenkins URL: http://jenkins
Tunnel : jenkins:50000
Apply cap only on alive pods : yes!
Add Kubernetes Pod Template
Name: jenkins-slave
Namespace: jenkins
Service Account: jenkins
Labels: jenkins-slave (you will need to use this label on all jobs)
Containers | Add Template
Name: jnlp
Docker Image: aimvector/jenkins-slave
Command to run :
Arguments to pass to the command:
Allocate pseudo-TTY: yes
Add Volume
HostPath type
HostPath: /var/run/docker.sock
Mount Path: /var/run/docker.sock
Timeout in seconds for Jenkins connection: 300
```

### remote jenkins connection to kubernetes cluster
```
1- make sure you deploy the service account file (Jenkins folder) in the cluster 
2- Find the according secret generated: jenkins-token-xxxxxx
   From the k8s dashboard, we can get the "ca.crt" string and "token" string from the secret.
3- Configure jenkins cloud
In the "Kubernetes server certificate key" item, fill in the "ca.crt" string.
In the "Credentials" item, creat a credential of type "Secret text" or "OpenShift OAuth token"(even if we use the pure k8s), fill in the "token" string, then use the credential.
"Test Connection" should pass now.
```