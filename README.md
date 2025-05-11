# CICD project
A simple CICD pipeline to deploy a Simple React frontend app to AWS S3. Jenkins server is hosted on AWS EC2. A Jenkins pipeline job is created to checkout the code from Git Repo, installing dependencies and build and deploy the new build to S3 bucket using AWS CLI. This pipeline will be trigger by code push to Github.

## React Frontend App
This simple frontend was bootstrapped with [Create React App](https://github.com/facebook/create-react-app).

## Static web hosting on AWS S3 bucket
AWS S3 resource is created using the cloudformation temple file in the aws folder. The URL for static hosting website is shown in S3 bucket's properties tab under Static website hosting->bucket website endpoint

## Jenkins server on AWS EC2
Jenkins server will be host on AWS EC2.

### AWS EC2
AWS EC2 is use to host the Jenkins server. Create AWS EC2 resource using the cloudformation template in the aws folder.

### Running script.sh
Access EC2 via SSH, execute script.sh to install Java, Jenkins, Git, AWS CLI, nodes, npm on EC2.

### Setup Jenkins server
- Default Jenkins url will be EC2 http://ec2publicIpAddress:8080 
- Login with admin password and complete the first time installation.
- Create a new item, pipeline, Triggers - GitHub hook trigger for GITScm polling 
- Pipeline script - reference Jenkinsfile 
    1. code checkout
    2. install dependencies 
    3. build and 
    4. deploy to S3 
- Install Jenkins plugin "github integration" 

## Setup Github webhook
- Login your github account 
- goto code repo -> setting 
- Webhooks Add web Payload URL -> http://ec2publicIpAddress:8080/github-webhook/ 
- Webhooks Content type set to Application/json 

## Setup AWS CLI 
- IAM role must be created for this use
- Configure aws CLI
- Create a .aws folder in /var/lib/jenkins
- Add 2 files, configure and credentials in .aws folder

## Usage
- Update code and push to Github repo.
- Jenkins will be trigger to deploy new frontend build to S3 bucket