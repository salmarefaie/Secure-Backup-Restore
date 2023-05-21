# Secure-Backup-Restore

## Overview
There are two bash scripts that perform secure encrypted backup and restore functionality. The backup script should backup the directories and files within the target directory, each directory and file in a separate compressed tar file. Then, the gnupg tool should be used to encrypt the tar files in backup directory. After the backup is done, it
should be copied to a remote server. The restore script should work in a reverse way of backup script and restore a backup.


## Requirements
- The system should have the Bash interpreter installed. 
- Make sure that the gnupg tool is installed to encrypt and decrypt the files.



  ```
  
## Build Jenkins Image
- Custiomize jenkins image with kubectl and docker client are built from Docker file and pushed to ECR. 
- we will need kubectl and docker client in CI/CD Jenkins Pipeline.
  
![jenkins-image](https://github.com/salmarefaie/Application_on_EKS/assets/76884936/cd12a670-a80f-4702-a1e2-3f5a551d724d)

![jenkins-repo](https://github.com/salmarefaie/Application_on_EKS/assets/76884936/eba958fb-c3a1-4f96-b056-370fd8ca4da0)

## Install AWS CLI and kubectl using scripting
- we need to install aws cli and kubectl on ec2 bastion host to connect with EKS cluster using bastion host machine.
- we will connect with bastion host machine using ssh and transfare key to bastion host machine to connect with node worker through bastion host.

 ```bash      
    chmod 400 EKS.pem
    scp -i EKS.pem EKS.pem ec2-user@52.203.64.202:/home/ec2-user
    ssh -i "EKS.pem" ec2-user@52.203.64.202
  ```
  
- install kubectl and aws cli using scripting

 ```bash      
    scp -i EKS.pem install-packages.sh ec2-user@52.203.64.202:/home/ec2-user
    sh install-packages.sh
 ```

## Configuration using Ansible
- another way to install kubectl, aws cli on bastion host machine.
- make config file in ~/.ssh/config


- To run ansible code to machines
 
 ```bash
    cd ansible
    ansible-galaxy init roles/jenkinsDeployment
    ansible-galaxy init roles/aws-cli
    ansible-galaxy init roles/kubectl
    ansible-playbook playbook.yaml -i inventory.txt
 ```
 
 ## Connect to EKS cluster
 - To connect with EKS using ec2 machine, we will configure aws and then connect to the cluster.
 
 ```bash
    aws configure
    aws eks --region us-east-1 update-kubeconfig --name cluster
    kubectl get nodes or kubectl get services
 ```
 
 ## Deploy Jenkins on EKS Cluster
 - transfare yaml files from our machine to bastion host machine.
 
 ```bash
    scp -i EKS.pem Deployment.yaml ec2-user@52.203.64.202:/home/ec2-user
    scp -i EKS.pem Service.yaml ec2-user@52.203.64.202:/home/ec2-user
    scp -i EKS.pem pv.yaml ec2-user@52.203.64.202:/home/ec2-user
    scp -i EKS.pem pvc.yaml ec2-user@52.203.64.202:/home/ec2-user
    scp -i EKS.pem serviceAccount.yaml ec2-user@52.203.64.202:/home/ec2-user
    scp -i EKS.pem Role.yaml ec2-user@52.203.64.202:/home/ec2-user
    scp -i EKS.pem roleBinding.yaml ec2-user@52.203.64.202:/home/ec2-user
    scp -i EKS.pem Namespace.yaml ec2-user@52.203.64.202:/home/ec2-user
 ```
 - apply yaml files to deploy jenkins.
 
 ```bash
    kubectl apply -f namespace.yaml
    kubectl apply -f .
    kubectl get all -n jenkins
 ```
![jenkins](https://github.com/salmarefaie/Application_on_EKS/assets/76884936/eb9e45de-d9f0-41c2-b5bd-e6a005e18f09)

## Deploy Nginx ingress controller
- nginx ingress controller can be deployed by helm or kubernetess
- using helm
```bash
    helm upgrade --install ingress-nginx ingress-nginx 
    repo https://kubernetes.github.io/ingress-nginx 
    namespace ingress-nginx --create-namespace
 ```
 - using kubernetess
 ```bash
     kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.7.1/deploy/static/provider/cloud/deploy.yaml
 ```

## Deploy Python App
- we will deploy python app with redis on eks cluster using CI/CD jenkins pipeline.
- In CI phase, python app image is built and pushed to docker hub.
- In CD phase, python app with redis is deployed through nginx ingress.


## Steps for jenkins pipeline
- clone repo which have application, Docker file to build image and deployment files to deploy application.

```bash
   git clone https://github.com/salmarefaie/python-app-CI-CD.git
```

- make docker credentials 

- make pipeline with code which exists in repo (jenkinsfile)

- output from CI/CD phase 

![app](https://github.com/salmarefaie/Application_on_EKS/assets/76884936/d8e2db82-922f-4c2d-ae08-0cb9c2ae143d)
